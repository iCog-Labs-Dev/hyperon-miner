;;;;;;;;;;;;;;;;;;
;;;; Helpers ;;;;;
;;;;;;;;;;;;;;;;;;

;; =============================================================================
(= (is-expression $x) (== (get-metatype $x) Expression))
(= (is-variable $x) (== (get-metatype $x) Variable))
(= (is-symbol $x) (== (get-metatype $x) Symbol))

;; =============================================================================
;; Function: append
;; -----------------------------------------------------------------------------
;; Parameters:
;;   - `$list`: A list to which an element will be appended (e.g., `(1 2 3)`).
;;   - `$el`: An element to append to the end of the list (e.g., `4`).
;; Returns:
;;   - A new list with `$el` added to the end (e.g., `(1 2 3 4)`).
;;   - If `$list` is empty, returns a single-element list containing `$el` (e.g., `(4)`).
;; How it works:
;;   1. Base Case: If `$list` is empty, returns a new list with `$el`.
;;   2. Recursive Case:
;;      a. Decomposes `$list` into `$h` (head) and `$r` (rest of the list).
;;      b. Recursively calls `append` on the tail `$r` with `$el`.
;;      c. Reconstructs the list by prepending `$h` to the result of the recursive call.
;; =============================================================================
(= (append $list $el) (
   if (== $list ()) ($el) 
      (let ($h $r) ((car-atom $list)(append (cdr-atom $list) $el)) (cons-atom $h $r))))

; !(append (1 2 3) 4)

;; =============================================================================
;; Function: concat
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively concatenates two lists `$list1` and `$list2` by prepending elements of `$list1`
;;   to `$list2` in order. Preserves the original structure of both lists.
;; Inputs:
;;   - `$list1`: First list to concatenate (e.g., `(1 2 3)`).
;;   - `$list2`: Second list to append (e.g., `(4 5)`).
;; Output:
;;   - A new list combining all elements of `$list1` followed by `$list2` (e.g., `(1 2 3 4 5)`).
;;   - If `$list1` is empty (`()`), returns `$list2` directly.
(= (concat $list1 $list2) (
   if (== $list1 ()) $list2 
      (let ($h $r) ((car-atom $list1)(concat (cdr-atom $list1) $list2)) (cons-atom $h $r))))


;; =============================================================================
;; Function: reverse-list
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively reverses the order of elements in a list.
;;
;; Input:
;;   - `$subparts`: The list to reverse (e.g., `(1 2 3 4)`).
;;
;; Output:
;;   - A new list with elements in reverse order (e.g., `(4 3 2 1)`).
;;   - Empty list `()` if input is empty.
;;
;; How it works:
;;   1. Base Case: Returns empty list when input is empty.
;;   2. Recursive Case:
;;      a. Splits list into `$head` (first element) and `$tail` (remaining elements)
;;      b. Recursively reverses `$tail`
;;      c. Appends `$head` to the end of the reversed tail using `append`
(= (reverse-list $list)(if (== $list ()) () (append (reverse-list (cdr-atom $list)) (car-atom $list))))

; !(reverse-list (1 2 3 4))

;;;;;;;;;;;;;;;;;;
;; Common Utils ;;
;;;;;;;;;;;;;;;;;;

;predicate to check if a given expression is a pattern or not
(= (checkPat $x)(
   and (== (get-metatype $x) Expression)
       (and (> (size-atom $x) 1)
            (let $h (car-atom $x) (== (get-metatype $h) Symbol)))
))
; !(checkPat (link AAA BBB))


;;;;;;;;;; functions related to Conjunction ;;;;;;;;;;;;

;; Extracts conjuncts from a conjunctive expression,
(= (get-conjuncts $cnj) (
  unify (, $ncnj $ptrn) $cnj (let $result (get-conjuncts $ncnj) (cons-atom $ptrn $result) ) ($cnj)
))
; !(get-conjuncts (, (, A B) K))


;;Determines the number of conjunctive clauses in a pattern.
(= (n_conjuncts_new $pattern) (
   let ($head $tail) (decons-atom $pattern) (
    if (== $head ,) (size-atom $tail) 1)))

; !(n_conjuncts_new (, A B ))

;; =============================================================================
;; Function: flatten
;; -----------------------------------------------------------------------------
;; Purpose:  
;;   Flattens a nested conjunctive expression (e.g., `(, (, A B) C)`) into a  
;;   single-level conjunction (e.g., `(, A B C)`), preserving the original order.  
;;  
;; Input:  
;;   - `$cnj`: A nested conjunctive expression (e.g., `(and X (and Y Z))`).  
;;  
;; Output:  
;;   - A flattened conjunction with all sub-expressions at the top level.  
;; How it works:  
;;   1. Base Case: Returns empty list when input is empty.  
;;   2. Recursive Case:  
;;      a. Decomposes `$cnj` into `$h` (head) and `$t` (tail).  
;;      b. If `$h` is a conjunction, recursively flattens it; otherwise, includes `$h` as is.  
;;      c. Recursively flattens `$t`.  
;;      d. Combines the flattened head and tail using `concat` to ensure all elements are at the top level.
;; =============================================================================
(= (flatten $cnj)(
   if (== $cnj ()) () (
      let* (
         (($h $t) (decons-atom $cnj) )
         ($flat_h (
            if (== $h ,) ()
               (if (== (get-metatype $h) Expression) (flatten $h) ($h) ) ) )
         ($flat_t (flatten $t) )
      ) (concat $flat_h $flat_t))
))

; !(flatten (, (, A B) A))


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
; (: get-clauses (-> Expression Expression))
(= (get-clauses $element)
    (let $link (car-atom $element)
        (if (== $link ,)
            (cdr-atom $element)
            $element)))

; !(get-clauses (, A B C))

;; =============================================================================
;; Function: conjunct-pattern
;; -----------------------------------------------------------------------------
;; Purpose:  
;;   Converts a list of blocks (`$blks`) into a conjunctive pattern (logical AND)
;;   and  adds it to a database (`$db`) 
;;  
;; Inputs:  
;;   - `$blks`: A list of blocks (e.g., `(A B C)`).  
;;   - `$db`  : A database to which the pattern is added as an atom.  
;;             
;;  
;; Output:  
;;   - A conjunctive pattern combining `$blks` (e.g., `(, A B C)`).  
;;  
;; How it works:  
;;   1. Combines `$blks` into a conjunction using `cons-atom` (e.g., `(, A B C)`).  
;;   2. adds the pattern to it via `add-atom` (side effect).  
;;   3. Returns the generated pattern, regardless of `$db`.  
;;  
;; Notes:  
;;  
;;   - No checks are done on `$blks` (e.g., empty lists may produce `(and)`).  
;; =============================================================================
(= (conjunct-pattern $blks $db) (
let* ( ($pattern (cons-atom , $blks)) ($dummy (add-atom $db $pattern))) $pattern ))

; !(bind! &my-db (new-space))
; !(conjunct-pattern (A B C) &my-db)

;; =============================================================================
;; Function: //
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Performs floating-point division between `$a` and `$b` by explicitly 
;;   converting the numerator to a float to avoid integer division.
;;
;; Inputs:
;;   - `$a`: Numerator (any numeric type).
;;   - `$b`: Denominator (any numeric type, must be ≠ 0).
;;
;; Output:
;;   - Floating-point result of `$a / $b` (as a float).
;;   - Undefined behavior if `$b = 0` (division error).
;;
;; How it works:
;;   1. Converts `$a` to float by multiplying with `1.0` (e.g., `3` → `3.0`).
;;   2. Divides the float-converted `$a` by `$b` using standard division (`/`).
;;
;; Notes:
;;   - Ensures floating-point result even with integer inputs (e.g., `(// 5 2) → 2.5`).
;;   - Equivalent to `(float (/ $a $b))`.
;;   - No runtime checks for `$b = 0` (may trigger language-specific errors).
;; =============================================================================

(= (// $a $b) (/ (* 1.0 $a) $b))

; !(// 5 2)
; !(// 5.0 2)
; !(// 7.5 2.5)


;; =============================================================================
;; Function: concatTuple
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively concatenates two lists `$xs` and `$ys` by prepending elements of `$xs`  
;;   to `$ys` in order. Preserves the original structure of both lists.
;;
;; Inputs:
;;   - `$xs`: First list to concatenate (e.g., `(1 2 3)`).
;;   - `$ys`: Second list to append (e.g., `(4 5)`).
;;
;; Output:
;;   - A new list combining all elements of `$xs` followed by `$ys` (e.g., `(1 2 3 4 5)`).
;;   - If `$xs` is empty (`()`), returns `$ys` directly.
;;
;; How it works:
;;   1. Base Case: If `$xs` is empty, return `$ys` immediately.
;;   2. Recursive Step:
;;      a. Split `$xs` into `$head` (first element) and `$tail` (remaining elements)  
;;         using `decons-atom`.
;;      b. Recursively concatenate `$tail` with `$ys` (yielding `$tailNew`).
;;      c. Rebuild the list by prepending `$head` to `$tailNew` via `cons-atom`.
;; =============================================================================

(= (concatTuple $xs $ys)
    (if (== $xs ())
        $ys
        (let* ( (($head $tail) (decons-atom $xs))
                ($tailNew (concatTuple $tail $ys)))
                 (cons-atom $head $tailNew))  ))

; !(concatTuple (1 2 3) (4 5 1 2 3))

;; =============================================================================
;; Function: remove-parenthesis
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Removes redundant nested parentheses from a single-element list by unwrapping
;;   it recursively until a non-single-element list is found.
;;
;; Input:
;;   - `$x`: A potentially nested list structure (e.g., `((((A))))` or `(A B C)`).
;;
;; Output:
;;   - The innermost element if `$x` is a series of single-element lists (e.g., `A`).
;;   - The original list if it contains multiple elements or is already atomic.
;;
;; How it works:
;;   1. Splits `$x` into `$head` and `$tail` using `decons-atom`.
;;   2. If `$tail` is empty (single-element list), recursively processes `$head`.
;;   3. Otherwise, returns the original list unchanged.

;; =============================================================================

(= (remove-parenthesis $x) (
   if (== (get-metatype $x) Expression)
      (if (== (size-atom $x) 1) (remove-parenthesis (car-atom $x))  $x)
      ($x)))

; !(remove-parenthesis ((((A)))))
; !(remove-parenthesis ((A B)))
; !(remove-parenthesis (A B C))

;; =============================================================================
;; Function: get-variables
;; -----------------------------------------------------------------------------
;; Purpose:
;;    Extracts all unique variables from a given clause or expression.
;; 
;; Parameters:
;;   - `$clause`: The input clause or expression to analyze.
;;
;; Returns:
;;   - A list of unique variables found within the clause.
;;   - An empty list if no variables are present.
;; How it works:
;;   1. Base Case: If `$clause` is empty, return an empty list.
;;   2. Recursive Case:
;;      a. Decomposes `$clause` into `$h` (head) and `$t` (tail).
;;      b. If `$h` is an expression, recursively extracts variables from it.
;;      c. If `$h` is a variable and not already in the accumulator, adds it to the list.
;;      d. Recursively processes `$t` to extract variables.
;;      e. Combines variables from `$h` and `$t` using `union-atom` to ensure uniqueness.
;; Notes:
;;   - Returns unique variables only in MettaLog, using MeTTa will not guarantee uniqueness.
;; =============================================================================

(= (get-variables $clause)(
   if (== $clause ()) () (
      let* (
         (($h $t) (decons-atom $clause))
         ($v ( if (== (get-metatype $h) Expression)
                  (get-variables $h)
                  ( if (== (get-metatype $h) Variable) ($h) ())))
         ($rem (get-variables $t))
      ) (union-atom $v $rem))))


; !(get-variables (, (P $x (Q $y $x)) (R $z)))


;; =============================================================================
;; Function: remove-element
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively removes all occurrences of `$element` from `$list`, preserving
;;   the order of remaining elements.
;;
;; Inputs:
;;   - `$element`: The value to remove (e.g., `2` or `'a`).
;;   - `$list`: The list to process (e.g., `(1 2 3 2 4)`).
;;
;; Output:
;;   - A new list with all instances of `$element` removed.
;;   - Empty list `()` if input is empty or all elements were removed.
;;
;; How it works:
;;   1. Base Case: Returns empty list when input is empty.
;;   2. Recursive Case:
;;      a. Splits list into `$head` (first element) and `$tail` (remaining elements)
;;      b. If `$head` matches `$element`, skips it and processes `$tail`
;;      c. Otherwise, keeps `$head` and recursively processes `$tail`
;; =============================================================================

(= (remove-element $element ())())
(= (remove-element $element $list) (
    let ($head $tail) (decons-atom $list) (
        if (== $element $head) (remove-element $element $tail) (
            let $dummy (remove-element $element $tail) (cons-atom $head $dummy)))))

; !(remove-element 2 (1 2 3 2 4))


;; =============================================================================
;; Function: insert
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively inserts all elements from `$subparts` into `$res` in order,
;;   effectively concatenating two lists by appending elements one by one.
;;
;; Inputs:
;;   - `$subparts`: Source list of elements to insert (e.g., `(1 2 3)`).
;;   - `$res`: Target list to receive elements (e.g., `(4 5 6)`).
;;
;; Output:
;;   - A new list containing all elements of `$res` followed by all elements of `$subparts`.
;;   - If `$subparts` is empty, returns `$res` unchanged.
;;
;; How it works:
;;   1. Base Case: Returns `$res` when `$subparts` is empty.
;;   2. Recursive Case:
;;      a. Splits `$subparts` into `$head` (first element) and `$tail` (remaining elements)
;;      b. Appends `$head` to `$res` using `push-back`
;;      c. Recursively processes remaining `$tail` with the new result
(= (insert $subparts $res) (
   if (== $subparts ()) $res (
      let ($head $tail) (decons-atom $subparts) (insert $tail (append $res $head)))))

; !(insert (1 2 3) (4 5 6))

;; =============================================================================
;; Function: is-present
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively checks if `$atom` exists anywhere in `$list`, including nested sublists.
;;   Returns a boolean (True/False) indicating presence.
;;
;; Inputs:
;;   - `$atom`: The element to search for (any atomic value).
;;   - `$list`: The list or nested structure to search (e.g., `(1 (2 3) 4)`).
;;
;; Output:
;;   - True if `$atom` is found anywhere in `$list` (including nested lists).
;;   - False if `$atom` is not found or `$list` is empty.
;;
;; How it works:
;;   1. Base Case: Returns False for empty list.
;;   2. Recursive Cases:
;;      a. For expressions (nested lists):
;;         i. Checks current head element
;;         ii. Recursively checks both head and tail
;;      b. For atoms:
;;         i. Direct comparison with target atom
(= (is-present $atom ()) False)
(= (is-present $atom $list) (
    if (is-expression $list) (
    let* ((($head $tail) (decons-atom $list))) (
        if (== $atom $head) True  (or (is-present $atom $head) (is-present $atom $tail))
    )) (if (== $atom $list) True False)))

; !(is-present A (, (B C) D (E (F A))))
; !(is-present X (, (B C) D (E (F A))))


;; =============================================================================
;; Function: is-pattern
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Determines if an expression is a valid pattern by checking its structure
;;   against common pattern forms. A pattern consists of a symbol followed by
;;   variables or nested expressions.
;;
;; Input:
;;   - `$expr`: The expression to evaluate (e.g., `(P $x $y)` or `(Q (R $z))`).
;;
;; Output:
;;   - True if the expression matches pattern structure
;;   - False otherwise
;;
;; Pattern Rules:
;;   1. Binary form: ($link $x $y) where:
;;      - $link is a symbol
;;      - Both $x and $y are either variables or expressions
;;   2. Unary form: ($link $x) where:
;;      - $link is a symbol
;;      - $x is either a variable or expression
;;
;; How it works:
;;   1. Uses `unify` to match against two possible pattern structures
;;   2. Checks each component with type predicates:
;;      - `is-symbol` for the link/predicate
;;      - `is-variable` or `is-expression` for arguments
;;   3. Returns True if either pattern matches
; ==============================================================================
(=(is-pattern $expr) False)
(= (is-pattern $expr) ( collapse ( 
   or (unify $expr ($link $x $y) 
         (and (is-symbol $link) 
               (or (or (is-variable $x) (is-expression $x))
                     (or (is-variable $y) (is-expression $y)))) 
         False )
      (unify $expr ($link $x)
            (and (is-symbol $link)  
                  (or (is-variable $x)  (is-expression $x)))
            False ))))

; !(is-pattern (P $x $y ))
; !(is-pattern ($x $y ))
; !(is-pattern (P A B ))



;; =============================================================================
;; Function: is-valid
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Checks if all elements in closure `$clous` exist within partition `$partion`.
;;   Essentially verifies that a closure is fully contained within a partition.
;;
;; Inputs:
;;   - `$clous`: The closure/list of elements to validate (e.g., `(A B C)`).
;;   - `$partion`: The reference partition/list to check against (e.g., `(A B C D E)`).
;;
;; Output:
;;   - True if every element in `$clous` exists in `$partion`.
;;   - False if any element in `$clous` is missing from `$partion`.
;;   - True if `$clous` is empty (vacuous truth).
;;
;; How it works:
;;   1. Base Case: Empty closure is always valid (returns True).
;;   2. Recursive Case:
;;      a. Splits `$clous` into `$head` (first element) and `$tail` (remaining elements).
;;      b. Checks if `$head` exists in `$partion` using `is-present`.
;;      c. Recursively validates the remaining elements in `$tail`.
(= (is-valid () $partion) True)
(= (is-valid $clous $partion)(
    let ($head $tail) (decons-atom $clous)  (and (is-present $head $partion) (is-valid $tail $partion)) ))            

; !(is-valid (A B) (A B C D))
; !(is-valid (A B) (A B C D E))
; !(is-valid (A B) (A C D))


;; =============================================================================
;; Function: comp
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Creates all possible ordered pairs between `$main_head` and elements of `$list`,
;;   then recursively combines them. The operation resembles a Cartesian product
;;   between the main head and list elements.
;;
;; Inputs:
;;   - `$main_head`: The primary element to pair with each list item (e.g., `A`).
;;   - `$list`: The list of elements to pair with `$main_head` (e.g., `(1 2 3)`).
;;
;; Output:
;;   - A new list containing all `($main_head $x)` pairs for each `$x` in `$list`,
;;     followed by recursive applications to the remaining elements.
;;   - Empty list if either input is empty.
;;   - ((1 A) (2 A) (3 A))
;;
;; How it works:
;;   1. Base Case: Returns empty list when `$list` is empty.
;;   2. Recursive Case:
;;      a. Splits `$list` into current element `$x` and remaining `$tail`
;;      b. Creates pair `(append-list $main_head $x)`
;;      c. Recursively processes `$tail` and combines results
;;
(= (comp $main_head $list)(map-atom $list $x ($x $main_head)))

; !(comp A (1 2 3))

;; =============================================================================
;; Function: get-clouses 
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively extracts all expression nodes from a pattern while maintaining
;;   their hierarchical structure. Returns a flat list of all sub-expressions.
;;
;; Input:
;;   - `$pattern`: The pattern to analyze (e.g., `(, (, A B) (, C D))`).
;;
;; Output:
;;   - A flattened list containing:
;;     * The root expression (if it's a compound expression)
;;     * All sub-expressions at any nesting level
;;     * Atomic values are excluded from the results
;;   - Empty list if input contains no expressions
;;   - (,  A B C D )`
;;
;; How it works:
;;   1. Base Case: Returns empty list when pattern is empty
;;   2. Recursive Processing:
;;      a. Deconstructs pattern into head and tail
;;      b. For expression heads:
;;         i. Adds the expression itself to results
;;         ii. Recursively processes both its contents and the tail
;;      c. For atomic heads, just processes the tail
(= (get-clouses $pattern)(let $clouses (_get-clouses $pattern) (cons-atom , $clouses)))
(= (_get-clouses $pattern)(
    if (== () $pattern) () (
        let* (
            (($h $t) (decons-atom $pattern))
            ($l (if (== (get-metatype $h) Expression)
                    (_get-clouses $h)
                    (if (== , $h) () ($h))))
            ($r (_get-clouses $t))
        ) (concatTuple $l $r)
    )
))

; !(get-clouses (, (, A B) (, A D)))



;; =============================================================================
;; Function: find_max
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively finds the maximum number in a list of numbers using tail recursion.
;;   Requires an initial `$max` value (typically -∞ or first element).
;;
;; Inputs:
;;   - `$num_list`: List of numbers to search (e.g., `(3 1 4 2)`).
;;   - `$max`: Current maximum value (initialize with minimal value).
;;
;; Output:
;;   - The largest number found in `$num_list`.
;;   - Returns `$max` unchanged if list is empty.
;;
;; How it works:
;;   1. Base Case: Returns current `$max` when list is empty.
;;   2. Recursive Case:
;;      a. Deconstructs list into `$head` (first number) and `$tail` (remaining numbers)
;;      b. Compares `$head` with current `$max`
;;      c. Recurses with `$tail` and updated maximum
(= (find_max_helper $num_list $max) (
    if (== $num_list ()) $max (
        let* ((($head $tail)(decons-atom $num_list))
            ($dummy (find_max_helper $tail (if (> $head $max) $head $max)))) 
            $dummy  )))

(= (max $list) (find_max_helper $list (car-atom $list)))

; !(max (3 1 4 2))

;; =============================================================================
;; Function: find_min
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively finds the minimum number in a list of numbers using tail recursion.
;;   Requires an initial `$min` value (typically +∞ or first element).
;; Inputs:
;;   - `$num_list`: List of numbers to search (e.g., `(3 1 4 2)`).
;;   - `$min`: Current minimum value (initialize with maximal value).
;; Output:
;;   - The smallest number found in `$num_list`.
;;   - Returns `$min` unchanged if list is empty.

(= (find_min_helper $num_list $min) (
    if (== $num_list ()) $min (
        let* ((($head $tail)(decons-atom $num_list))
            ($dummy (find_min_helper $tail (if (< $head $min) $head $min)))) 
            $dummy  )))

(= (min $list) (find_min_helper $list (car-atom $list)))

; !(min (3 1 4 2))

;; =============================================================================
;; Function: get-cnj-clauses
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Extracts components from a conjunctive pattern. If the pattern is explicitly
;;   conjunctive (head is ","), returns the tail. Otherwise, treats the entire
;;   pattern as a single clause.
;;
;; Input:
;;   - `$pattern`: A potential conjunctive pattern (e.g., `(, A B)` or `(P Q R)`).
;;
;; Output:
;;   - For explicit conjunctions (head is ","): returns the subpatterns (e.g., `(A B)`)
;;   - For other patterns: returns the original pattern unchanged
;;
;; How it works:
;;   1. Deconstructs the pattern into head and tail
;;   2. Checks if head is the conjunction operator ","
;;   3. Returns tail for conjunctions, full pattern otherwise
;;
(= (get-cnj-clouses $pattern) (
  let ($head $tail) (decons-atom $pattern)  (if (== $head ,) $tail $pattern)
))

; !(get-cnj-clouses (, A B))

;; =============================================================================
;; Function: min-max
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Returns a tuple containing both the minimum and maximum values from a list of numbers
;;   in a single pass through the data (if `min` and `max` are optimized).
;;
;; Input:
;;   - `$list`: A list of comparable elements (typically numbers)
;;              e.g., `(3 1 4 1 5 9)`
;;
;; Output:
;;   - A tuple (list) where:
;;     - First element is the minimum value
;;     - Second element is the maximum value
;;   - Undefined behavior for empty lists
;;
;; How it works:
;;   1. Applies both `min` and `max` to the same list
;;   2. Returns results as a tuple (2-element list)
(= (min-max $list) ((min $list) (max $list)))

; !(min-max (3 1 4 1 5 9))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common Utils from prev file ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; Declaration of List data type and constructors
; (: List (-> $a Type))
; (: Nil (List $a))
; (: Cons (-> $a (List $a) (List $a)))

;  ;; Define Nat
; (: Nat Type)
; (: Z Nat)
; (: S (-> Nat Nat))

 ;; Define cast functions between Nat and Number
; (: fromNumber (-> Number Nat))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))
; !(fromNumber 3)

; (: fromNat (-> Nat Number))
(= (fromNat Z) 0)
(= (fromNat (S $k)) (+ 1 (fromNat $k)))
; !(fromNat (S (S Z)))


 ; this consider every thing as a pattern exept for symbole
(= (is-pattern-et $expr) (not (is-symbol $expr)))
; !(is-pattern-et (A B))
; !(is-pattern-et A)

 ; Function: tuple-count
 ; Description: Calculates the tuple-count of a tuple.
 ; Parameters:
 ;   - $tuple: The tuple whose tuple-count is to be calculated.
 ; Returns:
 ;   - The tuple-count of the tuple as an integer.
 ;; Count the number elements in an expression


;; This is very slow, use the grounded python function instead

;    (: tuple-count (-> Any Number))
   (= (tuple-count $atom) (size-atom $atom))
; !(tuple-count (A B C))

;; Tuple count grounded python function
; (import! &self  helper)
; ! (import! &self  helper)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; Function: sum
 ; Description: Calculates the sum of elements in a list.
 ; Parameters:
 ;   - $list: The list of numbers to be summed.
 ; Returns:
 ;   - The sum of the elements in the list as an integer.

; (= (sum $list) (
;         if (== $list ())
;         0
;         (+ (car-atom $list) (sum (cdr-atom $list)))
;     ))
(= (sum $list) (foldl-atom $list 0 $acc $x (+ $acc $x)))
; !(sum (1 2 3 4))

 ; This function calculates the average of a tuple of numbers.
 ; It takes a tuple as input and returns the average value.
 ; The average is computed by dividing the sum of the tuple elements by the tuple-count of the tuple.

(= (avrg-tuple $tuple)
    ; (// (sum $tuple) (tuple-count $tuple))
    (// (sum $tuple) (size-atom $tuple))
)
; !(avrg-tuple (1 2 3 4))

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; Count the number of instances of a given pattern
;;(: counter (-> hyperon::space::DynSpace Atom Number))
(= (counter $db $ptrn)
    (let $result (collapse (match $db $ptrn $ptrn))
         (tuple-count $result)
    )
)
; !(bind! &db (new-space))
; !(add-atom &db (A B))
; !(add-atom &db (A C))
; !(counter &db (A $x))

 ; Count the number of instances of a given pattern
(= (count $pattern $db)
    (let* ( ($dptrn (Debruijn2var $pattern (Cons $Xvar (Cons $Yvar Nil))))
            ($result (collapse (match $db $dptrn $dptrn))))
        (tuple-count $result)))
; !(bind! &db (new-space))
; !(add-atom &db (P a b))
; !(add-atom &db (P c d))
; !(count (P $x $y) &db)

 ;; Evaluate if the pattern has enough support
 ;; Evaluate if the pattern has enough support
; (: sup-eval (-> hyperon::space::DynSpace Atom Number Boolean))

(= (sup-eval $db $pattern $ms)
    (let $sup (counter $db $pattern)
        (if (>= $sup $ms) True False)
    )
)
; !(bind! &db (new-space))
; !(add-atom &db (A B))
; !(add-atom &db (A C))
; !(sup-eval &db (A $x) 2)

;; returns the number of support of a pattern

(= (sup-num $db $pattern)
    (let $sup (counter $db $pattern)
        $sup
    )
)
; !(bind! &db (new-space))
; !(add-atom &db (A B))
; !(add-atom &db (A C))
; !(sup-num &db (A $x))

(= (sup-num-special $db $pattern)
    (let $sup (tuple-count (collapse (match $db $x (let $pattern $x $pattern)) )) 
        $sup
    )
)
; !(bind! &db (new-space))
; !(add-atom &db (A B))
; !(add-atom &db (A C))
; !(sup-num-special &db (A $x))

 ;Check if expression is truth value or not
; (: cog-tv? (-> Atom Bool))
(= (cog-tv? $EXP)
    (if (== (match &self (stv $value $mean $conf) True) True)
        True
        False
    )
)
; !(cog-tv? (stv 1.0 1.0))

(= (has-type $x Nil) False)


(= (has-type $x $y) (== $x (car-atom $y)))
; !(has-type A (A B C))

; (= (has-type $x $y) (let $che (car-atom $y) (== $x $che)))

 ;;(: get-arity (-> $pattern) Number)
 ;; we substruct 1 since the get-arity count the all tuple and we don't want to count
 ;; the "AND LINK" as a part of the arity
(= (get-arity Nil ) 0 )
(= (get-arity $pattern)
    (- (tuple-count $pattern) 1) )
; !(get-arity (, A B C))



 ;     for pattern type Nil will run both implmentation of  n_conjucts
(= (n_conjuncts Nil) 0)
; !(n_conjuncts Nil)

; (= (n_conjuncts $pattern)
 ;     (if (not (has-type lambda $pattern))
 ;         0
 ;         (if (or (has-type and $pattern) (has-type Present $pattern))
 ;             (get-arity (cdr-atom $pattern))
 ;             1)))

; (= (n_conjuncts $pattern) (
;         if (not (is-pattern-et $pattern))
;         0
; ( let* (($che ,) ($pro (has-type $che $pattern))) (if $pro
;             (get-arity $pattern)
;             1
;         ))

; )
; )
(= (n_conjuncts $pattern) (
        if (not (is-pattern-et $pattern))
        0
 (let $che (has-type , $pattern) (if $che (get-arity $pattern) 1)))
            
        )
; !(n_conjuncts (, A B C))
; !(n_conjuncts (P $x))

;; Function: intilize
;; 
;; Description:
;;   Initializes the given database by performing the following steps:
;;     1. Retrieves all atoms from the database ($db) using get-atoms.
;;     2. Collapses the retrieved atoms to form a simplified representation.
;;     3. Counts the number of tuples present in the collapsed data.
;;     4. Adds a new atom to self with the computed tuple count.
;;
;; Parameters:
;;   $db - The database object containing the atoms to process.
;;
;; Returns:
;;   The modified self with the new atom added, encapsulating the tuple count.
(= (intilize $db) (add-atom &self (db-size $db (tuple-count (collapse (get-atoms $db))))))
; !(bind! &db (new-space))
; !(add-atom &db (A B))
; !(intilize &db)
; !(match &self (db-size &db $n) $n)

;; Function: db_size
;;
;; Description:
;;   Computes the size of a dynamic space by counting the number of atoms present.
;;
;; Parameters:
;;   $db - An instance of hyperon::space::DynSpace representing the database.
;;
;; Returns:
;;   A Number indicating the total count of atoms in the database.
;;
;; Details:
;;   - Retrieves all atoms from the dynamic space using get-atoms.
;;   - Collapses the list of atoms to a simpler form.
;;   - Uses tuple-count to determine the number of atoms.
 ;;db size
; (: db_size (-> SpaceType  Number))
(= (db_size $db)
     (tuple-count (collapse (get-atoms $db)))
    
)
; !(bind! &db (new-space))
; !(add-atom &db (A B))
; !(add-atom &db (C D))
; !(db_size &db)

 ;;abs accepts a number and returns an absolute value of a number
; (: abs (-> Number Number))
(= (abs $x)
    (if (>= $x 0)
        $x
        (* $x -1)
    )
)
; !(abs -5)


 ;; equals-to-zero  accepts a Number and compares it with zero if it is equals to zero it returns a boolean value True else False
; (: equals-to-zero (-> Number Bool))
(= (equals-to-zero $x) (== $x 0))
; !(equals-to-zero 0)
; !(equals-to-zero 5)

 ;; classify_integer_position function accepts a Number and returns a strings that tells if a number is Greater than zero equal to zero or less than zero
; (: classify_integer_position (-> Number String))
(= (classify_integer_position $x)
    (if (> $x 0)
        ("Greater than zero")
        (case (equals-to-zero $x)
            (
                (False "Less than zero")
                (True "Equal to zero")))))
; !(classify_integer_position 5)
; !(classify_integer_position 0)
; !(classify_integer_position -5)

 ;; pow is a function that calculates a to the power of b where a and b are numbers
; (: pow (-> Number Number Number))
(= (pow $a $b)
    (case (classify_integer_position $b)
        (
            ("Equal to zero" 1)
            ("Less than zero" (// 1 (pow $a (abs $b))))
            ($_ (* $a (pow $a (- $b 1))))
        )
)
)
; !(pow 2 3)
; !(pow 2 0)
; !(pow 2 -2)

 ;; universe count

(= (universe-count $pattern $db)
    (pow-math (db_size $db) (n_conjuncts $pattern))

)
; !(bind! &db (new-space))
; !(add-atom &db (A B))
; !(add-atom &db (C D))
; !(universe-count (, (P $x) (Q $y)) &db)

 ;Check if atom is member of list or not
(= (is-member $y $list) (== (intersection-atom ($y) $list) ($y)))
; !(is-member B (A B C))
; !(is-member D (A B C))


 ;check if atom is variable or not


 ; THIS IMPLEMENTATION CONSIDERS THE VARIABLE NAMES
 ; THIS WILL REMOVE REDUNDANT CLAUSES ALONG WITH THE ABSTRACTS
(= (is_more_abstract ($link1 $x1 $y1) ($link2 $x2 $y2))
    (if (== $link1 $link2)
        (if
            (and
                (or
                     ; Check if x1 and x2 are equal, or x1 is more abstract (a variable)
                    (== $x1 $x2)
                    (and
                        (== (get-metatype $x1) Variable)
                        (== (get-metatype $x2) Symbol)))
                (or
                     ; Check if y1 and y2 are equal, or y1 is more abstract (a variable)
                    (== $y1 $y2)
                    (and
                        (== (get-metatype $y1) Variable)
                        (== (get-metatype $y2) Symbol))))
            True
            False )
        False
    )
)
; !(is_more_abstract (link $x B) (link A B))
; !(is_more_abstract (link A B) (link $x B))


 ; Recursive function to check if the given clause is more abstract than any clause in the rest
(= (is_more_abstract_in_list $clause $clauses)
    (if (== $clauses ()) ; Base case: no more clauses to compare
        False
        (if (and (not (== $clause (car-atom $clauses))) (is_more_abstract $clause (car-atom $clauses))) ; Compare with the first clause
            True
            (is_more_abstract_in_list $clause (cdr-atom $clauses)) ; Recurse through the rest
        ))
)
; !(is_more_abstract_in_list (link $x B) ((link A B) (link C D)))

 ; Function to remove abstract clauses from a list of patterns
(= (remove_abstract_clauses $clauses $original_clauses)
    (if (== $clauses ())
        ()
        (let* (
                ($clause (car-atom $clauses))
                ($is_abstract (is_more_abstract_in_list $clause $original_clauses)) ; Check if clause is abstract
            )
         ; If the clause is abstract, skip it; otherwise, keep it
        (if $is_abstract
            (remove_abstract_clauses (cdr-atom $clauses) $original_clauses) ; Skip the clause and continue
            ($clause (remove_abstract_clauses (cdr-atom $clauses) $original_clauses)) ; Keep the clause and continue
        )))
)
; !(remove_abstract_clauses ((link $x B) (link A B) (link C D)) ((link $x B) (link A B) (link C D)))

 ; Initial function to call to remove abstract clauses
(= (remove_abstract_clauses_initial $clauses)
    (remove_abstract_clauses $clauses $clauses) ; Start with original clauses
)
; !(remove_abstract_clauses_initial ((link $x B) (link A B) (link C D)))


;; =============================================================================
;; Function: get_variables
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Extracts all variables from a pattern expression by recursively traversing
;;   the structure and collecting elements with Variable metatype.
;;
;; Input:
;;   - `$pattern`: The expression to analyze (e.g., `(P $x $y (Q $z))`)
;;
;; Output:
;;   - A flat list of all variables found (e.g., `($x $y $z)`)
;;   - Empty list if no variables found or input is empty
;; NOTE: Duplicated function
(= (get_variables $exp) (get-variables $exp))
; !(get_variables (P $x $y (Q $x $z)))


 ; Helper function to check if a variable is in a nested list
(= (is_variable_in_list $variable $list)
    (if (== $list ())
        False ; If list is empty, return False
        (if (== $variable (car-atom $list))
            True ; If the variable matches the first item, return True
            (is_variable_in_list $variable (cdr-atom $list)) ; Check the rest of the list
        )
)
)
; !(is_variable_in_list $x ($y $x $z))
; !(is_variable_in_list $a ($y $x $z))

; Function: is_variable_joint_with_clauses
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Determines if a variable appears in any clause from a list of clauses.
;;   Essentially checks if a variable is "connected" to any clause in the set.
;;
;; Inputs:
;;   - `$variable`: The target variable to find (e.g., `$x`)
;;   - `$clauses`: List of clauses to search through (e.g., `((P $x) (Q $y) (R $x $z))`)
;;
;; Output:
;;   - True if the variable appears in any clause
;;   - False if the variable isn't found or clauses list is empty
;;
;; How it works:
;;   1. Base Case: Returns False for empty clauses list
;;   2. Recursive Case:
;;      a. Extracts variables from first clause using `get_variables`
;;      b. Checks if target variable exists in these variables (`is_variable_in_list`)
;;      c. Returns True if found, otherwise processes remaining clauses
;;
(= (is_variable_joint_with_clauses $variable $clauses)
    (if (== $clauses ())
        False ; If no clauses are left, return False
        (let* (
                ($clause_vars (let $temp (car-atom $clauses) (get_variables $temp))) ; Extract variables from the current clause
            )
         ; Check if the variable is in the current clause's variables
        (if (is_variable_in_list $variable $clause_vars) ; ismember
            True ; If found, return True
            (is_variable_joint_with_clauses $variable (cdr-atom $clauses)) ; Otherwise, check the next clause
        )
)
))
; !(is_variable_joint_with_clauses $x ((P $x) (Q $y) (R $x $z)))
; !(is_variable_joint_with_clauses $a ((P $x) (Q $y) (R $x $z)))

;; =============================================================================
;; Function: are_all_variables_joint
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verifies if ALL variables in a clause are connected to at least one other clause
;;   in a given clauses list (jointness check for variable elimination).
;;
;; Inputs:
;;   - ($v $vs): The variables to check (as a list, e.g., `(?x ?y ?z)`)
;;   - $clauses: The list of clauses to check against (e.g., `((P ?x ?y) (Q ?y ?z))`)
;;
;; Output:
;;   - True if every variable appears in at least one other clause
;;   - False if any variable isn't found in other clauses
;;   - True for empty variables list (vacuous truth)
;;
;; How it works:
;;   1. Base Case: Empty variables list returns True
;;   2. Recursive Case:
;;      a. Checks if first variable ($v) is joint using is_variable_joint_with_clauses
;;      b. If True: processes remaining variables ($vs)
;;      c. If False: immediately returns False (short-circuit)
;;
(= (are_all_variables_joint () $clauses) True)
(= (are_all_variables_joint $variables $clauses)(
   let ($h $t) (decons-atom $variables)
       (and 
            (not (== () (find_common $h $clauses)))
            (are_all_variables_joint $t $clauses)
      )
))
; !(are_all_variables_joint ($x $y) ((P $x $a) (Q $y $b)))

;; Function: find_common
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Identifies if a specific element exists in any clause from a list of clauses.
;;   Returns the element if found, otherwise returns an empty list.
;;
;; Inputs:
;;   - `$el`: The target element to find (e.g., `$x`)
;;   - `$list`: List of clauses to search through (e.g., `((P $x) (Q $y) (R $z))`)
;;
;; Output:
;;   - The element `$el` if it appears in any clause
;;   - An empty list if `$el` isn't found in any clause
;;
;; How it works:
;;   1. Collapses the list of clauses into a single flat list of elements
;;   2. Uses helper function `_find_common` to check for presence of `$el`
;;   3. Returns `$el` if found, otherwise returns empty list
(= (find_common $el $list) (collapse (_find_common $el (superpose $list))))
(= (_find_common $el $clause) (if (== () (intersection-atom ($el) $clause)) (empty) $el))
; !(find_common $x ((P $x) (Q $y) (R $z)))
; !(find_common $a ((P $x) (Q $y) (R $z)))




 ;; =============================================================================
;; Function: has_only_joint_variables
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Determines if all variables in a clause appear in at least one other clause
;;   from a given list of clauses (jointness check for knowledge base consistency).
;;
;; Inputs:
;;   - `$clause`: The clause to check (e.g., `(P $x $y)`)
;;   - `$clauses`: List of other clauses to check against (e.g., `((Q $x $z) (R $y))`)
;;
;; Output:
;;   - True if every variable in $clause appears in at least one other clause
;;   - False if any variable in $clause is not found in other clauses
;;   - True for clauses with no variables (vacuous truth)
;;
;; How it works:
;;   1. Extracts all variables from $clause using get_variables
;;   2. Verifies jointness using are_all_variables_joint
;;
(= (has_only_joint_variables $clause $clauses)
    (let* (
            ($clause_vars (get_variables $clause)) ; Extract variables from the clause
        )
     ; Check if each variable in the clause is joint with the other clauses
    (are_all_variables_joint $clause_vars $clauses)
)
)

; !(has_only_joint_variables (Inheritance $X $Z $Y)
;     ( (Inheritance $X pet)
;         (Inheritance cat $Y)
;         (Inheritance $Z $X)))

 ; ########################
 ; General function to remove redundant patterns if they are in
 ; list format
 ; ########################

(: remove_redundant_clauses (-> (List Clause) (List Clause)))
(= (remove_redundant_clauses ())
    ()
)
(= (remove_redundant_clauses ( $clause $rest))
    (setInsert $clause (remove_redundant_clauses $rest))
)
; !(remove_redundant_clauses ((A B) (C D) (A B)))

(: setInsert (-> $t (List $t) (List $t)))
(= (setInsert $item ())
    ( $item ())
)
(= (setInsert $item ( $head $tail))
    (if (== $item $head)
        ( $head $tail)
        ( $head (setInsert $item $tail))
    )
)
; !(setInsert (A B) ((C D) (E F)))
; !(setInsert (A B) ((C D) (A B) (E F)))

;;;;;;;;;;; converters ;;;;;;;;; 
;;;;;;;;;;; converters ;;;;;;;;; 
;; Converts a list to a tuple
(= (list_to_tuple Nil) ())
(= (list_to_tuple (Cons $head $tail)) (
  let $temp (list_to_tuple $tail) (cons-atom $head $temp)
))
; !(list_to_tuple (Cons A (Cons B (Cons C Nil))))

;; =============================================================================
;; Function: tuple_to_list
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Converts a flat list into a nested Cons-cell structure, transforming
;;   `(a b c)` into `(Cons a (Cons b (Cons c Nil)))`.
;;
;; Input:
;;   - $list: A flat list of elements (e.g., `(a b c)`)
;;
;; Output:
;;   - A nested Cons structure (e.g., `(Cons a (Cons b (Cons c Nil)))`)
;;   - Nil for empty input
;;
;; How it works:
;;   1. Base Case: Empty input returns Nil
;;   2. Recursive Case:
;;      a. Splits list into head and tail
;;      b. Builds Cons cell with head and recursive tail processing
;;
(= (tuple_to_list ()) Nil)
(= (tuple_to_list $list)( 
   let ($head $tail) (decons-atom $list) (
      if (== $head ,) (tuple_to_list $tail)
      (Cons $head (tuple_to_list $tail)))))
; !(tuple_to_list (a b c))



;; =============================================================================
;; Function: is_subclause_helper
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Recursively checks if a given clause (`$head`) appears anywhere in a pattern,
;;   including nested expressions. Returns all matches found.
;;
;; Inputs:
;;   - `$head`: The clause to search for (typically an expression)
;;   - `$pattern`: The pattern structure to search through
;;
;; Output:
;;   - List of True values for each exact match found
;;   - Empty list if no matches found or pattern is empty
;;
;; How it works:
;;   1. Base Case: Returns empty list for empty pattern
;;   2. Recursive Processing:
;;      a. Checks if current element is an Expression
;;      b. For exact matches: returns (True)
;;      c. For nested expressions: recursively searches both head and tail
;;      d. For atoms: just processes the tail

(= (is_subclause $el $expr) (
    let $res (collapse (_is_subclause $el $expr)) (not (== (intersection-atom (True) $res) ()))
))
(= (_is_subclause $el $expr) (
   if (== $el $expr) True
      (if (not (== (get-metatype $expr) Expression)) False
          (_is_subclause $el (superpose $expr))
      )
))
; !(is_subclause (Implies $x $y) (Implies (Human (Implies $x $y)) (Mortal $X)))

;; =============================================================================
;; Function: remove_current
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Removes all occurrences of a specific clause (`$current_clause`) from an expression,
;;   while preserving the structure and order of other elements.
;;
;; Inputs:
;;   - `$current_clause`: The clause to remove (exact match)
;;   - `$original_expr`: The expression to filter (may contain nested structures)
;;
;; Output:
;;   - A new expression with all instances of `$current_clause` removed
;;   - Empty list if all clauses are removed or input is empty
;;
;; How it works:
;;   1. Base Case: Returns empty list for empty input
;;   2. Recursive Processing:
;;      a. Splits expression into head and tail
;;      b. If head matches target clause: skips and processes tail
;;      c. Otherwise: keeps head and recursively processes tail
;;
(= (remove_current $current_clause $original_expr)
    (if (== $original_expr ())
        ()
        (let* (
                ($head (car-atom $original_expr))
                ($tail (cdr-atom $original_expr)))
            (if (== $head $current_clause)
                (remove_current $current_clause $tail)
                (concatTuple ($head) (remove_current $current_clause $tail))))
    )
)
; !(remove_current B (A B C B D))

(= (remove_redundant_subclauses $exp)
    (remove_redundant_subclauses_helper $exp $exp)
)

(= (remove_redundant_subclauses_helper $expr $original_expr)
    (if (== $expr ())
        ()
        (let* (
                ($current_clause (car-atom $expr))
                ($remaining_expr (cdr-atom $expr))
                ($ori_exp_without_current (remove_current $current_clause $original_expr)))
            (if (is_subclause $current_clause $ori_exp_without_current)
                (remove_redundant_subclauses_helper $remaining_expr $original_expr)
                (concatTuple ($current_clause ) (remove_redundant_subclauses_helper $remaining_expr $original_expr))))
    )
)

; !(remove_redundant_subclauses (, (Implies $x $W) (Implies (Human (Implies $x $y) (Mortal $X))) (Mortal $X) ))

 ; ##############################


(= (is_pat_more_abstract $l_pat $r_pat $relative_var)
    (if (== (car-atom $l_pat) ,)
        (if (== (car-atom $r_pat) ,)
            (process_input_for_check (cdr-atom $l_pat) (cdr-atom $r_pat) $relative_var)
            (process_input_for_check (cdr-atom $l_pat) ($r_pat) $relative_var))
        (if (== (car-atom $r_pat) ,)
            (process_input_for_check ($l_pat) (cdr-atom $r_pat) $relative_var)
            (process_input_for_check ($l_pat) ($r_pat) $relative_var))
    )
)
; !(is_pat_more_abstract (, (P $x)) (, (P A) (Q B)) ($x))

(= (process_input_for_check $l_pat $r_pat $relative_var)
    (if (== $l_pat ())
        False
        (check_pattern_match (car-atom $l_pat) $r_pat $relative_var $l_pat $r_pat)
    )
)
; !(process_input_for_check ((P $x)) ((P A) (Q B)) ($x))

(= (check_pattern_match $l_pat $r_pat $relative_var $ori_l_pat $ori_r_pat)
    (if (== $r_pat ())
        (process_input_for_check (cdr-atom $ori_l_pat) $ori_r_pat $relative_var)
        (if (is_more_abstract $l_pat  (car-atom $r_pat) $relative_var)
            True
            (check_pattern_match $l_pat (cdr-atom $r_pat) $relative_var $ori_l_pat $ori_r_pat))
    )
)
; !(check_pattern_match (P $x) ((P A) (Q B)) ($x) ((P $x)) ((P A) (Q B)))


;; ------------------------------------------------------------------
;; Function: support
;;
;; Description:
;;   Computes the support value for a given pattern in relation to a
;;   database. The function recursively evaluates the support for each
;;   component (or "clouse") within the pattern.
;;
;; Parameters:
;;   $pattern - The pattern for which support is calculated. It can 
;;              consist of multiple sub-patterns obtained via get-clouses.
;;   $db      - The database context against which the pattern support
;;              is computed.
;;
;; Behavior:
;;   1. Retrieves the list of sub-patterns (clouses) using get-clouses.
;;   2. If the sub-pattern list is empty, returns a support value of 1,
;;      representing a base or trivial support.
;;   3. Otherwise, the function:
;;         - Decomposes the sub-pattern list into the head and tail.
;;         - Computes the support of the head using a separate
;;           support evaluation function (sup).
;;         - Recursively computes the support for the tail.
;;         - Multiplies the results to generate the overall support.
;;
;; Returns:
;;   A numeric value representing the cumulative support for the pattern.
;; ------------------------------------------------------------------
(= (support $pattern $db) (
    let $patterns (get-clouses $pattern) 
    
    (if (== $patterns ())
        1
        (let* (
                ($head (car-atom $patterns))
                ($tail (cdr-atom $patterns))
                ($sup (sup $head $db))

            )
            (* $sup (support $tail $db))
        )
    )
      
)
)
; !(bind! &db (new-space))
; !(add-atom &db (A B))
; !(add-atom &db (C D))
; !(add-atom &db (A C))
; !(bind! sup (lambda ($p $d) (sup-num $d $p)))
; !(support (, (A $x) (C $y)) &db)
 


;; Documentation for add-conjunct:
;; 
;; Description:
;;   This function ensures that a given pattern starts with a comma.
;;   - If the input pattern is empty, it simply returns an empty pattern.
;;   - If the pattern is non-empty, the function checks its first element.
;;   - If the first element is already a comma, the pattern is returned unchanged.
;;   - Otherwise, it prepends a comma to the pattern and returns the new pattern.
;;
;; Parameters:
;;   $pattern - The list or pattern to which a comma may need to be added.
;;
;; Returns:
;;   A pattern that either remains unchanged (if it already starts with a comma or is empty)
;;   or has a comma prepended if the first element is not a comma.
( = (add-conjunct $pattern)
    (if (== $pattern ()) 
        () 
        (let $front-link (car-atom $pattern) 
            (if (== $front-link ,) 
            $pattern 
            (cons-atom , $pattern)))))
; !(add-conjunct (A B C))
; !(add-conjunct (, A B C))
; !(add-conjunct ())