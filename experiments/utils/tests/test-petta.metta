
; Not Implemented 
; ; !(register-module! ../../utils)
; ; !(import! &self utils:common-utils)
; ; (bind!)
; ;!(new-space)

; diffrent name 
; decons-atom -> Decons 


; difrent result 



!(import! &self ../common-utils)


;; can't parse this function 
; (= (get-conjuncts $cnj) (
;   unify (, $ncnj $ptrn) $cnj (let $result (get-conjuncts $ncnj) (cons-atom $ptrn $result) ) ($cnj)
; ))

; !(add-atom &self (Inheritance Abe Kebe))
; !(match &self (Inheritance $x $y) ($x $y))

;!(size-atom (1 2 3))
;!(decons-atom  (1 2 3))
;!(cons 1 (2 3))
;!(size-atom (1 2 3))

;!(n_conjuncts_new (, (Inheritance abe kebe) (Inheritance Bob John) (Inheritance Kal Lol)))
;; needs to use eval wraper for tuple-count otherwise it won't reduce it . 

;;(flatten $cnj) not tested becouses of get-conjucts 

 ;;!(get-variables (A $a $e E g)) not works , It may be becouse of intersaction 

;;(reverse-list (A B C D))   works but neds eval in let function 

;!(is-pattern (Inheritance a $s)) ;; doesn't work becouse unify is not working as expected 
;; unify just unify and bidns but when there is function call on binding value it doesn't work . 

;!(unify (Inheritance a $s) ($link $x $y) (is-symbol $link) False )
;!(and  (is-symbol $g) True)
;!(let ($a $b) ( 1 2) (eval (is-variable $a)))


 ;!(is_more_abstract (Inheritance A B) (Inheritance A B)) ;; doesn't work don't know why yet

;!(get_variables (A $a $e E g)) ;; this works but doesn't give the exact varible it give random variable

;!(are_all_variables_joint (?x ?y ?z) ((P ?x ?y) (Q ?y) (R $a))) doesn't work for this case




;! (register-module! ../../experiments)
;!(import! &self experiments:utils:common-utils)
!(import! &self ../../data/small-ugly)

;! (bind! &dbspace (new-space))


; !(add-atom &dbspace (atom))
; !(remove-atom &dbspace (atom))



!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &dbspace (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))

; ! (import! &self freq-pat)
; ; ! (import! &self conj-exp)

;!(let $x (get-atoms &db) (add-atom &dbspace $x))


(= (get_variables_with_index $pattern $index)
    (if (== $pattern ())
        (() $index)
        (let* (
                (true (println! (here in get_variables_for_tree $pattern $index)))
                ($head (car-atom $pattern))
                ($tail (cdr-atom $pattern))
            )
            (if (== (get-metatype $head) Expression)
                (let* (
                        (($vars_head $index_head) (get_variables_with_index $head (+ $index 1)))
                        (($vars_tail $index_tail) (get_variables_with_index $tail $index_head))         
                    )
                    ((union-atom $vars_head $vars_tail) $index_tail)
                )
                (if (== (get-metatype $head) Variable)
                    (let* (
                            ($pair (($head $index)))
                            ($next_index (+ $index 1))
                            (($vars_tail $index_tail) (get_variables_with_index $tail $next_index))
                        )
                        ((union-atom $pair $vars_tail) $index_tail)
                    )
                    (get_variables_with_index $tail (+ $index 1))
                )
            )
        )
    )
)

(= (get_variables_for_tree $pattern)
    (let* (
            (($vars $_) (get_variables_with_index $pattern 0))
        )
        (superpose $vars)
    )
)




(= (get_value_at_index_helper $pattern $target_index $current_index)
    (if (== $pattern ())
        (() $current_index)
        (let* (
                ($head (car-atom $pattern))
                (true (println! (here in get_value_at_index_helper $head)))
                (true (println! (here in get_value_at_index_helper $current_index)))
                ($tail (cdr-atom $pattern))
                (true (println! (here in get_value_at_index_helper $tail)))
            )
            ;; If this is the target index

                ;; Otherwise, keep traversing
                (if (== (get-metatype $head) Expression)
                    (if (== $current_index $target_index)
                        ($head $current_index)
                    ;; Go inside the sub-expression
                    (let* (
                            (($val $next_index) (get_value_at_index_helper $head $target_index (+ $current_index 1)))
                            (() (println! (here in get_value_at_index_exp  $val)))
                            
                        )
                        (if (== $val ())
                            (get_value_at_index_helper $tail $target_index $next_index)
                            ; (get_value_at_index_helper $tail $target_index (+ $current_index 1))
                            ($val $next_index)
                            ;; If not found inside, continue with tail
                        )
                    ))
                    (if (== $current_index $target_index)
                        ($head $current_index)
                    ;; Normal atom, move on
                    (get_value_at_index_helper $tail $target_index (+ $current_index 1)))
                )
        )
    )
)



(= (get_value_at_index $pattern $index)
    (let* (
            (($val $_) (get_value_at_index_helper $pattern $index 0))
        )
        $val
    )
)

; !(get_value_at_index_helper (Inheritanc (Inheritance (Rel A $X) $Y) $Z) 8 0)
; !(get_variables_for_tree (Inheritanc (Inheritance $X $Y) (link $Y $Z)))



; !(get_value_at_index (Inheritane (Inheritance A B) $sodaDrinker) 4)
; !(get_variables_for_tree (Inheritane (Inheritance A B) $sodaDrinker) 5)


(= (get_vals $list $index $vals)
    (if (== $list ())
        $vals
        (let* (
                ($head (car-atom $list))
                ($tail (cdr-atom $list))
                ($val (get_value_at_index $head $index))
            )
            (get_vals $tail $index (cons-atom $val $vals)))
            )
)


(= (valuation $pattern $dbspace)
    (let* (
        (($list_vars $index) (get_variables_for_tree $pattern))
        (true (println! (here in valuation $list_vars)))
        ($satisfy (collapse (match $dbspace $pattern $pattern)))
        (true (println! (here in valuation $satisfy)))
        ($val (get_vals $satisfy $index ()))
        (true (println! (get-vals result $val)))
    )
    $val
    )
)
; !(get_variables_for_tree (Inheritance $Z sodaDrinker))

!(valuation (Inheritance $x $y) &dbspace)