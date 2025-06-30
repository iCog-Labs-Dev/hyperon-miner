 ;; Define Nat
(: Nat Type)
(: Z Nat)
(: S (-> Nat Nat))

; helper functions
; is_nat helper function checks if the variable is of type Debruijn
(= (is_nat $v) (== (get-type $v) Nat))
(= (is_variable $v) (== (get-metatype $v) Variable))
(= (inc_index $index) (S $index))

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

; replaces each variable successively with an incrementing debruijn indices
; accepts a pattern and returns a pattern with the variables replaced by debruijn indices
(= (variable_to_debruijn $pattern) (_variable_to_debruijn $pattern Z))
(= (_variable_to_debruijn $pattern $index)(
      if (== $pattern ())()
         (
             let* (
                     ($x (
                        if (is_variable (car-atom $pattern))
                           $index
                           (car-atom $pattern)
                     ))
                     ($y (
                        if (is_variable (car-atom $pattern))
                           (_variable_to_debruijn (cdr-atom $pattern) (inc_index $index))
                           (_variable_to_debruijn (cdr-atom $pattern) $index)
                     ))
                  )
                  (cons-atom $x $y)
         )
   )
)

; !(variable_to_debruijn (Inheritance $x $y $z)) ; [(Inheritance Z (S Z) (S (S Z)))]