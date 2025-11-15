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











