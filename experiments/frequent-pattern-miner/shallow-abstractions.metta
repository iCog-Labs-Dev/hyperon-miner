; ! (register-module! ../../experiments)
; !(import! &self experiments:utils:common-utils)

(= (shallow_abstractions () $history $current_index)
    ()
)

(= (shallow_abstractions $valuations $history $current_index)
    (let* (
        (() (println! (here in shallow_abstractions $valuations $history $current_index)))
        ($head (car-atom $valuations))
        ($tail (cdr-atom $valuations))
        (($vals $abstractions $index) (get_abstractions $head $history $current_index))
        ($newhistory (cons-atom ($vals $abstractions) $history))
        ($abstractions_tail (shallow_abstractions $tail $newhistory $index))
    )
        (cons-atom $abstractions $abstractions_tail)
    )
)

(= (check_val $history $val)
    (if (== $history ())
        (False $val)
        (let* (
                (($head $abstraction) (car-atom $history))
                ($tail (cdr-atom $history))
            )
            (if (== $head $val)
                (True $abstraction)
                (check_val $tail $val)
            )
        )
    )
)

; !(check_val ((cvh Abe) (bvh cgh)) bvh)

(= (get_abstractions () $history)
    ()
)

(= (get_abstractions $valuations $history $current_index)
    (let* (
            
            ($vals (superpose $valuations))
            (($found $res) (check_val $history $vals))
            (() (println! (here in get_abstractions $found $res)))
            (($abstraction $next_index) (if $found 
                                            ($res $current_index)
                                            (if (== (get-metatype $vals) Expression) 
                                            (let* (
                                                (($link $nodes) (decons-atom $vals))
                                                (($result $index) (get_abstraction $nodes $current_index () $current_index))
                                                ) ((cons-atom $link $result) $index))
                                            (if (== (get-metatype $vals) Variable)
                                                ((fromNumber $current_index) (+ $current_index 1)) 
                                                ($vals $current_index)
                                        )))
                                    )
        )
        ($vals $abstraction $next_index)
    )
)

(= (find_index () $vaL)
    ()
)

(= (find_index $list $vaL)
    (let* (
            ($head (car-atom $list))
            ($tail (cdr-atom $list))
        )
        (if (== $head $vaL)
            Z
            (S (find_index $tail $vaL))
        )
    )
)

(= (get_abstraction () $var_index $history)
    ()
)

(= (get_abstraction $valuation $var_index $history)
    (let* (
            ($head (car-atom $valuation))
            ($tail (cdr-atom $valuation))
            (($abstraction $new_history) (if (== $var_index 0)
                                            ($head $history)
                                            (if (== (intersection-atom ($head) $history) ())
                                                ((fromNumber (- $var_index 1)) (union-atom $history ($head)))
                                                ((find_index $history $head) $history)
                                            )))
            ($abstractions_tail (get_abstraction $tail (+ $var_index 1) $new_history))
        )
        (union-atom ($abstraction) $abstractions_tail)
    )
)
; !(let $abstractions (get_abstractions ((Inheritanc (Inheritance (Rel A $X) $Y) $Z) (Inheritanc (Inheritance (Rel A $X) $Y) $Z))) (car-atom $abstractions))


; !(shallow_abstractions (((Inheritance Abe Abe) ugly sodaDrinker) (Lucy Emily Cason)))

; !(find_index (cvh Abe) Abe)


