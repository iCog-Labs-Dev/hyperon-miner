
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


