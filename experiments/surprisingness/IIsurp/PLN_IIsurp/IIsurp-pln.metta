(=(get-instances ($link $instance $concept) $db)
(let* ( ($inst (collapse (match $db ($link $instance $concept) $instance ))))

)
$inst 
)

(=(get-concepts ($link $instance $concept) $db)
(let* (($concepts (collapse (match $db ($link $anyI $anyC) $anyC))))
$concepts
)

)

(=(SubSuperConcepts $OriginalInstances $concepts $originalConcept  $type $db  )
(let* (($superCons (collapse (superHelper $OriginalInstances (superpose $concepts) $originalConcept $type $db )))


)
$superCons

)



)

; (=(superHelper $OriIns $concept $originalConcept $db)
; (if (== $concept $originalConcept ) (empty) (let* (
;   ($conIns (collapse (match $db ($link $any $concept) $any )))
;   ($inter (intersection-atom $OriIns $conIns))
  
  
;   )   (if  (== (size-atom $OriIns) (size-atom $inter)) $concept  (empty)) ))
; )


(= (returnSupers ($type $concept))
(if (== $type Super) $concept (empty))

)
(= (returnSubs ($type $concept))
(if (== $type Sub) $concept (empty))

)

(=(superHelper $OriIns $concept $originalConcept $type $db)
(if (== $concept $originalConcept ) (empty) (let* (
  ($conIns (collapse (match $db ($link $any $concept) $any )))
  ($inter (intersection-atom $OriIns $conIns))
  
  
  ) 
  ;not-strict

    ; (if  (== (size-atom $OriIns) (size-atom $inter)) (Super $concept ) ( if (== (size-atom $conIns ) (size-atom $inter  )) (Sub $concept) (empty))) 

    ;striclty superpattern or subpattern 
     (if (== $type super) (if  (and (== (size-atom $OriIns) (size-atom $inter)) (>= (size-atom $conIns) (size-atom $OriIns)))  $concept (empty))

     ( if (== (size-atom $conIns ) (size-atom $inter  )) $concept (empty))
     
      )

    
    ))
)

(=(add-the-coherence $pair-H ) (foldl-atom $pair-H 0 $acc $x (+ $acc $x)))
  (() (println! 4))


(= (coherence $concept $db $link)
(let* (
  ($ins (collapse (match $db ($link $any $concept) $any)))
  ($n (size-atom $ins))
  (() (println! (1 ... $n ... $ins)))
  ; helper -> 0.5, 0.5
  ($pairwise  (cart-helper-set 2 $ins ()))

  ; filter pairwise
  ($uniquePairWise (fun $pairwise ()))
  (() (println! (2 .-.-.-. )))
  ($pair-H  (collapse (calcom (superpose $uniquePairWise) $db $link)))
  
  ; ;  ($pair-H (pairwise-coherence-list $ins () 0 $n $db $link))
  (() (println! (3 ... )))
    ($sum-pair-H (add-the-coherence $pair-H))
  (() (println! 4))
    ($H-joint-approx  (// (* $sum-pair-H 2) (* $n (- $n 1))))


)

$H-joint-approx
; $n

)


 )

( = (fun $pairwise $acc) 
  (
    if (== () $pairwise)
      $acc
      (let*
        (
          ((($head1 $head2) $tail) (decons-atom $pairwise))
          ; (() (println! ($head1 $head2)))
          
          ($intersection (intersection-atom (($head2 $head1)) $acc))

          ($newAcc (if (== (size-atom $intersection) 0)
          (cons-atom ($head1 $head2) $acc)
          $acc
        ))

        )
        (fun $tail $newAcc))
      
  )
)


(=(calcom ($Ins1 $Ins2) $db $link)
(if (== $Ins1 $Ins2) (empty) (let* (
  ($fconcs (collapse (match $db ($link $Ins1 $cons1) $cons1)))
  ($scons (collapse (match $db ($link $Ins2 $cons2) $cons2)))
  ($inter (intersection-atom $fconcs $scons))
  ($inter-len (size-atom $inter))
  ($avglen (// (+ (size-atom $fconcs )  (size-atom $scons ) ) 2))
  ($paircoh (// $inter-len $avglen))
  )
  $paircoh
  
  )
)
)

; (= (pairwise-coherence-list $lst $acc $i $n $db $link)
;    (if (>= $i $n)
;        $acc
;        (pairwise-coherence-list-helper $lst $acc $i (+ $i 1) $n $db $link)
;    )
; )

; (= (pairwise-coherence-list-helper $lst $acc $i $j $n $db $link)
;    (if (>= $j $n)
;        (pairwise-coherence-list $lst $acc (+ $i 1) $n $db $link)
;        (let* (
;            ($pi (index-atom $lst $i))
;            ($pj (index-atom $lst $j))
;            ($H (calcom $pi $pj $db $link))
;            ($new-acc (union-atom $acc ($H)))
;          )
;          (pairwise-coherence-list-helper $lst $new-acc $i (+ $j 1) $n $db $link)
;        )
;    )
; )



(=(cart-helper-set $n $x $acc) (collapse (cart-helper-set_ $n $x $acc)))
(=(cart-helper-set_ $n $x $acc) 
  (if (> $n 0)

  (let* (
  ($num (superpose $x))
  ;the accumulator here is also undetrministic becuase we are adding superposed elements to it
  
  ($new (cons-atom $num $acc))
  ; (() (println! (chs ----)))
  )
  ;each time it cals itself, its creating branches with all the elemnts superposed on each previous braches
  (cart-helper-set_ (- $n 1) $x $new)
  )

  $acc
  )

)



(= (rmvEl $tar $list)
(collapse (let $el (superpose $list) (if (== $el $tar) (empty) $el)))


)


(=(get_set_prob_intervals $conjunct-w-comma $db $total_count) 

(let* (
  ; ($total_count (universe-count $conjunct-w-comma $db))
($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
($interval-list (collapse (getConceptProbCall (superpose $conjunct ) $conjunct  $db $total_count)))

; ($maxSupers (if (not (== $interval-list ())) (collapse (handle_interval_list (superpose $interval-list) maxsup )) ()))

; ($minSupers (if (not (== $interval-list ())) (collapse (handle_interval_list (superpose $interval-list) minsup )) ()))


 (($supersTVstr $supersTVconf) (if (not (== $interval-list ()))  (avrg_tv $interval-list ) ()))
 ($superTV (TruthValue $supersTVstr $supersTVconf ))

; ($maxSubs (collapse (handle_interval_list (superpose $interval-list) maxsub )))

; ($minSubs (collapse (handle_interval_list (superpose $interval-list) minsub )))
($sub-int (sub-prob-main $conjunct-w-comma $db $total_count))

; (($maxSubs $minSubs) (if (not (== $sub-int ())) $sub-int (() ()) ))


)

 ($superTv $sub-int)

)





)

;guarding against type of patterns
(=(getConceptProbCall $candidate $conjunct $db $total_count)
(let* ((($bool-inner) (collapse (unify $candidate ($link $a $b) 
True False
)))  

($bool (if $bool-inner (let ($link1 $a1 $b1) $candidate (== (get-metatype $b1) Symbol)) False))

) (if $bool (getConceptProb $candidate $conjunct $db $total_count) (empty)) )
)

;super called
(=(getConceptProb $candidate $conjunct $db $total_count)


( let* (

   (($link $per $conc) $candidate)
  ($orInst (collapse (match $db ($link $any $conc) $any)))
  ($candidate_count (total_counts $candidate $db))
  ($concepts-raw (collapse (match $db ($link $anyI $anyC) $anyC)))
  ($concepts (unique-atom $concepts-raw))
  ($supercons  (SubSuperConcepts $orInst $concepts $conc super $db ))
) (if (== $supercons ()) (empty) (let* (
  
  
  ; (($link $per $conc) $candidate)
  ; ($orInst (collapse (match $db ($link $any $conc) $any)))
  ; ($concepts-raw (collapse (match $db ($link $anyI $anyC) $anyC)))
  ; ($concepts (unique-atom $concepts-raw))
  ; ($supercons  (SubSuperConcepts $orInst $concepts $conc super $db ))

  ($sup-prob-body (collapse  (get-prob-func (superpose $supercons) $db $candidate $conjunct $total_count )))

  ($superProbsmax (collapse (getcohfact (superpose $sup-prob-body) $db  $candidate_count)))
  ($maxSuperprob (avrg_tv $superProbsmax ))
  ($avrg_super_tv (cons-atom TruthValue $maxSuperprob))

  ; ($superProbsmin (collapse (getcohfact (superpose $sup-prob-body) $db min $candidate_count)))
  ; ($minSuperprob (avrg_tv $superProbsmin))
  ; ($avrg_min_super_tv (cons-atom TruthValue $minSuperprob))

;   ($sub-prob-body (collapse (get-prob (superpose $subcons) $db $candidate $conjunct $total_count)))

;   ($subProbsmax (collapse (getcohfact (superpose $sub-prob-body) $db max)))
;   ($maxSubprob (max-atom $subProbsmax ))

; ($subProbsmin (collapse (getcohfact (superpose $sub-prob-body) $db min)))
; ($minSubprob (min-atom $subProbsmin))


  
  )

  $avrg_super_tv


)))

)






; this will be the h(x) and g(x) funcitions mentioned on the paper
(=(max-factor $coherence) (// 1 (+ $coherence 0.0001) ))
(=(min-factor $coherence ) (pow-math $coherence 0.5))





(=(getcohfact ($prob-tv $coh) $db  $cand_count) 
(let* (
  (($label $mean $conf) $prob-tv)
; ($factor (if (== $maxOrmin max) (max-factor $coh) (min-factor $coh)  ) )

; ($conf-inter (count_to_confidence $cand_count ))
; ($fin_tv_mean (* $mean $factor))
; (($new_str $new_conf) (avrg_tv ((TruthValue $fin_tv_mean $conf-inter) $prob-tv)))

($new_conf (* $conf $coh))
)
(EMPTV $mean $new_conf)
)

)

;supercalled by the super concepts list
;we remove the comma from conjunct before passing it here 
;total count is the universal count of the orignial conjuct
(= (get-prob-func $superconc  $db  $candPat $conjunct $total_count)
(let* (
  (($link $some1 $some2) $candPat)
; ($concCoh (getcohfact $superconc $db $maxOrmin))

($coher (coherence $superconc $db  $link))
($con_super_pattern ($link $x $superconc))

;here we would have the the g(x) funcion that takes in the coherence 
($conjWoutCand (rmvEl $candPat $conjunct))
($conjWSup (cons-atom $con_super_pattern $conjWoutCand))
($compconj (cons-atom , $conjWSup))
($conjSup (sup-num  $db $compconj   ))
($conjProb (// $conjSup $total_count))
($supConSup (sup-num $db $con_super_pattern ))
($canConSup (sup-num $db $candidate  ))
($superprob (// $supConSup $total_count))
($candidateProb (// $canConSup $total_count))

; ($final_prob (* (* $concCoh $conjProb) (// $candidateProb $superprob)))
($final_prob (*  $conjProb (// $candidateProb $superprob)))
($conf (count_to_confidence $total_count ))




)
((TruthValue $final_prob $conf) $coher)
)


)


(= (handle_interval_list $list-el $type)
(let ($maxsup $minsup)  $list-el (case $type (maxsup $maxsup)
(minsup $minsub ) 
))
)


(= (total_counts $pattern $db) (pow-math (db_size $db) (n_conjuncts_new $pattern)))

;=====================================
(= (IIsurp-old $pattern $db ) (
    let* (
        (() (println! "==== IIsurp-old surprisingness ====="))
        ($total_count (total_counts $pattern $db))
        ($pattern_prob (emp-tv $pattern $db ))
        ; ($partitions (generet-partition-without-pattern $pattern))
        ; ($results-inter  (isurp-old_  $partitions $db $total_count))
        ($result_tv_inter (do-ji-tv-est $db $pattern) )
        ($subset-results_tvs (get_set_prob_intervals $pattern $db $total_count))
        ($results (union-atom $results-inter $subset-results_tvs))

        ($final_estimate (avrg_tv $results))
        ($final_tv (cons-atom $final_estimate))
        ; (($emin $emax) (min-max $results))
        ($dst (do-jsd $final_tv $pattern_prob))
    ) 
        $dst      
) )