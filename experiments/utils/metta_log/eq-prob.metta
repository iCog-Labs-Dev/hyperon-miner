(= (connected-subpatterns-with-var $partition $var)
    (filter-blocks-with-var $partition $var ()))

;; Helper function to filter blocks recursively
(= (filter-blocks-with-var $partition $var $acc)
    (if (== $partition ())
        $acc
        (let* (
            ($current-block (car-atom $partition))
            ($remaining-blocks (cdr-atom $partition))
            ($connected-sub (connected-subpattern-with-var $current-block $var))
        )
        (if (== $connected-sub ())
            ;; No connected subpattern found, continue with next block
            (filter-blocks-with-var $remaining-blocks $var $acc)
            ;; Found connected subpattern, add to accumulator
            (let $new-acc (union-atom $acc ($connected-sub))
                (filter-blocks-with-var $remaining-blocks $var $new-acc)
            )
        ))))

(= (connected-subpattern-with-var $block $var)
    (if (not (is-var-exist $block $var))
        ()  ;; Variable not in block, return empty
        $block   ; TODO: we can extract one step down using extract function 
        ))

(= (extract $exp $var)  (
    if (var-exist-exp $exp $var) 
    $exp
    (empty)
    
))

(= (find-component-with-var $components $var)
    (collapse (extract (superpose $components) $var))
)










;; =============================================================================
;; Function: sort-by-abstraction
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Sorts a list of patterns based on abstraction level using is-blk-more-abstract
;;   More abstract patterns come first in the sorted result
;;
;; Type Signature:
;;   (-> Expression Expression Expression)
;;
;; Parameters:
;;   $patterns - List of patterns to sort
;;   $var - Variable to use for abstraction comparison
;;
;; Returns:
;;   Sorted list where more abstract patterns appear first
;;
;; Example:
;;   (sort-by-abstraction '(pattern1 pattern2 pattern3) $x)
;; =============================================================================
; (: sort-by-abstraction (-> Expression Expression Expression))
(= (sort-by-abstraction $patterns $var)
    (if (== $patterns ())
        ()
        (if (== (cdr-atom $patterns) ())
            $patterns  ; Single element list is already sorted
            (let* (
                ($pivot (car-atom $patterns))
                ($rest (cdr-atom $patterns))

                ($more-abstract (filter-more-abstract $rest $pivot $var))
                ($less-abstract (filter-less-abstract $rest $pivot $var))
        

                ($sorted-less (sort-by-abstraction $less-abstract $var))
                ($sorted-more (sort-by-abstraction $more-abstract $var))
                ($with-pivot (cons-atom $pivot $sorted-less))
            )
            (concat-atom $sorted-more $with-pivot)))))

;; =============================================================================
;; Function: filter-more-abstract
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Filters patterns that are more abstract than the pivot
;;
;; Parameters:
;;   $patterns - List of patterns to filter
;;   $pivot - Pivot pattern for comparison
;;   $var - Variable for abstraction comparison
;;
;; Returns:
;;   List of patterns more abstract than pivot
;; =============================================================================
; (: filter-more-abstract (-> Expression Expression Expression Expression))
(= (filter-more-abstract $patterns $pivot $var)
    (if (== $patterns ())
        ()
        (let* (
            ($head (car-atom $patterns))
            ($_ (println! (head $head pivot $pivot var $var)))
            ($is-head-abstract (is-blk-more-abstract $head $pivot $var))
            ($__ (println! (is-blk-abs $is-head-abstract)))
            ($copyHead (car-atom $patterns))
            ($copyHead (car-atom $patterns))
            ($tail (cdr-atom $patterns))
            ($rest-filtered (filter-more-abstract $tail $pivot $var))
            ($some_var (is-blk-more-abstract $head $pivot $var))
        )
        (if $some_var
            (cons-atom $copyHead $rest-filtered)
            $rest-filtered))))

;; =============================================================================
;; Function: filter-less-abstract
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Filters patterns that are less abstract than the pivot
;;
;; Parameters:
;;   $patterns - List of patterns to filter
;;   $pivot - Pivot pattern for comparison
;;   $var - Variable for abstraction comparison
;;
;; Returns:
;;   List of patterns less abstract than pivot
;; =============================================================================
; (: filter-less-abstract (-> Expression Expression Expression Expression))
(= (filter-less-abstract $patterns $pivot $var)
    (if (== $patterns ())
        ()
        (let* (

            ($head (car-atom $patterns))
            ($copyHead (car-atom $patterns))
            ($tail (cdr-atom $patterns))
            ($rest-filtered (filter-less-abstract $tail $pivot $var))
        )
        (if (is-blk-more-abstract $head $pivot $var)
            $rest-filtered
            (cons-atom $copyHead $rest-filtered)))))




;; =============================================================================
;; Function: eq-prob
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Calculates the probability of a variable taking the same value across
;;   all blocks/subpatterns where that variable appears in a partition
;;
;; Type Signature:
;;   (-> Expression Expression Expression Number)
;;
;; Parameters:
;;   $partition - List of blocks/subpatterns 
;;   $pattern - The main pattern containing variables
;;   $db - Database/corpus to search in
;;
;; Returns:
;;   Probability value as a number
;;
;; Algorithm:
;;   1. For each joint variable in the pattern and partition
;;   2. Get connected subpatterns containing that variable
;;   3. Sort by abstraction level (most abstract first)
;;   4. For each block after the first, find most specialized abstract block
;;   5. Calculate probability based on value counts
;; =============================================================================
; (: eq-prob (-> Expression Expression Expression Number))
(= (eq-prob $partition $pattern $db)
    (let $joint-vars (joint-variables $pattern $partition)
        (calculate-prob-for-vars $joint-vars $partition $db 1.0)))

;; =============================================================================
;; Function: calculate-prob-for-vars
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Iterates through variables and calculates cumulative probability
;;
;; Parameters:
;;   $vars - List of joint variables
;;   $partition - Partition to analyze
;;   $db - Database
;;   $p - Current probability accumulator
;;
;; Returns:
;;   Final probability after processing all variables
;; =============================================================================
; (: calculate-prob-for-vars (-> Expression Expression Expression Number Number))
(= (calculate-prob-for-vars $vars $partition $db $p)
    (if (== $vars ())
        $p
        (let* (
            ($head (car-atom $vars))
            ($tail (cdr-atom $vars))
            ($var-partition (connected-subpatterns-with-var $partition $head))
            ($sorted-partition (sort-by-abstraction $var-partition $head))
            ($new-p (process-blocks $sorted-partition $head $db $p 1))
        )
        (calculate-prob-for-vars $tail $partition $db $new-p))))


;; =============================================================================
;; Function: process-blocks
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Processes blocks in sorted partition starting from index j=1
;;   (skipping the first block as per the C++ algorithm)
;;
;; Parameters:
;;   $sorted-partition - Partition sorted by abstraction
;;   $var - Current variable being processed
;;   $db - Database
;;   $p - Current probability
;;   $j - Current block index (starts at 1)
;;
;; Returns:
;;   Updated probability after processing all blocks
;; =============================================================================
; (: process-blocks (-> Expression Expression Expression Number Number Number))
(= (process-blocks $sorted-partition $var $db $p $j)
    (let $partition-size (size-atom $sorted-partition)
        (if (>= $j $partition-size)
            $p
            (let* (
                ($j-blk (index-atom $sorted-partition $j))
                ($i (find-most-specialized-abstract $sorted-partition $j-blk $var (- $j 1)))
                ($c (if (>= $i 0)
                        (let $i-blk (index-atom $sorted-partition $i)
                            (value-count $i-blk $var $db))
                        (let $U (collapse (get-atoms $db)) (size-atom $U))))  ; Use |U| = db.size() as fallback
                ($j-blk-count (value-count $j-blk $var $db))
                ($new-p (/ $p $c))
            )
            (process-blocks $sorted-partition $var $db $new-p (+ $j 1))))))



(= (value-count $blk $var $db) 
    (let* (
            ($conj-blk (union-atom (,) $blk))
            ($ground-value (collapse (match $db $conj-blk $conj-blk)))
            ($ground-value (unique-atom $ground-value))
        )
        (size-atom $ground-value)
    )
)
               
;; =============================================================================
;; Function: find-most-specialized-abstract
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Finds the most specialized block that is more abstract than j_blk
;;   Goes backward from j_blk to find first i_blk that is more abstract
;;
;; Parameters:
;;   $partition - Sorted partition
;;   $j-blk - Current block to compare against
;;   $var - Variable for abstraction comparison
;;   $i - Current index to check (starts at j-1)
;;
;; Returns:
;;   Index of most specialized abstract block, or -1 if none found
;; =============================================================================
; (: find-most-specialized-abstract (-> Expression Expression Expression Number Number))
(= (find-most-specialized-abstract $partition $j-blk $var $i)
    (if (< $i 0)
        -1  ; No abstract block found
        (let $i-blk (index-atom $partition $i)
            (if (is-blk-more-abstract $i-blk $j-blk $var)
                $i  ; Found the most specialized abstract block
                (find-most-specialized-abstract $partition $j-blk $var (- $i 1))))))

;; =============================================================================
;; Helper Functions
;; =============================================================================



;; =============================================================================
;; Function: get-var
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Extracts all variables from a flattened pattern expression
;;   A flattened pattern is a list of patterns like ((Pattern $x $y) (Pattern $z Jon))
;;
;; Type Signature:
;;   (-> Expression Expression)
;;
;; Parameters:
;;   $pattern - Flattened pattern (list of individual patterns)
;;
;; Returns:
;;   List of unique variables found in the pattern
;;
;; Example:
;;   (get-var '((Pattern $x $y) (Pattern $z Jon))) → ($x $y $z)
;; =============================================================================
(= (get-var $pattern)
    (unique-list (extract-vars-from-pattern $pattern ())))

;; Helper function to recursively extract variables from pattern
(= (extract-vars-from-pattern $pattern $acc)
    (if (== $pattern ())
        $acc
        (if (== (car-atom $pattern) ,) 
           (let* (
            ($pattern-wout-and (cdr-atom $pattern))
            ($current-expr (car-atom $pattern-wout-and))
            ($remaining (cdr-atom $pattern-wout-and))
            ($expr-vars (extract-vars-from-expr $current-expr))
            ($new-acc (merge-list $acc $expr-vars))
        )
        (extract-vars-from-pattern $remaining $new-acc))

           (let* (
            ($current-expr (car-atom $pattern))
            ($remaining (cdr-atom $pattern))
            ($expr-vars (extract-vars-from-expr $current-expr))
            ($new-acc (merge-list $acc $expr-vars))
        )
        (extract-vars-from-pattern $remaining $new-acc))
        )

     
    )
)
1
;; Extract variables from a single expression
; (: extract-vars-from-expr (-> Expression Expression))
(= (extract-vars-from-expr $expr)
    (if (== $expr ())
        ()
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            ($head-vars (if (== (get-metatype $head) Variable)
                           ($head)
                           ()))
            ($tail-vars (extract-vars-from-expr $tail))
        )
        (merge-list $head-vars $tail-vars))))

;; =============================================================================
;; Function: joint-variables
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Finds variables that appear in multiple blocks of a partition
;;   A joint variable must exist in at least 2 different blocks
;;
;; Type Signature:
;;   (-> Expression Expression Expression)
;;
;; Parameters:
;;   $pattern - Flattened pattern to get variables from
;;   $partition - List of blocks (each block is a list of patterns)
;;
;; Returns:
;;   List of variables that appear in multiple blocks
;;
;; Example:
;;   Pattern: ((Pattern $x $y) (Pattern $x Jon))  
;;   Partition: ( ((Pattern $x Jon))  ((Pattern $x $y)) )  
;;   Result: ($x $y) - because they appear in both blocks, $z only in first block
;; =============================================================================
; (: joint-variables (-> Expression Expression Expression))
(= (joint-variables $pattern $partition)
    (let $pattern-vars (get-var $pattern)   
        (filter-joint-vars $pattern-vars $partition))) 

;; Filter variables that appear in multiple blocks
; (: filter-joint-vars (-> Expression Expression Expression))
(= (filter-joint-vars $vars $partition)
    (if (== $vars ())
        ()
        (let* (
            ($var (car-atom $vars))
            ($remaining-vars (cdr-atom $vars))
            ($rest-joint (filter-joint-vars $remaining-vars $partition))
        )
        (if (is-joint-var $var $partition)
            (cons-atom $var $rest-joint)
            $rest-joint
        )
        )
    )
)

;; Check if a variable appears in multiple blocks of partition
(= (is-joint-var $var $partition)
    (let $block-count (count-blocks-with-var $var $partition 0)
        (> $block-count 1)
    )
)

;; Count how many blocks contain the variable
(= (count-blocks-with-var $var $partition $count)
    (if (== $partition ())
        $count
        (let* (
            ($current-block (car-atom $partition))
            ($_ (println! $current-block))
            ($remaining-blocks (cdr-atom $partition))
            ($__ (println! $remaining-blocks))
            ($var-in-block (is-var-exist $current-block $var))
            ($___ (println! $var-in-block))
            ($new-count (if $var-in-block (+ $count 1) $count))
        )
        (count-blocks-with-var $var $remaining-blocks $new-count))))

;; Get all variables from entire partition (updated implementation)
(= (get-all-partition-variables $partition)
    (if (== $partition ())
        ()
        (let* (
            ($block (car-atom $partition))
            ($remaining (cdr-atom $partition))
            ($block-vars (get-var $block))
            ($remaining-vars (get-all-partition-variables $remaining))
        )
        (merge-list $block-vars $remaining-vars))))

;; Find intersection of two variable lists

(= (intersection-vars $vars1 $vars2)
    (if (== $vars1 ())
        ()
        (let* (
            ($var (car-atom $vars1))
            ($remaining (cdr-atom $vars1))
            ($rest-intersection (intersection-vars $remaining $vars2))
        )
        (if (is-membership $var $vars2)
            (cons-atom $var $rest-intersection)
            $rest-intersection))))





