
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

(= (get_value_at_index_helper $queue $target_index $current_index)
    (if (== $queue ())
        (() $current_index)
        (let* (
                ($front (car-atom $queue))
                ($rest (cdr-atom $queue))
            )
            (if (== $current_index $target_index)
                ($front $current_index)
                (let* (
                        ($components (if (== (get-metatype $front) Expression)
                                        $front
                                         ()))
                        ; (() (println! (here in get_value_at_index_helper $components)))
                        ($new_queue (union-atom $rest $components))
                        ; (() (println! (here in get_value_at_index_helper $new_queue)))
                        ($new_index (+ $current_index 1))
                    )
                    (get_value_at_index_helper $new_queue $target_index $new_index)
                )
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
