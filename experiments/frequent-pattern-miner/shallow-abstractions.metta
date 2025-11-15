; ! (register-module! ../../experiments)
; !(import! &self experiments:utils:common-utils)




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
