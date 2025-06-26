 ;; Define Nat
(: Nat Type)
(: Z Nat)
(: S (-> Nat Nat))

; helper functions
; is_nat helper function checks if the variable is of type Debruijn
(= (is_nat $v) (== (get-type $v) Nat))

; replaces each debruin indice into a variable
; accepts a pattern that contain a debruin indice as an argument
(= (to_debruijn $pattern) (to_debruijn $pattern (qoute $x $y $z $w $a $b $c $d $e $f $g $h)))
(= (to_debruijn $pattern $varlist)(
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
                  (to_debruijn (cdr-atom $pattern) (cdr-atom $varlist))
                  (to_debruijn (cdr-atom $pattern) $varlist)
            )
           )
         )
         (cons-atom $x $y)
   )
))

; !(to_debruijn (Inheritance Z (S Z) Z)) ; [(Inheritance $x $y $z)]

