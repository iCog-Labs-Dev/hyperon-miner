 ;; Define Nat
(: Nat Type)
(: Z Nat)
(: S (-> Nat Nat))

; helper functions
; is_nat helper function checks if the variable is of type Debruijn
(= (is_nat $v) (== (get-type $v) Nat))
(= (is_variable $v) (== (get-metatype $v) Variable))

; replaces each debruin indice into a variable
; accepts a pattern that contain a debruin indice as an argument
; returns a pattern with the indices replaced with a variables
(= (debruijn_to_variable $pattern) (debruijn_to_variable $pattern ($x $y $z $w $a $b $c $d $e $f $g $h)))
(= (debruijn_to_variable $pattern $varlist)(
   if (== $pattern ()) ()
   (let* (
           (
            $x
            (
               if (is_nat (car-atom $pattern))
                  (car-atom $varlist)
                  (car-atom $pattern)
            )
           )
           (
            $y
            (
               if (is_nat (car-atom $pattern))
                  (debruijn_to_variable (cdr-atom $pattern) (cdr-atom $varlist))
                  (debruijn_to_variable (cdr-atom $pattern) $varlist)
            )
           )
         )
         (cons-atom $x $y)
   )
))

; !(debruijn_to_variable (Inheritance Z (S Z) Z)) ; [(Inheritance $x $y $z)]

; replaces each variable with a given list of debruijn indices
; accepts two arguments, pattern and indices
; returns a pattern with the variables replaced by the indices
(= (variable_to_debruijn $pattern $indices)(
      if (== $pattern ())()
         (
             let* (
                     ($x (
                        if (is_variable (car-atom $pattern))
                           (car-atom $indices)
                           (car-atom $pattern)
                     ))
                     ($y (
                        if (is_variable (car-atom $pattern))
                           (variable_to_debruijn (cdr-atom $pattern) (cdr-atom $indices))
                           (variable_to_debruijn (cdr-atom $pattern) $indices)
                     ))
                  )
                  (cons-atom $x $y)
         )
   )
)

; !(variable_to_debruijn (Inheritance $x $y $z) (Z (S Z) (S ( S Z))))  ; [(Inheritance Z (S Z) (S (S Z)))]