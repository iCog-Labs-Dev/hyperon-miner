
(= (get_variables_with_index $queue $current_index $acc_vars)
    (if (== $queue ())
        ($acc_vars $current_index)
        (let* (
                ($front (car-atom $queue))
                ($rest (cdr-atom $queue))
                ($is_var (== (get-metatype $front) Variable))
                ($new_acc (if $is_var (cons-atom ($front $current_index) $acc_vars) $acc_vars))
                ($components (if (== (get-metatype $front) Expression)
                                 $front
                                 ()))
                ($new_queue (union-atom $rest $components))
                ($new_index (+ $current_index 1))
            )
            (get_variables_with_index $new_queue $new_index $new_acc)
        )
    )
)


(= (get_variables_for_tree $pattern)
    (let* (
            (($vars $_) (get_variables_with_index $pattern 0))
            (() (println! (here in get_variables_for_tree $vars)))
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


(= (valuation $pattern $dbspace)
    (if (== (get-metatype $pattern) Variable)
        (collapse (unique (match $dbspace $pattern $pattern)))
        (let* (
            (($list_vars $index) (get_variables_for_tree $pattern))
            ($satisfy (collapse (match $dbspace $pattern $pattern)))
            ($val (get_vals $satisfy $index ()))
            ($unique (unique-atom $val))
            ($final (cons-atom $list_vars $unique))
            )
            $final
        )
    )
    
)
; !(get_variables_for_tree (Inheritance $Z sodaDrinker))


!(valuation (Inheritance $x $y) &dbspace)
