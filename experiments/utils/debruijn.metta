 ;; Define Nat
(: Nat Type)
(: Z Nat)
(: S (-> Nat Nat))

; helper functions
; is_nat helper function checks if the variable is of type Debruijn
(= (is_nat $v) (== (get-type $v) Nat))
(= (is_var $v) (== (get-metatype $v) Variable))
(= (is_exp $v) (== (get-metatype $v) Expression))
(= (inc_index Nil) Z)
(= (inc_index $index) (if (== $index Nil) (empty) (S $index)))

; finds the index associated with the variable from the list. returns Nil if does not exist.
(= (find_var_value $list $var)(
   if (== $list ())
      Nil
      (
         let* (
            ($h (car-atom $list))
            ($t (cdr-atom $list))
            ($x (car-atom $h))
            ($y (cdr-atom $h))
         ) (
            if (== (car-atom $h) $var)
               (car-atom $y)
               (find_var_value $t $var)
         )
      )
))

(= (store_var_indice $list $var $index)(
   let* (
      ($result (find_var_value $list $var))
      ($value (cons-atom $var ($index)))
   ) (
      if (== $result Nil)
         (cons-atom $value $list)
         $list
   )
))

; replaces each debruin indice into a variable
; accepts a pattern that contain a debruin indice as an argument
; returns a pattern with the indices replaced with a variables
(= (debruijn_to_variable $pattern) (debruijn_to_variable $pattern ($x $y $z $w $a $b $c $d $e $f $g $h)))
(= (debruijn_to_variable $pattern $varlist)(
   if (== $pattern ()) ()))

; !(debruijn_to_variable (Inheritance Z (S Z) Z)) ; [(Inheritance $x $y $z)]

; replaces each variable successively with an incrementing debruijn indices
; accepts a pattern and returns a pattern with the variables replaced by debruijn indices
; simmilar debruijn indice replacemement for the same variable
(= (var_to_deb $exp) (
   let* (
      (($result $list $index)(_var_to_deb $exp () Nil))
   )
   $result
))
(= (_var_to_deb $exp $list $index)(
   if (== $exp ()) (() $list $index) (
      let* (
         (($head $tail) ((car-atom $exp) (cdr-atom $exp)))
         (($replaced $new_list $new_index) (
            if (is_var $head)
               (
                  if (== (find_var_value $list $head) Nil)
                     (
                        (inc_index $index)
                        (store_var_indice $list $head (inc_index $index))
                        (inc_index $index)
                     )
                     (
                        (find_var_value $list $head)
                        $list
                        $index
                     )
               )
               (
                  if (is_exp $head)
                     (_var_to_deb $head $list $index)
                     ($head $list $index)
               )
         ))
         (($remaining $rem_list $rem_index) (_var_to_deb $tail $new_list $new_index))
      ) (
         (cons-atom $replaced $remaining)
         $rem_list
         $rem_index
      )
   )
))

; TEST CASES
!(var_to_deb (Inheritance $x $y $x)) ; [(Inheritance Z (S Z) Z)]
!(var_to_deb (Inheritance $x $y $x $y)) ; [(Inheritance Z (S Z) Z (S Z))]
!(var_to_deb (Inheritance $x $y $x $z)) ; [(Inheritance Z (S Z) Z (S (S Z)))]
!(var_to_deb (Inheritance (($y $x) $y ) $y $x)) ; [(Inheritance ((Z (S Z)) Z) Z (S Z))]