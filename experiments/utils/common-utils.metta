 ;; Declaration of List data type and constructors
(: List (-> $a Type))
(: Nil (List $a))
(: Cons (-> $a (List $a) (List $a)))

 ;; Define Nat
(: Nat Type)
(: Z Nat)
(: S (-> Nat Nat))

 ;; Define cast functions between Nat and Number
(: fromNumber (-> Number Nat))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))
(: fromNat (-> Nat Number))
(= (fromNat Z) 0)
(= (fromNat (S $k)) (+ 1 (fromNat $k)))

 ;; Count the number elements in an expression
(: tuple-count (-> %Undefined% Number))
(= (tuple-count $atom) (if (== $atom ()) 0 (+ 1 (tuple-count (cdr-atom $atom)))))

 ;; Count the number of instances of a given pattern
(: counter (-> hyperon::space::DynSpace Atom Number))
(= (counter $db $pattern)
    (let $result (collapse (match $db $pattern $pattern))
        (tuple-count $result)
    )
)

;(: counter (-> hyperon::space::DynSpace Atom Number))
;(= (counter $db ($link $x $y))
;    (let $result (collapse (match $db ($link $x) ($link $x)))
;        (tuple-count $result)
;    )
;)
; Count the number of instances of a given pattern
(= (count ($link $x $y) $db)
    (let ($link1 $x1 $y1) (Debruijn2var ($link $x $y) (Cons $Xvar (Cons $Yvar (Cons $Zvar Nil))))
                (let $result (collapse (match $db ($link1 $x1 $y1) ($link1 $x1 $y1)))(tuple-count $result)))
)
;; Evaluate if the pattern has enough support
(: sup-eval (-> hyperon::space::DynSpace Atom Number Boolean))
(= (sup-eval $db ($link $x $y) $ms)
    (let $sup (count ($link $x $y) $db)
        (if (>= $sup $ms) (candidate ($link $x $y)) (superpose ()))
    )
)



 ;Check if expression is truth value or not
(: cog-tv? (-> Atom Boolean))
(= (cog-tv? $EXP)
    (if (== (match &self (stv $value $mean $conf) True) True)
        True
        False
    )
)

(= (has-type $x Nil) False)
(= (has-type $x ($l $head $tail)) (if (== $x $l) True (has-type $x $tail)))

 ;;(: get-arity (-> $pattern) Number)
(= (get-arity Nil ) 0 )
(= (get-arity $pattern)
    (- (count-atom-element $pattern) 1) )

(= (n_conjuncts Nil) (0))
(= (n_conjuncts $pattern)
    (if (not (has-type lambda $pattern))
        0
        (if (or (has-type and $pattern) (has-type Present $pattern))
            (get-arity (cdr-atom $pattern))
            1)))

 ;;db size
(: db_size (-> hyperon::space::DynSpace  Number))
(= (db_size $db)
    (count-atom-element (collapse (get-atoms $db)))
)

 ;;abs accepts a number and returns an absolute value of a number
(: abs (-> Number Number))
(= (abs $x)
    (if (>= $x 0)
        $x
        (* $x -1)
    )
)

 ;; equals-to-zero  accepts a Number and compares it with zero if it is equals to zero it returns a boolean value True else False
(: equals-to-zero (-> Number Boolean))
(= (equals-to-zero $x) (== $x 0))

 ;; classify_integer_position function accepts a Number and returns a strings that tells if a number is Greater than zero equal to zero or less than zero
(: classify_integer_position (-> Number String))
(= (classify_integer_position $x)
    (if (> $x 0)
        ("Greater than zero")
        (case (equals-to-zero $x)
            (
                (False "Less than zero")
                (True "Equal to zero")))))
 ;; pow is a function that calculates a to the power of b where a and b are numbers
(: pow (-> Number Number Number))
(= (pow $a $b)
    (case (classify_integer_position $b)
        (
            ("Equal to zero" 1)
            ("Less than zero" (/ 1 (pow $a (abs $b))))
            ($_ (* $a (pow $a (- $b 1))))
        )
)
)

 ;; universe count
(= (universe-count $pattern $db)
    (pow (db_size $db) (n_conjuncts $pattern))

)

 ;Check if atom is member of list or not
(= (is-member $y ()) False)
(= (is-member $y ($x $xs))
    (if (== $y $x)
        True
        (is-member $y $xs)
    )
)

 ;check if atom is variable or not
(= (is-variable $x)
    (if (== (get-metatype $x) Variable)
        True
        False
    )
)

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

 ;Test
 ; ! (is_more_abstract (Inheritance cat $Y) (Inheritance $X pet))

 ; Recursive function to check if the given clause is more abstract than any clause in the rest
(= (is_more_abstract_in_list $clause $clauses)
    (if (== $clauses ()) ; Base case: no more clauses to compare
        False
        (if (and (not (== $clause (car-atom $clauses))) (is_more_abstract $clause (car-atom $clauses))) ; Compare with the first clause
            True
            (is_more_abstract_in_list $clause (cdr-atom $clauses)) ; Recurse through the rest
        ))
)

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

 ; Initial function to call to remove abstract clauses
(= (remove_abstract_clauses_initial $clauses)
    (remove_abstract_clauses $clauses $clauses) ; Start with original clauses
)

 ; Test the remove_abstract_clauses function
 ; ! (remove_abstract_clauses_initial ( (Inheritance cat $Y) (Inheritance $X pet) (Inheritance $X $Y) ))
 ; ! (remove_abstract_clauses_initial ( (Inheritance $X C1) (Inheritance C2 $Y) (Inheritance $X $Y) ))
 ; ! (remove_abstract_clauses_initial ( (Inheritance $X $Y) (Inheritance $Y $Z) (Inheritance $Z $W) ))

 ; Function: get_variables
 ; This function extracts all the variables from a given pattern (Expression).
 ; It works recursively by checking each element of the pattern to see if it is of the metatype "Variable".

(= (get_variables $pattern)
    (if (== $pattern ())
        ()
        (if (== (let* (
                        ($var (car-atom $pattern)))
                    (get-metatype $var)) Variable)
            ( (car-atom $pattern) (get_variables (cdr-atom $pattern)))
            (get_variables (cdr-atom $pattern))
        ))
)

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

 ; Helper function to check if a variable is joint with any clause
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

 ; Recursive function to check all variables in the clause
(= (are_all_variables_joint () $clauses) True)
(= (are_all_variables_joint ($v $vs) $clauses)
    (if (is_variable_joint_with_clauses $v $clauses)
        (are_all_variables_joint $vs $clauses) ; Check the next variable
        False ; If one variable is not joint, return False
    )
)

 ; Main function: check if all variables in the clause are joint with other clauses
(= (has_only_joint_variables $clause $clauses)
    (let* (
            ($clause_vars (get_variables $clause)) ; Extract variables from the clause
        )
     ; Check if each variable in the clause is joint with the other clauses
    (are_all_variables_joint $clause_vars $clauses)
)
)

 ; Test: Check if all variables in the first clause are joint with others
 ; ! (has_only_joint_variables (Inheritance $X $Z $Y)
 ;     ( (Inheritance $X pet)
 ;         (Inheritance cat $Y)
 ;         (Inheritance $Z $X)))

 ;########################
 ; General function to remove redundant patterns if they are in
 ; list format
 ;########################

(: remove_redundant_clauses (-> (List Clause) (List Clause)))
(= (remove_redundant_clauses ())
    ()
)
(= (remove_redundant_clauses ( $clause $rest))
    (setInsert $clause (remove_redundant_clauses $rest))
)

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

 ; Test: Remove redundant clauses
 ; ! (remove_redundant_clauses
 ;     ( (Inheritance $X $Y)
 ;         ( (Inheritance $X $Y)
 ;             ( (Inheritance $X $Y)
 ;                 ( (Inheritance $X W) ())
 ;             )
 ;     )
 ; ))

(= (is_subclause $clause $expr)
    (if (== $expr ())
        False
        (if (== $clause (car-atom $expr)) ; If the clause matches the first element
            True
            (is_subclause $clause (cdr-atom $expr))) ; Otherwise, check the rest
    )
)

 ;########################
 ; Remove Redundunt subclauses from the list of clauses
 ; It currently checks for subclauses in one depth.
 ; It can be extended to check for subclauses within subclauses

 ; Main function to process and remove redundant clauses from the expression
(= (remove_redundant_subclauses $exp)
    (process_expressions_for_redundant_subclauses $exp $exp)
)

 ; Outer loop to process the entire expression list
(= (process_expressions_for_redundant_subclauses $expr $original_expr)
    (if (== $expr ()) ; No more clauses, return empty
        ()
        (let* (
                ($current_clause (car-atom $expr)) ; Get the current clause
                ($remaining_expr (cdr-atom $expr))) ; Get the rest of the expression
            (if (is_clause_redundant $current_clause $original_expr) ; Check if current clause is redundant
                (process_expressions_for_redundant_subclauses $remaining_expr $original_expr) ; Skip redundant clause
                ($current_clause (process_expressions_for_redundant_subclauses $remaining_expr $original_expr))))
    )
)

 ; Check if the current clause is redundant by comparing with remaining expressions
(= (is_clause_redundant $clause $remaining_expr)
    (check_nested_subclauses $clause $remaining_expr) ; Check deeper for nested redundancy
)

 ; Go deeper into the structure and check nested subclauses
(= (check_nested_subclauses $clause $remaining_expr)
    (if (== $remaining_expr ())
        False
        (let* (
                ($next_clause (car-atom $remaining_expr)) ; Get the next clause
                ($remaining_rest (cdr-atom $remaining_expr))
                ($is_redundant (or
                        (is_subclause $clause $next_clause) ; Check for subclause in the nested list
                        (check_nested_subclauses $clause $remaining_rest))))
            $is_redundant )
    )
)

 ; ! (remove_redundant_subclauses ( (Mortal $W) (Implies (Human $X) (Mortal $X))  (Human $X) ))

 ; ##############################
(= (is_more_abstract ($link1 $x1 $y1) ($link2 $x2 $y2) $relative_var)
    (if (or (and (== $x1 $x2) (== $x1 $relative_var)) (and (== $y1 $y2) (== $y1 $relative_var)))
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
    False )
)

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

(= (process_input_for_check $l_pat $r_pat $relative_var)
    (if (== $l_pat ())
        False
        (check_pattern_match (car-atom $l_pat) $r_pat $relative_var $l_pat $r_pat)
    )
)

(= (check_pattern_match $l_pat $r_pat $relative_var $ori_l_pat $ori_r_pat)
    (if (== $r_pat ())
        (process_input_for_check (cdr-atom $ori_l_pat) $ori_r_pat $relative_var)
        (if (is_more_abstract $l_pat  (car-atom $r_pat) $relative_var)
            True
            (check_pattern_match $l_pat (cdr-atom $r_pat) $relative_var $ori_l_pat $ori_r_pat))
    )
)

 ; ! (is_pat_more_abstract (Inheritance $Z $W) (Inheritance $Z $Y) $Z) ;[False]
 ; ! (is_pat_more_abstract (Inheritance $Z $W) (Inheritance $Z A) $Z) ; [True]
 ; ! (is_pat_more_abstract (, (Inheritance $X $W) (Inheritance $X B)) (Inheritance $Z A) $X) ; [False]
 ; ! (is_pat_more_abstract (, (Inheritance $X $W) (Inheritance $Y B)) (Inheritance $X A) $X) ; [True]
 ; ! (is_pat_more_abstract (, (Inheritance $X $W) (Inheritance $Y B)) (, (Inheritance $X $Y) (Inheritance $X C0)) $X) ; [True]