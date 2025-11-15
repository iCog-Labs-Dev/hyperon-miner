; ! (register-module! ../../experiments)
; !(import! &self experiments:utils:common-utils)
; !(import! &db experiments:data:small-ugly)

; ! (bind! &dbspace (new-space))

; ; ; ! (import! &self freq-pat)
; ; ; ; ! (import! &self conj-exp)

; !(let $x (get-atoms &db) (add-atom &dbspace $x))


(= (get_variables_with_index $pattern $index)
    (if (== $pattern ())
        (() $index)
        (let* (
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


(= (get_value_at_index $pattern $index)
    (let* (
            (($val $_) (get_value_at_index_helper $pattern $index 0))
        )
        $val
    )
)

(= (get_value_at_index_helper $pattern $target_index $current_index)
    (if (== $pattern ())
        (() $current_index)
        (let* (
                ($head (car-atom $pattern))
                ($tail (cdr-atom $pattern))
            )
            ;; If this is the target index

                ;; Otherwise, keep traversing
                (if (== (get-metatype $head) Expression)
                    (if (== $current_index $target_index)
                        ($head $current_index)
                    ;; Go inside the sub-expression
                    (let* (
                            (($val $next_index) (get_value_at_index_helper $head $target_index (+ $current_index 1)))
                            
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


