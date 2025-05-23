;; =============================================================================
;; Module: Partition Utilities
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Provides functions for manipulating logical partitions and subsets, including:
;;   - Clause extraction from expressions
;;   - Powerset generation
;;   - Partition generation
;;   - Set operations
;;
;; Dependencies:
;;   - Python backend for some partition generation functions
;; =============================================================================

! (import! &self partition)

;; =============================================================================
;; Function: get-clauses
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Extracts clauses from an expression, specifically handling AND-conjunctions
;;
;; Type Signature:
;;   (-> Expression Expression)
;;
;; Parameters:
;;   $element - Input expression to analyze
;;
;; Returns:
;;   - Body of expression if it's an AND-conjunction
;;   - Original expression otherwise
;;
;; Example:
;;   (get-clauses '(And A B C)) → (A B C)
;;   (get-clauses '(Or X Y)) → (Or X Y)
;; =============================================================================
(: get-clauses (-> Expression Expression))
(= (get-clauses $element)
    (let $link (car-atom $element)
        (if (== $link And)
            (cdr-atom $element)
            $element)))

;; =============================================================================
;; Function: add-to-subsets
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Adds an element to each subset in a list of subsets
;;
;; Type Signature:
;;   (-> Expression Expression Expression)
;;
;; Parameters:
;;   $element - Element to add
;;   $subsets - List of subsets to modify
;;
;; Returns:
;;   New list with element added to each subset
;;
;; Example:
;;   (add-to-subsets 'A '((B) (C))) → ((A B) (A C))
;; =============================================================================
(: add-to-subsets (-> Expression Expression Expression))
(= (add-to-subsets $element $subsets)
    (if (== $subsets ())
        ()
        (let* (
                ($head-sub (car-atom $subsets))
                ($tail-sub (cdr-atom $subsets))
                ($current (cons-atom $element $head-sub))
                ($rest (add-to-subsets $element $tail-sub)))
            (cons-atom $current $rest))))

;; =============================================================================
;; Function: concat-atom
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Concatenates two lists
;;
;; Parameters:
;;   $list1 - First list
;;   $list2 - Second list
;;
;; Returns:
;;   Combined list
;;
;; Example:
;;   (concat-atom '(A B) '(C D)) → (A B C D)
;; =============================================================================
(= (concat-atom $list1 $list2)
    (if (== $list1 ())
        $list2
        (let* (
                ($head (car-atom $list1))
                ($tail (concat-atom (cdr-atom $list1) $list2)))
            (cons-atom $head $tail))))

;; =============================================================================
;; Function: powerset
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Generates all possible subsets of a list (powerset)
;;
;; Type Signature:
;;   (-> Expression Expression)
;;
;; Parameters:
;;   $lst - Input list
;;
;; Returns:
;;   List of all subsets
;;
;; Example:
;;   (powerset '(A B)) → (() (A) (B) (A B))
;; =============================================================================
(: powerset (-> Expression Expression))
(= (powerset $lst)
    (if (== $lst ())
        (cons-atom () ())
        (let* (
                ($rest (powerset (cdr-atom $lst)))
                ($with-current (add-to-subsets (car-atom $lst) $rest)))
            (concat-atom $rest $with-current))))

;; =============================================================================
;; Function: generet-partition-without-pattern
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Generates partitions from a pattern using Python backend
;;
;; Type Signature:
;;   (-> Expression Expression)
;;
;; Parameters:
;;   $pattern - Input pattern to partition
;;
;; Returns:
;;   List of generated partitions
;;
;; Process:
;;   1. Extracts clauses from pattern
;;   2. Generates subsets
;;   3. Calls Python partition generator
;;
;; Example:
;;   (generet-partition-without-pattern '(And A B C))
;;   → ((A B C)) or other valid partitions
;; =============================================================================
(: generet-partition-without-pattern (-> Expression Expression))
(= (generet-partition-without-pattern $pattern)
    (let* (
            ($clause (get-cnj-clouses $pattern))
            ($subsets (gen-subsets $clause)))
        (gen-partition $subsets $clause)))