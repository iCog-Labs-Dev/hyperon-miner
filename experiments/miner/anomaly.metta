


(= (entry-point $dbspace $conjspace $absspace $maxsup $depth) 

(let* (
  ($abs (get-all-abstracts $dbspace $abspace ))
  ($filtered-pats (collapse (handle-filter (superpose $abs) $dbspace)))
  ($_ (add-to-space (superpose $filtered-pats ) $absspace))

  (match $abspace (AbstractedCandidatePattern $pattern) (let $conj (do-conjunct $dbspace $cndpspace $pattern $minsup (fromNumber $depth)) (if (== $conj ()) () (add-atom $conjspace $conj))))

   (formatter $conjspace $dbspace)


 
)

out

)

)

(=(add-to-space $pat $abspace)

($_ (add-atom $abspace (AbstractedCandidatePattern $pat)))

)


(=(handle-filter $pat $dbspace )

(let* (
  ($sup (collapse (match $dbspace $pat $pat)))
  ( $size (size-atom $sup ))

)

(if (> $size (threshold)) (empty) (

  (let* (
    ($out (filter-constants $pat))
    
  )

  (if (== $out () ) (empty) ($pat))
  
  
  )
  



))


)


)


(=(filter-constants $pat)
 (let $el (superpose $pat) (if (== (get-metatype $el) Variable) $el 

(
  if (== (get-metatype $el) Expression ) (filter-constants $el)
  
  (empty)) ) )

)

(=(threshold)  100)

(=(get-all-abstracts $dbspace $absspace)
(let* (
  ($out (collapse (match $dbspace $x $x)))
  ($pats (collapse (handle-data (superpose $out) ())))
  )

  $pats
  )


)

(=(handle-data $data $acc)

(if (== $data ()) $acc (let* (
  (($head $tail) (decons-atom $data))
  ($nested-head (if (== (get-metatype $head) Expression) (handle-data $head ()) $head)  )

  ($el (superpose ($nested-head $newVar)))
  ($newAcc (union-atom $acc ($el)))
)
(handle-data $tail $newAcc)

))


)


; !(collapse (handle-data (Inheritance man (some (like one)) bro) ()))










