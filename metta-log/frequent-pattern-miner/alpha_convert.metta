
; ! (register-module! ../../../hyperon-miner)
; ! (import! &self hyperon-miner:experiments:utils/common-utils)
; ! (import! &self hyperon-miner:experiments:utils:common-utils)
; python bindings for generating random variables
! (bind! letters (py-atom string.ascii_lowercase))
! (bind! tuple (py-atom tuple))
! (bind! random (py-atom random))
! (bind! plus (py-atom operator.add))
! (bind! V (py-atom hyperon.V))
! (bind! E (py-atom hyperon.E))


; helper functions
; (= (is_var $v) (== (get-metatype $v) Variable))
; (= (is_exp $v) (== (get-metatype $v) Expression))

; generates a random string of given length
; e.g, "A" or "AB" or "ZBDS"
(= (gen_random_word $length)(
   if (== $length 0) ""
   (
      let* (
         ($h ((py-dot random choice) letters))
         ($t (gen_random_word (- $length 1)))
      ) (
         plus $h $t
      )
   )
))

; generates a random variable of given length
; e.g, "#A" or "#AB" or "#ZBDS"
(= (gen_random_var)(V (gen_random_word 2)))
(= (gen_random_var $length)(V (gen_random_word $length)))
; generates a list of random variables of given length
; e.g, ("$AB" "$CD") or ("$AB" "$CD" "$EF" "$GH")
(= (gen_vars $num)(
   if (== $num 0) ()
   (
      let* (
         ($h (gen_random_var))
         ($t (gen_vars (- $num 1)))
      ) (
         cons-atom $h $t
      )
   )
))


(= (find_value $keys $vals $var)
    (if (or (== $keys ()) (== $vals ()))
        ()
    (let* (
        ($key (car-atom $keys))
        ($val (car-atom $vals))
        ($keytail (cdr-atom $keys))
        ($valtail (cdr-atom $vals))
        ($res (if (== $key $var) ($val) (find_value $keytail $valtail $var)))
        (() (println! (here in find_value $res)))
    )
    $res
    ))
)

(= (does_exist $var $list_vars)
    (if (== $list_vars ())
        False
        (let* (
                (() (println! (here in does_exist $var, $list_vars)))
                ($head (car-atom $list_vars))
                ($varhead (car-atom $var))
                (() (println! (here in does_exist $head)))
                ($tail (cdr-atom $list_vars))
                ($check (== $varhead $head))
                (() (println! (here in does_exist $check)))
            )
            (if $check
                True
            (does_exist $var $tail))
        )
    )
)

(= (address_conflict $pattern_vars $cnjtion_vars $seen_keys $seen_vals)
    (if (== $pattern_vars ())
        ()
        (let* (
                ($head (car-atom $pattern_vars))
                (() (println! (here in address_conflict $head)))
                ($tail (cdr-atom $pattern_vars))
                ($var (gen_random_var))
                (() (println! (here in address_conflict $var)))
                ($exist (does_exist ($head) $cnjtion_vars))
                (() (println! (here in address_conflict $exist)))
                ($cur (if $exist
                            (if (does_exist ($head) $seen_keys)
                                ((find_value $seen_keys $seen_vals $head) $seen_keys $seen_vals)
                                (($var) (cons-atom $head $seen_keys) (cons-atom $var $seen_vals)))
                            (($head) (cons-atom $head $seen_keys) (cons-atom $head $seen_vals))))
                ; ($cur (if (does_exist $head $cnjtion_vars)
                ;             (if (does_exist $head $seen_keys)
                ;                 ((find_value $seen_keys $seen_vals $head) $seen_keys $seen_vals)
                ;                 (($var) (cons-atom $head $seen_keys) (cons-atom $var $seen_vals)))
                ;             (($head) (cons-atom $head $seen_keys) (cons-atom $head $seen_vals))))
                (($val $seen_key $seen_val) $cur)
                (() (println! (here in address_conflict $val)))
                (() (println! (here in address_conflict $seen_key)))
                (() (println! (here in address_conflict $seen_val)))
                ($rest (address_conflict $tail $cnjtion_vars $seen_key $seen_val))
                (() (println! (here in address_conflict $rest)))
        )
                (concatTuple $val $rest)
        )
    )
)






(= (alpha_convert $pattern_vars $cnjtion_vars)
    (let $converted (address_conflict $pattern_vars $cnjtion_vars () ()) $converted)
)
!(address_conflict ($A $B $B) ($B $D $E) () ())
!(alpha_convert ($A $B $B) ($B $D $E))