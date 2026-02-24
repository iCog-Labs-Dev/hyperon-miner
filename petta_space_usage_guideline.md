# PeTTa Space Usage Guideline

## 1. Avoid Unbounded Atom Space Growth

Every `add-atom` assertz's a Prolog fact permanently. Be deliberate:

```metta
; BAD: accumulates facts forever
(= (log-step $x) (add-atom &self (visited $x)))

; BETTER: remove when done
(= (log-step $x) (add-atom &self (visited $x)))
(= (cleanup $x)  (remove-atom &self (visited $x)))
```

Also avoid patterns that add duplicate atoms — PeTTa doesn't deduplicate, so `add-atom` called twice adds two facts.

---

## 2. Prefer Tail Recursion

PeTTa compiles MeTTa to Prolog clauses, so Prolog's last-call optimization applies. Structure recursion so the recursive call is in tail position:

```metta
; BAD: builds stack - cons wraps the recursive result
(= (sum-list $acc ($h $t)) (sum-list (+ $acc $h) $t))
; Make sure the recursive call is the FINAL operation, not wrapped

; GOOD: accumulator pattern
(= (sum-list $acc ())      $acc)
(= (sum-list $acc ($h $t)) (sum-list (+ $acc $h) $t))
```

---

## 3. Use `superpose` + `collapse` Carefully

`superpose` is nondeterministic and can cause Prolog to keep choice points open, holding memory for backtracking:

```metta
; BAD: keeps all choice points alive simultaneously
(= (process) (superpose (big-list)))

; BETTER: collapse eagerly when you only need the results as a list
!(collapse (process))
```

If you only need one result, use `match` with a cut-equivalent pattern rather than collapsing everything.

---

## 4. Avoid Repeated HOF Calls with the Same Arguments

The specializer in `specializer.pl` creates a new specialized predicate per unique HOF+argument combination and `assertz`s it. If you call many distinct lambdas or partial applications, you accumulate specializations:

```metta
; BAD: generates a new specialization for every distinct F
(= (apply-all $f $list) (map-atom $list $f))

; BETTER: define concrete functions and call them directly
(= (double $x) (* 2 $x))
(= (process $list) (map-atom $list double))
```

You can also call `invalidate_specializations` from Prolog side if you're dynamically redefining functions in a loop.

---

## 5. Use States Instead of Accumulating Facts

For mutable counters or accumulators, `bind!`/`change-state!` uses `nb_setval` which is O(1) memory rather than growing the fact database:

```metta
; BAD: grows &self with a new fact each update
(= (increment) (add-atom &self (count 1)))

; GOOD: single slot in global state
!(bind! &counter (new-state 0))
(= (increment) (change-state! &counter (+ (get-state &counter) 1)))
```

---

## 6. Avoid Large Intermediate Lists

`collapse` materializes all solutions into a list at once. For large result sets this is expensive:

```metta
; BAD: materializes everything then takes first
(= (first-match $pat) (car-atom (collapse (match &self $pat $pat))))

; BETTER: use match directly - it's lazy/nondeterministic
(= (first-match $pat) (match &self $pat $pat))
```

---

## 7. Control Stack Depth via `run.sh`

The default stack is 8GB (`--stack_limit=8g`). You can tune this per workload:

```sh
# For smaller workloads
swipl --stack_limit=512m -q -s src/main.pl -- yourfile.metta

# Stack is shared between local (call stack) and global (heap terms)
# Add --local and --global flags for finer control
swipl --stack_limit=2g --local=512m --global=1500m ...
```

---

## 8. Clean Up Dynamic Clauses from Redefinitions

Every time you redefine a function at runtime, old compiled Prolog clauses linger unless explicitly removed. Use `remove-atom` before redefining:

```metta
(= (redefine-f)
   (remove-atom &self (= (my-func $x) (old-body $x)))
   (add-atom    &self (= (my-func $x) (new-body $x))))
```

---

## Summary Priority Order

| Priority  | Action                                                                             |
| --------- | ---------------------------------------------------------------------------------- |
| 🔴 High   | Use accumulator-style tail recursion                                               |
| 🔴 High   | `remove-atom` anything you no longer need                                          |
| 🟠 Medium | Prefer `change-state!` over fact accumulation for counters/state                   |
| 🟠 Medium | Avoid `collapse` on large/infinite solution sets                                   |
| 🟡 Low    | Use concrete functions instead of dynamic HOF calls to limit specialization growth |
| 🟡 Low    | Tune `--stack_limit` for your actual workload                                      |
