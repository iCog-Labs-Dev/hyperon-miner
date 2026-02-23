# Mork Interface Integration Documentation

## Summary

This branch introduces a `&mork`-backed namespace interface and migrates the mining, surprisingness, and truth-value code to use it. The goal is to keep all data in a single `&mork` space while still separating logical spaces (`&db`, `&kb`, `&specspace`, `&cndpspace`, etc.) using a `(ns <namespace>)` prefix.

## Mork Interface Functions (What Each Does)

File: `experiments/utils/mork-interface.metta`

Function: `match-&mork $pattern $Pat`
Executes a `match` in `&mork` and returns `$Pat`. Used to force evaluation in `&mork` before returning.
```metta
(= (match-&mork $pattern $Pat) 
   (quote (progn (match &mork $pattern $pattern)
          $Pat)))
```

Function: `match-&mork-conj $ConjPattern $Out`
Supports conjunction matching via `exec` in `&mork`. It temporarily adds an `exec` atom that stores results into `(tmpResult $Out)`, runs `mm2-exec`, reads results, then removes the temporary atom.
```metta
(= (match-&mork-conj $ConjPattern $Out)
   (let* (
          ($_1 (add-atom &mork
                 (exec 0
                       $ConjPattern
                       (, (tmpResult $Out)))))

          ($_ (mm2-exec &mork 1))        
          ($R  (match &mork (tmpResult $Out) $Out))
          ($_2 (remove-atom &mork
                 (exec 0
                       $ConjPattern
                       (, (tmpResult $Out)))))
         
         )
        $R))
```

Function: `null? $x`
Utility: returns `True` if `$x` is empty list `()`.
```metta
(= (null? $x)
    (if (== $x ())
       True
       False))
```

Function: `make-ns-atom $namespace $atom`
Wraps any atom with namespace prefix. Returns `((ns $namespace) $atom)`.
```metta
(= (make-ns-atom $namespace $atom)
   ((ns $namespace) $atom))
```

Function: `get-atom-from-ns ((ns $ns) $rest)`
Removes namespace wrapper and returns the raw atom.
```metta
(= (get-atom-from-ns ((ns $ns) $rest))
   $rest)
```

Function: `is-comma-pattern $pattern`
Detects whether a pattern is a conjunction (comma operator `,` at head).
```metta
(= (is-comma-pattern $pattern)
    (and (== (get-metatype $pattern) Expression)
            (== (car-atom $pattern) ,)))
```

Function: `get-pattern-rest $pattern`
Returns the tail of an expression using `cdr-atom`.
```metta
(= (get-pattern-rest $pattern)
   (cdr-atom $pattern))
```

Function: `wrap-with-ns $namespace $pattern`
Wraps a pattern into namespace: `((ns $namespace) $pattern)`.
```metta
(= (wrap-with-ns $namespace $pattern)
   ((ns $namespace) $pattern))
```

Function: `wrap-comma-patterns $namespace $comma-pattern`
Wraps each element of a conjunction pattern with the namespace prefix.
```metta
(= (wrap-comma-patterns $namespace $comma-pattern)
    (let* ((($head $tail) (decons-atom $comma-pattern)))
       (cons-atom $head (wrap-comma-patterns-recursive $namespace $tail))))
```

Function: `wrap-comma-patterns-recursive $namespace $rest`
Recursive helper for `wrap-comma-patterns`.
```metta
(= (wrap-comma-patterns-recursive $namespace $rest)
    (if (== $rest ())
       ()
       (let* ((($current $remaining) (decons-atom $rest)))
          (cons-atom (wrap-with-ns $namespace $current)
                         (wrap-comma-patterns-recursive $namespace $remaining)))))
```

Function: `add-atom-custom $namespace $atom`
Adds an atom into `&mork` under a namespace: `(add-atom &mork ((ns $namespace) $atom))`.
```metta
(= (add-atom-custom $namespace $atom)
   (add-atom &mork ((ns $namespace) $atom)))
```

Function: `get-atoms-custom $namespace`
Reads all atoms in a namespace from `&mork`.
```metta
(= (get-atoms-custom $namespace)
   (match &mork ((ns $namespace) $rest) $rest))
```

Function: `match-custom $namespace $pattern $output`
Namespace-aware match. If `$pattern` is a conjunction (`,`) it wraps all patterns and calls `match-&mork-conj`. Otherwise, it does a standard match in `&mork` with namespace wrapper.
```metta
(= (match-custom $namespace $pattern $output)
   (if (is-comma-pattern $pattern)
     (let* (
      ($wrapped-pattern (wrap-comma-patterns $namespace $pattern))
      )
       (match-&mork-conj $wrapped-pattern $output))
     (match &mork ((ns $namespace) $pattern) $output)))
```

Function: `remove-atom-custom $namespace $atom`
Removes an atom from a namespace in `&mork`.
```metta
(= (remove-atom-custom $namespace $atom)
   (remove-atom &mork ((ns $namespace) $atom)))
```

Function: `count-custom $namespace`
Returns number of atoms in a namespace.
```metta
(= (count-custom $namespace)
   (size-atom (collapse (match &mork ((ns $namespace) $x) $x))))
```

Function: `db-size-custom $namespace`
Alias for `count-custom`.
```metta
(= (db-size-custom $namespace)
   (count-custom $namespace))
```

Function: `counter-custom $namespace $pattern`
Returns tuple count for a pattern in a namespace.
```metta
(= (counter-custom $namespace $pattern)
   (tuple-count (collapse (match-custom $namespace $pattern $pattern))))
```

Function: `sup-num-custom $namespace $pattern`
Alias for `counter-custom`.
```metta
(= (sup-num-custom $namespace $pattern)
   (counter-custom $namespace $pattern))
```

Function: `sup-eval-custom $namespace $pattern $ms`
Evaluates if support meets minimum threshold.
```metta
(= (sup-eval-custom $namespace $pattern $ms)
   (let $sup (counter-custom $namespace $pattern)
      (if (>= $sup $ms) True False)))
```

Function: `universe-count-custom $pattern $namespace`
Computes |U|^k using namespace size and number of conjuncts.
```metta
(= (universe-count-custom $pattern $namespace)
   (pow-math (db-size-custom $namespace) (n_conjuncts $pattern)))
```

Function: `mork-load-space $namespace $fromSpace`
Copies atoms from a real space into `&mork` namespace.
```metta
(= (mork-load-space $namespace $fromSpace)
   (collapse (match $fromSpace $atom (add-atom-custom $namespace $atom))))
```

Function: `mork-clear-namespace $namespace`
Removes all atoms from a namespace in `&mork`.
```metta
(= (mork-clear-namespace $namespace)
   (collapse (match &mork ((ns $namespace) $atom)
                  (remove-atom &mork ((ns $namespace) $atom)))))
```

Function: `mork-replace-namespace $namespace $fromSpace`
Clears then reloads a namespace from a real space.
```metta
(= (mork-replace-namespace $namespace $fromSpace)
   (let* (($_ (mork-clear-namespace $namespace)))
     (mork-load-space $namespace $fromSpace)))
```

Function: `list-namespace $namespace`
Lists all atoms in a namespace.
```metta
(= (list-namespace $namespace)
   (match &mork ((ns $namespace) $atom) $atom))
```

## How Each Function Was Integrated (What We Replaced)

This section maps old space operations to their `&mork` equivalents.

- `match <space> ...`
  Replaced with `match-custom <namespace> ...` or `match-&mork ((ns <namespace>) ...)` when matching directly in `&mork`.

- `add-atom <space> <atom>`
  Replaced with `add-atom-custom <namespace> <atom>`.

- `remove-atom <space> <atom>`
  Replaced with `remove-atom-custom <namespace> <atom>`.

- `get-atoms <space>`
  Replaced with `get-atoms-custom <namespace>`.

- `db_size <space>`
  Replaced with `db-size-custom <namespace>`.

- `sup-num <space> <pattern>`
  Replaced with `sup-num-custom <namespace> <pattern>`.

- `universe-count <pattern> <space>`
  Replaced with `universe-count-custom <pattern> <namespace>`.

- Conjunction queries using `,`
  Routed through `match-custom` which wraps each conjunct using `(ns <namespace>)` and uses `match-&mork-conj`.

## Where the Mork Interface Was Used (Human-Readable Summary)

- Frequent Pattern Miner: switched all pattern matching, support counts, and candidate storage to namespace-aware functions so `&dbspace`, `&specspace`, `&cndpspace`, and `&conjspace` live inside `&mork`.
- Pattern Miner: surprisingness and KB updates now use `match-custom` and `add-atom-custom`, and the DB copy into `&dbspace` uses `get-atoms-custom`.
- Surprisingness + Truth-Values: replaced direct database size queries and support counts with namespace-aware versions, and updated subsampling utilities to work on namespaced data.
- Tests: most tests now import `mork-interface` and load `&db`/`&kb` into namespaces using `mork-load-space` or `mork-replace-namespace` before running assertions.

## How To Use Mork (Quick Recipe)

1. Initialize `&mork`: `!(mm2-exec &mork 1)`
2. Load a space: `!(mork-load-space &db &db)` or `!(mork-replace-namespace &kb &kb)`
3. Read data: `!(match-custom &db (Pattern $x) $x)`
4. Write data: `!(add-atom-custom &db (Pattern ...))`
5. Remove data: `!(remove-atom-custom &db (Pattern ...))`

## New/Updated Data Helpers

- `experiments/data/bio.metta`, `experiments/data/bio_50.metta`, `experiments/data/new_data.metta`: new datasets for bio runs.
- `scripts/extract_lines.py`: utility for making N-line subsets (e.g., 50k, 15k, 10k).

## Results Placeholders (Post-Mork Integration)

Use the sections below to record outcomes after running with different bio datasets.

### 100K Bio Data

- Run data file: `experiments/data/bio.metta`
- Command: `time sh run.sh ../hyperon-miner/experiments/pattern-miner/tests/test-pattern-miner.metta`
- Runtime: `Process killed before completion`

### 50K Bio Data

- Run data file: `experiments/data/bio_50.metta`
- Command: `time sh run.sh ../hyperon-miner/experiments/pattern-miner/tests/test-pattern-miner.metta`
- Runtime: `Process killed before completion`

### 15K Bio Data

- Run data file: `experiments/data/bio_15.metta`
- Command: `time sh run.sh ../hyperon-miner/experiments/pattern-miner/tests/test-pattern-miner.metta`
- Runtime: `real 72m18.669s, user 63m33.684s, sys 10m37.717s`

### 10K Bio Data

- Run data file: `experiments/data/bio_10.metta`
- Command: `time sh run.sh ../hyperon-miner/experiments/pattern-miner/tests/test-pattern-miner.metta`
- Runtime: `real 91m19.340s, user 85m25.566s, sys 6m16.267s`
