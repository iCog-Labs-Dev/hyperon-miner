!(bind! &scores (new-space))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Helper Functions ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Pop's out the last element and returns both the popped element and the remaining list
;;; Parameters: expression
;;; Returns: a tuple of remaining elements and popped element
;;; E.g, (pop (a b c)) -> ((a b) (c))
(= (pop $pattern) (pop () $pattern))
(= (pop $head $tail)(
   if (== $tail ()) (() ())
      ( let ($h $t) (decons-atom $tail)
            ( if (== $t ())
                 ($head ($h))
                 (pop (union-atom $head ($h)) $t)))))

;;; Finds the score of a variable in the scores space
;;; Parameters: variable
;;; Returns: the score of the variable or Nil if not found
;;; E.g, (find_score A) -> score or Nil
(= (find_score $var)(
    let $res (collapse (match &scores ($var $score) ($var $score)))
        (if (== $res ()) Nil (let ($k $v) (car-atom $res) $v ))
))

;;; Finds the the maximum index number in the scores atom-space
;;; Parameters: None
;;; Returns: Float Number
;;; E.g, (find_max_index) -> 14.0
(= (find_max_index)(   
   let $scores (collapse (match &scores ($var $score) $score))
       (if (== $scores ()) 0 (max-atom $scores))
))

;;; Gets a collapsed set of elements stored in a given space
;;; Parameters: Atomspace
;;; E.g, (get_space_store &scores) -> ((A 1) (B 2))
(= (get_space_store $space)(collapse (get-atoms $space)))

;;; Gets a unique set of an expression constitutes (variables, symbols, Grounded atoms)
;;; Paremeters: expression
;;; Returns: an expression set of elements
;;; E.g, (parse_elements (Inheritance a b 2 True ($c b) $d $c 2 True))  ->  [(Inheritance a b $d $c 2 True)]
(= (parse_elements $pat)( 
    let $res (collapse (_parse_elements $pat))
        ( foldl-atom $res () $acc $x 
            ( if (== (intersection-atom ($x) $acc) ()) (cons-atom $x $acc) $acc ))))
(= (_parse_elements $pat)(
    if (== (get-metatype $pat) Expression)
       (_parse_elements (superpose $pat))
       $pat))

;;; Registers every element into the score-space
;;; Parameters: an expression
;;; Returns: Updated store elements
;;; E.g, (set_store (a b c)) ->  ((a 1.0)(b 2.0)(c 3.0))
(= (set_score $pattern)(let $ (collapse (_set_score $pattern)) (get_space_store &scores)))
(= (_set_score $pattern)(
    let* (($elements (parse_elements $pattern))
         ($ (_set_score &scores (superpose $elements)))) ()
))
(= (_set_score $store $element)(
    if (== Nil (find_score $element))
       (let $index (+ 1.0 (find_max_index)) (add-atom $store ($element $index))) ()
))


;;; Calculates the score of an expression based on the sum of elements it contains
;;; Parameters: an expression
;;; Returns: a number
;;; NOTE: the score works if the atoms are all registered into the score space (&scored)
;; E.g, (calc_score (a b c)) -> 6.0
(= (calc_score $pattern)(
    let $score_set (collapse (_calc_score ($pattern)))
        (foldl-atom $score_set 0 $acc $x (+ $acc $x))
))
(= (_calc_score $pattern)(
    let $pat (superpose $pattern)
        (if (== (get-metatype $pat) Expression)
            (_calc_score $pat)
            ( let $sc (find_score $pat) (if (== $sc Nil) 0 $sc)))
))

;;; Compares a pattern / vriable with another pattern / variable
;;; Parameters: $p1 - the first pattern we want to compare
;;;             $p2 - the second pattern the first pattern will be compared to
;;; Returns: a boolean
;;; E.g, (gt (a b) (a b c)) -> False
;;;      (gt (a b c) (a b)) -> True
(= (gt $p1 $p2)(
    if (== $p1 ()) False
       (if (== $p2 ()) True   
           (let* (
                    (($h1 $t1) (if (== (get-metatype $p1) Expression) (decons-atom $p1) ($p1 ())))
                    (($h2 $t2) (if (== (get-metatype $p2) Expression) (decons-atom $p2) ($p2 ())))
                    (($s1 $s2) ((calc_score $h1)(calc_score $h2)))
                ) (  if (== $s1 $s2) (gt $t1 $t2) (> $s1 $s2) )
            ))
))

;;; A single loop of passing the largest value to the right of the list
;;; A helper funciton for the main loop
(= (sort_pass $pattern)(
    if (== $pattern ()) ()
       (let* (
                (($h $t) (decons-atom $pattern))
                (($h2 $t2) (if (== $t ()) (Nil ()) (decons-atom $t)))
            ) (
                if (== $h2 Nil) ($h)
                   ( if (gt $h $h2)
                        (let $tmp (sort_pass (cons-atom $h $t2)) (cons-atom $h2 $tmp))
                        (let $tmp (sort_pass $t) (cons-atom $h $tmp))
                    )
            )
       )
))


;;; Sorts an expression using bubble sort algorithm.
;;; Parameters: an expression or pattern
;;; Returns: a newly sorted expression
;;; E.g, (sort (Inheritance c b a)) -> (Inheritance c b a)
;;;      (sort (Inheritance a b c)) -> (Inheritance c b a)
(= (sort $pattern)(
    if (== $pattern ())
       ()
       (let* (
            ($ (set_score $pattern))
            ($passed (sort_pass $pattern))
            (($rest $last) (pop $passed))
            ($rem (sort $rest))
        )
        (union-atom $rem $last))
))

!(sort (
    (Inheritance c c b a)
    (Inheritance a b c)
    (Inheritance d b a)
)) ; ((Inheritance c c b a) (Inheritance d b a) (Inheritance a b c))
!(sort (
    (Inheritance d b a)
    (Inheritance a b c)
    (Inheritance c c b a)
)) ; ((Inheritance c c b a) (Inheritance d b a) (Inheritance a b c))