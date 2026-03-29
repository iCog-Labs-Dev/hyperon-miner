
(=(ret-vars-sup $x $acc )
  
    (let* (
      ( $outAcc (if (== (get-metatype $x ) Variable) (cons-atom $x $acc ) $acc))
    )
    $outAcc
    
    )
)
(= (member-atom-cust $elem $lst)
   (if (== $lst ())
       False
       (let $head (car-atom $lst)
         (let $tail (cdr-atom $lst)
           (if (== $elem $head)
               True
               (member-atom-cust $elem $tail)
           )
         )
       )
   )
)


(= (set-intersection-cust $set2 $set1)
   (if (== $set1 ())
       ()
       (let $head (car-atom $set1)
         (let $tail (cdr-atom $set1)
           (if (member-atom-cust $head $set2)
               (cons-atom $head (set-intersection-cust $set2 $tail))
               (set-intersection-cust $set2 $tail)
           )
         )
       )
   )
)

(=(get-variables-helper-sup $pattern $acc)
  
    
    (
      if (== $pattern ()) $acc 
      (let* (
        (($head $tail ) (decons-atom $pattern))
    ($newAcc (ret-vars-sup $head $acc))
    )
    (get-variables-helper-sup $tail $newAcc )
    
    )
    
    )
    
    
)

(=(get-variables-sup $conjunct $acc)
  (if (== $conjunct ())
      $acc 
      (let* ((($head $tail) (decons-atom $conjunct))
             ($vars-head (get-variables-helper-sup (cdr-atom $head) $acc))
             
             ($lst (union-atom $acc $vars-head))
            )


        (get-variables-sup $tail $lst)
      )
  )
)


;returns indpendent disjoint list of patterns or conjucnt that support be can be calculated for direclty through match and and mutiplied to get support for the origninal pattern
;handles both conjucnt and single pattern inputs




(=(inter-extract $conj $acc) 

(
  if (== $conj ()) $acc
  
  (let* (
  (($head $tail ) (decons-atom $conj))

  ($vars (get-variables-sup ($head) ()))

  ($newAcc (cons-atom $vars $acc ))
  
  )

  (inter-extract $tail $newAcc)

  
  ))


)

(= (check-disj $conjunct)

(if (== $conjunct ()) () (if (not (== (car-atom $conjunct ) ,))
 True
 (let* (


  ($no-comma (cdr-atom $conjunct))
  ($var-conjs (inter-extract $no-comma ()))
  (($head $tail) (decons-atom $var-conjs))

  (($conn $unconn) (get-all-bridged ($head) $tail))
 )
 (if (== $unconn ()) True  False)
 )

)))

;returns list of lists of disjoint subpatterns, each internal list being an cluster cotaning related subpatterns as a whole either through direct relationship or through chainned r/ship


;recursivley collects all chainned subpatterns conncted through bridge subpatterns.
(= (get-all-bridged $cluster $unbridged) (let* (
  ; ($clVars (get-variables-sup $cluster ()))
  (($con $uncon) (get-un-connected $unbridged $cluster))
  )
  (if (== $con ()) ($cluster $unbridged)
  (get-all-bridged $con $uncon)
  )
  
  ))








;collects subpatterns that contain common variables with the list of vairables $vars
(=(con-pats $pat $vars $acc)
  (let* (
      ($patvars (cdr-atom $pat))
      ($inter (set-intersection-cust $patvars $vars))
    )
    (if (== (size-atom $inter) 0)
        $acc
        (cons-atom $pat $acc)
    )
  )
)

;collects subpatterns that don't contain any common variables with the list of vairables $vars
(=(un-con-pats $pat $vars $acc)
  (let* (
      ($patvars (cdr-atom $pat))
      ($inter (set-intersection-cust $patvars $vars))
    )
    (if (== (size-atom $inter) 0)
        (cons-atom $pat $acc)
        $acc
    )
  )
)

; recursive helper that partitions $patterns into connected and unconnected lists using accumulators
(=(get-un-connected-helper $patterns $vars $conAcc $unAcc)
  (if (== $patterns ())
      ($conAcc $unAcc)
      (let* (
          (($head $tail) (decons-atom $patterns))
          ($newConAcc (con-pats $head $vars $conAcc))
          ($newUnAcc  (un-con-pats $head $vars $unAcc))
        )
        (get-un-connected-helper $tail $vars $newConAcc $newUnAcc)
      )
  )
)

;if the if conditionals are satisfied we could return (() $patterns) meaning no subpatterns can connect with the inputs given to it.
(=(get-un-connected $patterns $vars)
  (if (or (== $patterns ()) (== $vars ()))
      (() $patterns)
      (get-un-connected-helper $patterns $vars () ())
  )
)



