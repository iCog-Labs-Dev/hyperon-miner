(=(checkPat-sup $x)(if (== (size-atom $x) 1) True (if (== ( let $hell (car-atom $x) (get-metatype $hell)) Symbol) True False)))


(=(ret-vars-sup $x) (if (== ( get-metatype $x ) Variable) $x (empty)))

(=(get-variables-helper-sup $pattern) (let $a (cdr-atom $pattern) (ret-vars-sup (superpose $a))))



(=(get-variables-sup $conjunct) (if (== $conjunct ()) () (let $lst (collapse  (get-variables-helper-sup (superpose $conjunct))) $lst ))) 


;returns indpendent disjoint list of patterns or conjucnt that support be can be calculated for direclty through match and and mutiplied to get support for the origninal pattern
;handles both conjucnt and single pattern inputs
(=(ptrn-comps $ptrn) (if (== $ptrn () ) 0 (let* (($omg (car-atom $ptrn)) ($tail (cdr-atom $ptrn))) (if (and (== $omg ,) (> (size-atom $tail) 1)) (let $clstrs (main-func (cdr-atom $ptrn) ())  
(create-patterns-from-clusters $clstrs)) ($ptrn) ) 

)))



;returns list of lists of disjoint subpatterns, each internal list being an cluster cotaning related subpatterns as a whole either through direct relationship or through chainned r/ship
(=(main-func $pat $acc) (if (== $pat () ) $acc (let* (
    (($head $tail) (decons-atom $pat))
    ($vars (get-variables-sup ($head)))
    (($connected $unconnected) (get-un-connected $tail $vars))
    ($bothvars (get-variables-sup $connected))
    ($bridgeVars (union-atom $vars $bothvars))
    (($bridgedpats $unbridgedPats) (get-un-connected $unconnected $bridgeVars))
    ($semi-cluster (union-atom $bridgedpats $connected))
    ($cluster (cons-atom $head $semi-cluster))
    (($all-bridged $all-unbridged) (get-all-bridged $cluster $unbridgedPats))
    )

    (main-func $all-unbridged (cons-atom $all-bridged $acc))
    
    )))

;recursivley collects all chainned subpatterns conncted through bridge subpatterns.
(= (get-all-bridged $cluster $unbridged) (let* (
  ($clVars (get-variables-sup $cluster))
  (($con $uncon) (get-un-connected $unbridged $clVars))
  )
  (if (== $con ()) ($cluster $unbridged)
  (get-all-bridged (union-atom $con $cluster) $uncon)
  )
  
  ))



;collects subpatterns that contain common variables with the list of vairables $vars
(=(con-pats $pat $vars)
(let* (
    ($patvars (cdr-atom $pat))
    ($inter (intersection-atom $patvars $vars))
)
(if (== ( size-atom $inter) 0 ) (empty) $pat)
))

;collects subpatterns that don't contain any common variables with the list of vairables $vars
(=(un-con-pats $pat $vars)
(let* (
    ($patvars (cdr-atom $pat))
    ($inter (intersection-atom $patvars $vars))
)
(if (==( size-atom $inter) 0 ) $pat (empty))
))


;if the if conidtionals are satisfied we could return (() $patterns) meaning no subpatterns can connect with the inputs given to it.
(=(get-un-connected $patterns $vars) (if (or  (== $patterns ()) (== $vars ())) (() $patterns) (let* (
    ($conPats (collapse (con-pats (superpose $patterns) $vars))  )
    ($unConPats (collapse (un-con-pats (superpose $patterns) $vars)))
    )
    ($conPats $unConPats)
    
    )))


; (= (create-patterns-from-clusters $listofclusters) (collapse (create-pat (superpose $listofclusters))) )
(= (create-patterns-from-clusters $listofclusters) (collapse (create-pat (superpose $listofclusters)))) 
(= (create-pat $cluster) (if (> (size-atom $cluster) 1) (cons-atom , $cluster) (car-atom $cluster) ))







