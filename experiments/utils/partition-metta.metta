;;Checks if **all elements** of $lst are in $used
(= (all-in $lst $used)
   (if (== $lst ())
       True
       (let* (($head (car-atom $lst))) (if (not (== ((intersection-atom ($head) $used)) (())))
           (all-in (cdr-atom $lst) $used)
           False))))


Generates all subsets (the powerset) of a given list
;; Example:  (powerset (a b)) → (() (b) (a) (a b))

(= (powerset $lst)
   (if (== $lst ())
       (())                              ; only subset of empty list
       (let* (
          (($head $tail) (decons-atom $lst))
          ($ps-tail   (powerset $tail)) ; subsets of tail
          ($with-head (map-atom $ps-tail $s (cons-atom $head $s))) ; prepend head to each
         )
         (union-atom $ps-tail $with-head) ; union of both halves
       )
   )
)

;;Checks if **any element** of $lst is in $used
(= (any-in $lst $used)
   (if (== $lst ())
       False
       (let* (($head (car-atom $lst)))(if (not (== ((intersection-atom ($head) $used)) (())))
           True
           (any-in (cdr-atom $lst) $used)))))


;the subset can't be an empty set or the orginal set itself
(= (valid-subset $subset $original)
   (and (not (== $subset ()))
        (not (== $subset $original))))  

=========================================================================================
;;This function explores all combinations of valid, 
;;disjoint subsets that together cover the original list exactly once. It ensures:
;;No repetition.
;;No subset is empty or equal to the full set.
;;Each partition is complete (checked by all-in in partitions-helper).

; Collect partitions by trying each valid subset
(= (partitions-collect $subsets $original $current $used)
   (if (== $subsets ())
       ()
       (let ($subset $rest) (decons-atom $subsets)   
         (if (and (valid-subset $subset $original)
                  (not (any-in $subset $used)))     ;; ((a b) ( c))
             (let* (
                    ($first (partitions-helper $subsets $original (cons-atom $subset $current) (union-atom $used $subset)))
                      ($second (partitions-collect $rest $original $current $used)))
                        (union-atom $first $second))
             (partitions-collect $rest $original $current $used)))))

 ; Recursive helper
(= (partitions-helper $subsets $original $current $used)
   (if (all-in $original $used)
       ($current)
       (partitions-collect $subsets $original $current $used)))            


; Main: Generate all partitions
(= (partitions $subsets $original)
   (partitions-helper $subsets $original () ()))


;; ==============================================================================
;; Function: partitions
;; Purpose: Computes all valid **partitions** of a given list (set pattern)
;;
;; Parameters:
;;   $original  - The original list to be partitioned
;;
;; How it works:
;; 1. Computes the powerset of the original list:
;;    (powerset $original)
;;    - Generates all possible subsets of the list, including empty and full
;;    - This forms the pool of candidates from which partitions will be constructed
;;
;; 2. Filters and selects subsets to build partitions:
;;    - Uses only those subsets which are:
;;        a. Non-empty
;;        b. Not equal to the full original set
;;        c. Disjoint from subsets already used
;;    - Avoids duplicate element usage across subsets
;;
;; 3. Recursively assembles valid partitions:
;;    (partitions-helper ...) and (partitions-collect ...)
;;    - Tracks current partition in progress and used elements
;;    - Recursion continues until all elements of the original list are covered
;;
;; 4. Ensures full coverage:
;;    (all-in $original $used)
;;    - Final partitions are those where all original elements are included exactly once
;;
;; Key Helper Functions:
;;   - powerset: Generates all subsets
;;   - valid-subset: Filters out empty and full-set subsets
;;   - all-in / any-in: Check coverage and overlaps
;;   - partitions-collect: Core function to explore subset combinations
;;
;; Return Value:
;;   Returns a list of valid partitions, where each partition is a list of 
;;   disjoint, non-empty subsets that together cover the original list.
;;
;; Typical Usage:
;;   Used in probability estimation, pattern decomposition, or symbolic reasoning
;;   tasks where exhaustive enumeration of all disjoint covers is required.
;; ==============================================================================
(:partitions (-> list_of_patterns partitions))
(=(partitions $original) (partitions (powerset $original) $original))

!(partitions ((Inheritance $x man) (Inheritance $x sodaDrinker) (Inheritance $x ugly)))