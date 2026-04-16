( = (is_member_with_out_superpose $x $list)
    (if (== $list ())
        False
        (let ($head $tail) (decons-atom $list)
            (if (== $x $head)
                True
                (is_member_with_out_superpose $x $tail)
            )
        )
    )
)

; PeTTa function: returns True if two lists share at least one element, False otherwise
(= (has_intersection $list1 $list2)
   (if (== $list1 ())
	   False
	   (let ($head $tail) (decons-atom $list1)
		    (if (is_member_with_out_superpose $head $list2)
          True
          (has_intersection $tail $list2)
        )
      )
    )
)

(=(get-variables-helper-sup $pattern $acc)
  (
    if (== $pattern ()) 
      $acc 
      (let* 
        (
          (($head $tail) (decons-atom $pattern))
          ($newAcc (if (is-var $head) (cons-atom $head $acc) $acc))
        )
        (get-variables-helper-sup $tail $newAcc)        
      )
  )
)

(=(get-variables-sup $conjunct $acc)
  (if (== $conjunct ())
      $acc 
      (let* 
        (
            (($head $tail) (decons-atom $conjunct))
            ($vars-head (get-variables-helper-sup (cdr-atom $head) $acc))
            ($lst (union-atom $acc $vars-head))
        )
        (get-variables-sup $tail $lst)
      )
  )
)

;returns independent disjoint list of patterns or conjunct that support be can be calculated for directly through match and and multiplied to get support for the original pattern
;handles both conjunct and single pattern inputs

(=(inter-extract $conj $acc) 
  (
    if (== $conj ()) 
      $acc  
      (let* 
        (
          (($head $tail) (decons-atom $conj))
          ($vars (get-variables-sup ($head) ()))
          ($newAcc (cons-atom $vars $acc))      
        )
        (inter-extract $tail $newAcc)
      )
  )
)

(= (check-disj $conjunct)
  (if (== $conjunct ()) 
    False 
    (if (not (== (car-atom $conjunct ) ,))
      True
      (let* 
        (
          ($var-conjs (inter-extract (cdr-atom $conjunct) ()))
          (($head $tail) (decons-atom $var-conjs))
          (($conn $unconn) (get-all-bridged $head $tail))
        )
        (== $unconn ())
      )
    )
  )
)

;returns list of lists of disjoint sub patterns, each internal list being a cluster containing related sub patterns as a whole either through direct relationship or through chained relationship
;recursively collects all chained sub patterns connected through bridge sub patterns.
(= (get-all-bridged $cluster $unbridged) 
  (let
    ($con $uncon) (get-un-connected $unbridged $cluster)
    (if (== $con ()) 
      ($cluster $unbridged)
      (get-all-bridged $con $uncon)
    )
  )
)

;collects subpatterns that contain common variables with the list of vairables $vars and collects subpatterns that contain common variables with the list of vairables $vars and 
(=(con-uncon-pats $pat $vars $conAcc $unConAcc)
  (if (has_intersection $pat $vars)
      ((union-atom $pat $conAcc) $unConAcc)
      ($conAcc (cons-atom $pat $unConAcc))
  )
)

; recursive helper that partitions $patterns into connected and unconnected lists using accumulators
(=(get-un-connected-helper $patterns $vars $conAcc $unConAcc)
  (if (== $patterns ())
      ($conAcc $unConAcc)
      (let* (
          (($head $tail) (decons-atom $patterns))
          (($newConAcc $newUnAcc) (con-uncon-pats $head $vars $conAcc $unConAcc))
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
