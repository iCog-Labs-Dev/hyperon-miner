!(register-module! ../../utils)
!(import! &self utils:common-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Unit Tests for common-utils ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; --------------------------------
;;;; TEST FOR `flatten`
; --------------------------------
; `flatten` function should accept a nested conjunction and return a flattened conjunction
; Flattened conjunction
!(assertEqualToResult (flatten (, A B)) ((, A B)))

; Partially Nested flattening
!(assertEqualToResult (flatten (, (, A B) C)) ((, A B C)))
!(assertEqualToResult (flatten (, A (, B C))) ((, A B C)))

; Nested flattening
!(assertEqualToResult (flatten (, (, A B) (, C D))) ((, A B C D)))



; --------------------------------
;;;; TEST FOR `conjunct-pattern`
; --------------------------------
; `conjunct-pattern` function should accept a list of blocks and a space, then output a conjunctive pattern combining the passed list patterns

!(assertEqualToResult 
   (conjunct-pattern (A B) (new-space))
   ((, A B))
)
!(assertEqualToResult 
   (conjunct-pattern () (new-space))
   ((,))
)
!(assertEqualToResult 
   (conjunct-pattern ((A)) (new-space))
   ((, (A)))
)
!(assertEqualToResult 
   (conjunct-pattern ((A) B) (new-space))
   ((, (A) B))
)
!(assertEqualToResult 
   (conjunct-pattern (A (B)) (new-space))
   ((, A (B)))
)


; --------------------------------
;;;; TEST FOR `//`
; --------------------------------
; `//` function should two numbers and return floating point division result
!(assertEqualToResult (// 4 2) (2))
!(assertEqualToResult (// 5 2) (2.5))
!(assertEqualToResult (// 5.0 2) (2.5))
!(assertEqualToResult (// 5 2.0) (2.5))
!(assertEqualToResult (// 5.0 2.0) (2.5))


; --------------------------------
;;;; TEST FOR `concatTuple`
; --------------------------------
; `concatTuple` function should accept two tuples and return their concatenation
!(assertEqualToResult (concatTuple (A B) (C D)) ((A B C D)))
!(assertEqualToResult (concatTuple () (C D)) ((C D)))
!(assertEqualToResult (concatTuple (A B) ()) ((A B)))
!(assertEqualToResult (concatTuple () ()) (()))


; --------------------------------
;;;; TEST FOR `remove-parenthesis`
; --------------------------------
; `remove-parenthesis` function should accept a pattern and remove outer parenthesis if they exist
!(assertEqualToResult (remove-parenthesis ((A B))) ((A B)))
!(assertEqualToResult (remove-parenthesis (A B)) ((A B)))
!(assertEqualToResult (remove-parenthesis (((A B)))) ((A B)))
!(assertEqualToResult (remove-parenthesis (A)) ((A)))


; ---------------------------------
;;;; TEST FOR `get-variables`
; ---------------------------------
; `get-variables` function should accept a pattern and return a tuple of unique variables in the pattern
!(assertEqualToResult (get-variables ()) (()))
!(assertEqualToResult (get-variables (A)) (()))
!(assertEqualToResult (get-variables (A $a $e E g)) (($a $e)))
!(assertEqualToResult (get-variables (A ($b C) (D $e (F $g)) $h)) (($b $e $g $h)))



; ----------------------------------
;;;; TEST FOR `reverse-list`
; ----------------------------------
; `reverse-list` function should accept a list and return the reversed list
!(assertEqualToResult (reverse-list ()) (()))
!(assertEqualToResult (reverse-list (A)) ((A)))
!(assertEqualToResult (reverse-list (A B C D)) ((D C B A)))
!(assertEqualToResult (reverse-list (A (B C) D)) ((D (B C) A)))


; ----------------------------------
;;;; TEST FOR `remove-element`
; ----------------------------------
; `remove-element` function should accept a list and an element, then return the list without the specified element
!(assertEqualToResult (remove-element A ()) (()))
!(assertEqualToResult (remove-element A (A)) (()))
!(assertEqualToResult (remove-element A (A B C D)) ((B C D)))
!(assertEqualToResult (remove-element J (A B C D)) ((A B C D)))

; ----------------------------------
;;;; TEST FOR `is-present`
; ----------------------------------
; `is-present` function should accept a list and an element, then return true if the element is in the list, false otherwise
!(assertEqualToResult (is-present A ()) (False))
!(assertEqualToResult (is-present A (A)) (True))
!(assertEqualToResult (is-present C (A (B (C)) D)) (True))
!(assertEqualToResult (is-present J (A B C D)) (False))

; ----------------------------------
;;;; TEST FOR `is-pattern`
; ----------------------------------
; `is-pattern` checks whether the given expression is a valid pattern
!(assertEqualToResult (is-pattern (A $a)) ((True)))
!(assertEqualToResult (is-pattern (A B)) ((False)))
!(assertEqualToResult (is-pattern ($a $b)) ((False)))
!(assertEqualToResult (is-pattern ()) ((False)))
!(assertEqualToResult (is-pattern (A ($b C) ($e $h))) ((True)))
!(assertEqualToResult (is-pattern (A ($b C) $j)) ((True)))
!(assertEqualToResult (is-pattern (A $j ($b C) )) ((True)))


; ----------------------------------
;;;; TEST FOR `comp`
; ----------------------------------
; `comp` function should accept an element and a list, return a list with a each elment the combination of the element and each element of the list
!(assertEqualToResult (comp A ()) (()))
!(assertEqualToResult (comp A (B)) (((A B))))
!(assertEqualToResult (comp A (B C)) (((A B) (A C))))


; ----------------------------------
;;;; TEST FOR `get-clouses`
; ----------------------------------
; `get-clouses` function should accept a pattern and return a flattend list of its clouses
!(assertEqualToResult (get-clouses (, A B)) ((, A B)))
!(assertEqualToResult (get-clouses (, (, A B) C)) ((, A B C)))
!(assertEqualToResult (get-clouses (, A (, B C))) ((, A B C)))
!(assertEqualToResult (get-clouses (, (, A B) (, C D))) ((, A B C D)))

; ----------------------------------
;;;; TEST FOR `get-cnj-clouses`
; ----------------------------------
; `get-cnj-clouses` function should accept a pattern and return a list of its conjunctive clauses
!(assertEqualToResult (get-cnj-clouses (, A B)) ((A B)))
!(assertEqualToResult (get-cnj-clouses (A B C)) ((A B C)))
!(assertEqualToResult (get-cnj-clouses (,)) (()))

; ----------------------------------
;;;; TEST FOR `min-max`
; ----------------------------------
; `min-max` function should accept a list of numbers and return a tuple of the minimum and maximum numbers in the list
!(assertEqualToResult (min-max (4 2 8 1 5)) ((1 8)))
!(assertEqualToResult (min-max (3.5 2.1 8.7 1.0 5.6)) ((1.0 8.7)))
!(assertEqualToResult (min-max (5)) ((5 5)))

; -----------------------------------
;;;; TEST FOR `intilize`
; -----------------------------------
; `intilize` function should accept a space and return a space with the size of the space added onto it
!(bind! &db (new-space))
!(intilize &db)
!(assertEqualToResult (match &self (db-size $db $value) $value) (0))

;-----------------------------------
;;;; TEST FOR `is-member`
;-----------------------------------
; `is-member` function should accept an atom and a list, return true if the atom is in the list, false otherwise
!(assertEqualToResult (is-member A ()) (False))
!(assertEqualToResult (is-member A (A)) ((True)))


;------------------------------------
;;;; TEST FOR `is_more_abstract`
;------------------------------------
; `is_more_abstract` function should accept two patterns and return true if the two patterns have simmilar structure and elements
!(assertEqualToResult (is_more_abstract (Inheritance A B) (Inheritance A B)) (True))
!(assertEqualToResult (is_more_abstract (Inheritance A C) (Inheritance A B)) (False))


;------------------------------------
;;;; TEST FOR `get_variables`
;------------------------------------
; `get_variables` function should accept a pattern and return a list of unique variables in the pattern
!(assertEqualToResult (get_variables ()) (()))
!(assertEqualToResult (get_variables (A)) (()))
!(assertEqualToResult (get_variables (A $a $e E g)) (($a ($e ()))))
!(assertEqualToResult (get_variables (A ($b C) (D $e (F $g)) $h)) (($b (()) ($e (F ($g ()))) ($h ()))))

;------------------------------------
;;;; TEST FOR `is_variable_in_list`
;------------------------------------
; `is_variable_in_list` function should accept a variable and a list of variables, return true if the variable is in the list, false otherwise
!(assertEqualToResult (is_variable_in_list $a ()) (False))
!(assertEqualToResult (is_variable_in_list $a ($a)) (True))
!(assertEqualToResult (is_variable_in_list $a ($b $c $d)) (False))
!(assertEqualToResult (is_variable_in_list $a ($b $a $d)) (True))


;------------------------------------
;;;; TEST FOR `is_variable_joint_with_clauses`
;------------------------------------
; `is_variable_joint_with_clauses` function should accept two patterns and return true a variable is directly connected with a clause
!(assertEqualToResult (is_variable_joint_with_clauses $x ((P $x) (Q $y) (R $x $z))) (True))
!(assertEqualToResult (is_variable_joint_with_clauses $t ((P $x) (Q $y) (R $t $z))) (True))
!(assertEqualToResult (is_variable_joint_with_clauses $y ((P $x) (Q $y) (R $x $z))) (True))
!(assertEqualToResult (is_variable_joint_with_clauses $z ((P $x) (Q $y) (R $x $z))) (False))
!(assertEqualToResult (is_variable_joint_with_clauses $x ((P $y) (Q $y) (R $y $z))) (False))
!(assertEqualToResult (is_variable_joint_with_clauses $a ((P $x) (Q $y) (R $x $z))) (False))

;------------------------------------
;;;; TEST FOR `are_all_variables_joint`
;------------------------------------
; `are_all_variables_joint` function should accept a list of variables and a pattern, return true if all variables are directly connected with clauses in the pattern, false otherwise
!(assertEqualToResult (are_all_variables_joint (?x ?y ?z) ((P ?x ?y) (Q ?y ?z))) (True))

;------------------------------------
;;;; TEST FOR `tuple_to_list`
;------------------------------------
!(assertEqualToResult (tuple_to_list ()) (Nil))
!(assertEqualToResult (tuple_to_list (A B C D)) ((Cons A (Cons B (Cons C (Cons D Nil))))))

;------------------------------------
;;;; TEST FOR `is_subclause`
;------------------------------------
!(assertEqualToResult (is_subclause $x ()) (False))
!(assertEqualToResult (is_subclause A (A B C)) (True))
!(assertEqualToResult (is_subclause D (A B C)) (False))

------------------------------------
;;; TEST FOR `support`
------------------------------------
!(assertEqualToResult (support $A (, (link AAA $BBB) (link CCC $CCC))) (1))


;-------------------------------------
;;;; TEST FOR `add-conjunct`
;-------------------------------------
!(assertEqualToResult (add-conjunct ()) (()))
!(assertEqualToResult (add-conjunct (A)) ((, A)))
!(assertEqualToResult (add-conjunct (A B C)) ((, A B C)))
!(assertEqualToResult (add-conjunct (A (B C) D)) ((, A (B C) D)))