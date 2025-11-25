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



(= (get_abstractions () )
    ()
)

(= (get_abstractions $valuations)
    (let* (
            
            ($vals (superpose $valuations))
            ; ($abstraction (if (== (get-metatype $vals) Expression) exp $vals))
            ($abstraction (if (== (get-metatype $vals) Expression) (get_abstraction $vals 0 ()) $vals))
        )
        $abstraction
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


