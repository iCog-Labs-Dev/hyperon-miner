## Codebase Overview: MeTTa Pattern Miner

This is a **frequent pattern mining** system implemented in MeTTa — essentially an Apriori-style algorithm over an atom space (knowledge graph). It mines frequent subgraph patterns and scores them for surprisingness.

---

## Pipeline Architecture

```
pattern-miner (entry point)
    │
    ├─ 1. Load DB → &dbspace (flat atom facts)
    │
    ├─ 2. abstract-pattern
    │       └─ find unique link types → compute support → store AbstractPattern
    │
    ├─ 3. build-specialization  [build-specialization.metta]
    │       └─ depth-handler → generate specialized variants → store SpecializationOf
    │
    ├─ 4. candidatePattern      [candidate-patterns.metta]
    │       └─ filter specializations by minsup → store CandidatePattern
    │
    ├─ 5. conjunct (optional)   [conjunction-expansion.metta]
    │       └─ do-conjunct (Peano-depth recursion)
    │           └─ expand_conjunction → alpha_convert → checker → remove redundants
    │
    └─ 6. formatter / call-surprisingness [pattern-miner.metta]
            └─ isurp / jsd scoring → add surprisingnessOf to KB
```

---

## Memory Problems — Identified Issues

### 🔴 Critical

**1. `collapse` on unbounded nondeterminism in `frequency-pattern-miner`**

```metta
($abs  (collapse (abstract-pattern ...)))
($var  (collapse (match-&mork ... (build-specialization ...))))
($temp2 (collapse (candidatePattern ...)))
($temp3 (if $cnj_exp (collapse (conjunct ...)) $temp2))
```

Every stage wraps in `collapse`, which **materializes every solution into a list simultaneously**. For a DB with many link types and nodes, `build-specialization` alone generates 3 specializations per DB match per abstract pattern — all held in RAM at once.

**2. `depth-handler` explosive branching via `superpose`**

```metta
(superpose (
    ($link (superpose $nx) $w)   ; fresh unbound $w
    ($link $z (superpose $ny))   ; fresh unbound $z
    ($link $x $u)                ; fresh unbound $u
    ($link $k $y)                ; fresh unbound $k
    $d                           ; completely unbound!
    (if (== $x $y) ($link $g $g) ($link $g $o))  ; more unbound vars
    ($link (superpose $nx) (superpose $ny))
))
```

This generates a **combinatorial explosion** — 7 branches, some with nested `superpose ($nx)` and `superpose ($ny)` inside, meaning the number of results is `|nx| × |ny| + ...`. All of these are then fed into `build-specialization` which collapses them. With a large DB, this is the primary memory bomb.

**3. Redundant remove+add cycle in `build-specialization`**

```metta
(remove-atom-custom $specspace $spec1)
(add-atom-custom    $specspace $spec1)
(remove-atom-custom $specspace $spec2)
(add-atom-custom    $specspace $spec2)
(remove-atom-custom $specspace $spec3)
(add-atom-custom    $specspace $spec3)
```

This is 6 space operations per DB match. If match returns N results from the DB and depth-handler branches M times, you're doing `6 × N × M` space writes. Old atoms accumulate between remove and re-add cycles since this runs inside `superpose`.

**4. `do-conjunct` re-fetches all candidate patterns at every recursion depth**

```metta
($matches (match-&mork ((ns $cndb) (CandidatePattern $pattern $cnt)) (replacev $pattern)))
```

This is called at **every Peano depth level** (`Z`, `S Z`, `S (S Z)` ...), re-scanning the entire `$cndpspace` from scratch each time with no caching.

---

### 🟠 Significant

**5. `consolidate_helper` builds lists with `concatTuple` quadratically**

```metta
(concatTuple ( ($key ...)) (address_conflict $tail $cnjtion_vars))
```

`concatTuple` on every recursive call builds a new tuple each time — O(n²) in list length. In alpha conversion this runs on every variable in every pattern.

**6. `formatter` collapses everything then `unique-atom` deduplicates**

```metta
($sortedlist (unique-atom (collapse (match-&mork ((ns $conjspace) $pattern) (sort_conj $pattern)))))
```

Materializes the entire conjunction space into one list, sorts, then deduplicates — all in memory at peak simultaneously.

**7. `&dbspace` is populated with `collapse` + loop in `pattern-miner`**

```metta
($dummy (collapse (let ($link $x $y) (get-atoms-custom $db) (add-atom-custom &dbspace ($link $x $y)))))
```

This loads the whole DB into `&dbspace` as a duplicate copy. If the original `$db` already has the atoms, you now have two full copies in memory.

---

### 🟡 Minor

**8. `println!` inside every hot path**

`abstract-pattern`, `build-specialization`, `candidatePattern`, `do-conjunct` all print on every iteration. `println!` returns `true` as a term which creates a small allocation each time, and more importantly keeps choice points alive in the call stack during verbose execution.

**9. `address_conflict` is not tail-recursive**

```metta
(concatTuple ( ($head ...)) (address_conflict $tail $cnjtion_vars))
```

The recursive call is wrapped in `concatTuple`, so the stack grows linearly with the number of variables.

---

## Concrete Recommendations

### 1. Stream instead of collapse in the pipeline

```metta
; CURRENT - holds all results in RAM:
($var (collapse (match-&mork ... (build-specialization ...))))

; BETTER - process one at a time, side-effect only:
(match-&mork ((ns $aptrnspace) (AbstractPattern $pattern))
    (build-specialization $pattern $dbspace $specspace))
```

Since `build-specialization` only does `add-atom-custom` side effects, you don't need to collect its results at all. Drop the `collapse` and the binding.

### 2. Limit `depth-handler` branching

The 7-branch `superpose` with unbound variables (`$d`, `$w`, `$z`, `$u`, `$k`) creates garbage terms that get stored. Restrict to only the branches you actually use:

```metta
; Instead of 7 branches, use only the 3 meaningful ones:
(superpose (
    ($link (superpose $nx) $y)         ; specialize x only
    ($link $x (superpose $ny))         ; specialize y only
    ($link (superpose $nx) (superpose $ny))  ; specialize both
))
```

Remove the 4 branches with completely unbound variables (`$d`, `$w`, `$z`, `$u`, `$k`) — these generate meaningless patterns that still get support-checked and stored.

### 3. Avoid the double DB copy

```metta
; CURRENT: copies entire DB into &dbspace
($dummy (collapse (let ($link $x $y) (get-atoms-custom $db)
                   (add-atom-custom &dbspace ($link $x $y)))))

; BETTER: use $db directly if match-custom supports it,
; or lazily populate &dbspace only when queried
```

If `&dbspace` is only needed because `match-&mork` requires a MORK space, populate it once at startup outside the `pattern-miner` function so it isn't re-created on repeated calls.

### 4. Cache candidate patterns in `do-conjunct`

```metta
; CURRENT: re-scans $cndpspace at every depth level
; BETTER: pass the candidate list as a parameter
(= (do-conjunct $db $cndb $candidates $coming_conj $ms Z)
    ...)
(= (do-conjunct $db $cndb $candidates $coming_conj $ms (S $K))
    (let* (
        ($listconj (expand_conjunction $conjunct $candidates $db $ms 2 False))
        ...
        ($conj (do-conjunct $db $cndb $candidates $fitlered $ms $K))
    ) $conj))

; At entry point, collapse candidates ONCE:
(= (conjunct $dbspace $cndpspace $conjspace $minsup $depth)
    (let $candidates (collapse (match-&mork ((ns $cndpspace) (CandidatePattern $p $c)) (replacev $p)))
         (match-&mork ((ns $cndpspace) (CandidatePattern $pattern $cnt))
             (do-conjunct $dbspace $cndpspace $candidates $pattern $minsup (fromNumber $depth)))))
```

### 5. Make `address_conflict` tail-recursive with an accumulator

```metta
; CURRENT: non-tail recursive
(= (address_conflict $pattern_vars $cnjtion_vars)
    (address_conflict_acc $pattern_vars $cnjtion_vars ()))

(= (address_conflict_acc () $cnjtion_vars $acc) $acc)
(= (address_conflict_acc $vars $cnjtion_vars $acc)
    (let* (
        ($head (car-atom $vars))
        ($tail (cdr-atom $vars))
        ($entry (if (does_exist $head $cnjtion_vars)
                    ($head (generateRandomVar))
                    ($head $head)))
        ($newacc (concatTuple ($entry) $acc))
    )
    (address_conflict_acc $tail $cnjtion_vars $newacc)))
```

### 6. Remove `println!` from hot loops for production runs

```metta
; Wrap in a debug flag:
(= (debug-print $msg) (if $debug-mode (println! $msg) ()))

; Or pass silent flag through and check it:
(= (abstract-pattern $dbspace $minsup $aptrnspace $cndpspace $verbose)
    (let* (
        (true (if $verbose (println! "==== Abstract Pattern started =====") ()))
        ...
    ) ...))
```

---

## Summary Table

| Issue                                                | File                           | Severity       | Fix                                                                      |
| ---------------------------------------------------- | ------------------------------ | -------------- | ------------------------------------------------------------------------ |
| `collapse` on all pipeline stages                    | `frequent-pattern-miner.metta` | 🔴 Critical    | Stream with nondeterminism, drop collapse where only side-effects needed |
| `depth-handler` 7-branch superpose with unbound vars | `build-specialization.metta`   | 🔴 Critical    | Reduce to 3 meaningful branches                                          |
| Full DB duplicated into `&dbspace`                   | `pattern-miner.metta`          | 🔴 Critical    | Populate once, or use original space directly                            |
| `do-conjunct` re-scans candidates every depth        | `conjunction-expansion.metta`  | 🟠 Significant | Collapse candidates once, pass as arg                                    |
| `concatTuple` in `address_conflict` is O(n²)         | `conjunction-expansion.metta`  | 🟠 Significant | Accumulator pattern                                                      |
| `formatter` collapses entire conjunction space       | `conjunction-expansion.metta`  | 🟠 Significant | Stream results instead                                                   |
| `println!` in every hot loop                         | All files                      | 🟡 Minor       | Debug flag guard                                                         |
