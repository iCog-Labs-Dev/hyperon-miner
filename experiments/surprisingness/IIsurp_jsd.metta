



(= (filter-conjuncts $lstofconjuncts) (collapse (filter-common (superpose $lstofconjuncts))))

(= (filter-common $conjunct ) (let* (($lconjucnt (cdr-atom $conjunct))  ($instances (collapse (ret-instances (superpose $lconjucnt) ))) ($uniq (unique-atom $instances)) ($uniq-size (size-atom $uniq)) )

(if (== $uniq-size 1) $conjunct (empty))

))

(=(ret-instances $subpat) (let ($link $per $conc) $subpat $per) )


;caritsean product of the probabilities of the superpose, every superconcept of a subpattern with every superconcept of the other subpattern in the conjunct



(= (cart-helper $lst $acc $db ) (collapse (cart-helper_ $lst $acc $db)))
;the output needs to be collasped by the caller
(=(cart-helper_ $lstofsubpatterns  $acc $db) (if (not (== $lstofsubpatterns ()))

(let* (
  (($head $tail) (decons-atom $lstofsubpatterns))

(($subpat-fir $subcons) $head)
(($link $a $b) $subpat-fir)
; ($subcons  (get-sub-conc-only $head $db))

($subcon-el (superpose $subcons))
;the accumulator here is also undetrministic becuase we are adding superposed elements to it
($new (cons-atom  ($link $a $subcon-el) $acc)))
;each time it cals itself, its creating branches with all the elemnts superposed on each previous braches
(cart-helper_ $tail $new $db)
)

$acc
))
;===========================================


(=(get-sub-conc-only $head $db)
(let* ( (($link $per $conc) $head)
  ($orInst (collapse (match $db ($link $any $conc) $any)))
  ($concepts-raw (collapse (match $db ($link $anyI $anyC) $anyC)))
  
  ($concepts (unique-atom $concepts-raw))
  ( $subcons (SubSuperConcepts $orInst $concepts $conc sub $db ))
  
  
  )
  $subcons
  
  )
)


(= (get-conc-prob-for-sub $conc-b $db $total_count)

(let* (
  (($link $a $conc) $conc-b)
  ($coh (coherence $conc $db $link))
 



)
$coh


)



)

(=(prob-accumulator $lst) (foldl-atom $lst 1 $acc $x (* $x $acc)))
;supercalled with the list of sub concepts, 

(=(getcohfact_sub $coh $maxormin)
(if (== $maxormin max) (max-factor $coh) (min-factor $coh))


)



(=(get-comb-prob $comb $db $total_count)




(let* (
  ($comb-conj (cons-atom , $comb))
  ($comb-support (collapse (match $db $comb-conj $comb-conj)))
  ;this is added new
  ($filtered-sups (filter-conjuncts $comb-support))
  ($sup-num (size-atom $filtered-sups))
  ($comb-prob-main (// $sup-num $total_count))
  ($conf (count_to_confidence $total_count))

  
  ($prob-bodies (collapse (get-conc-prob-for-sub (superpose $comb) $db $total_count))) 

; ($subProbsmax (collapse (getcohfact_sub (superpose $prob-bodies)  max)))
($Accumulatedcohformax (prob-accumulator $prob-bodies))
($new_conf (* $conf $Accumulatedcohformax))


 


)
(TruthValue $comb-prob-main $new_conf)
)




)




;the caller of this function should chekc if the return is -1, then not to include it in the final min-max interval
(=(sub-prob-main $conjunct-w-comma $db $total_count) 



( let*  (($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
  
  ($filted-conjunct-w-subconcepts (collapse (filter-subpatterns-w-subs (superpose $conjunct) $db)))) (if (== $filted-conjunct-w-subconcepts () ) ()


 (let* (

($cart-combs (cart-helper $filted-conjunct-w-subconcepts () $db))


($filtered-conc (collapse (filter-subpatterns-wout-subs (superpose $conjunct) $filted-conjunct-w-subconcepts  $db )))

($with-conc (map-atom
                         $cart-combs
                         $s
                         (union-atom $filtered-conc $s))) 



($comb-probs (collapse (get-comb-prob (superpose $with-conc) $db $total_count)))

(($sub_avrg_str $sub_avrg_conf  ) (avrg_tv $comb-probs))





)
; $with-conc
; $comb-probs 
(TruthValue $sub_avrg_str $sub_avrg_conf)
)))

)

(=(handleCartProbs $list-el $type) 
(let ($max $min) $list-el (if (== $type max) $max $min))
)


(=(filter-subpatterns-w-subs $subpattern $db)
(let* ((($link $a $b) $subpattern)
($subcons  (get-sub-conc-only $subpattern $db)))
(if (== $subcons ()) (empty) ($subpattern $subcons))
)
)



(=(filter-subpatterns-wout-subs $subpattern $wsubs $db)
(let* (
  ($pats (collapse (return_only_pats (superpose $wsubs) )))
  ($intersec (intersection-atom ($subpattern) $pats))
  ($size (size-atom $intersec))
  
  (($link $a $b) $subpattern)
)
(if (== $size 0)  $subpattern (empty))
)
)

(=(return_only_pats $wsub) (let ($pat $cons) $wsub $pat ) )

;============================

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
     (if (== $type super) (if  (and (== (size-atom $OriIns) (size-atom $inter)) (>=(size-atom $conIns) (size-atom $OriIns)))  $concept (empty))

     ( if (== (size-atom $conIns ) (size-atom $inter  )) $concept (empty))
     
      )

    
    ))
)

(= (db_size $db)
     (let $a (collapse (get-atoms $db)) (size-atom $a))
    
) 

(= (calculate_binomial_helper $n $k $result)
    (if (or (> $k $n ) (< $k 0))
        0
        (if (or (== $k 0) (== $k $n))
            1
            (let*
                (
                    ($temp (/ $n (- $n $k)))
                    ($newResult  (* $temp (calculate_binomial_helper (- $n 1) $k $temp)))
                )
                $newResult
            )
        )
    )
)

(= (calculate_binomial $n $k) (calculate_binomial_helper (max-atom ($n)) (max-atom ($k)) 1))
(=(cal_binomial $n $k) (calculate_binomial $n $k))

(=(n_conjuncts_new $pattern) (
   let ($head $tail) (decons-atom $pattern) (
    if (== $head ,) (size-atom $tail) 1)
))



(= (prob $pattern $db $total_count) (let $ff (sup-num $db $pattern) (// $ff  $total_count)))




(=(add-the-coherence $pair-H ) (foldl-atom $pair-H 0 $acc $x (+ $acc $x)))
  
(=(dst_from_interval $emin $emax $emp) (
  if (< $emax $emp) (- $emp $emax) (if (< $emp $emin ) (- $emin $emp) 0.0)
))

(=(random_coherence) 0.5)

(= (coherence $concept $db $link)
(let* (
  ($ins (collapse (match $db ($link $any $concept) $any)))
  ($n (size-atom $ins))
)
(if (<= $n 1) (random_coherence)

  ; helper -> 0.5, 0.5
  (let* (($pairwise  (cart-helper-set 2 $ins ()))

  ; filter pairwise
  ($uniquePairWise (fun $pairwise ()))
  
  ($pair-H  (collapse (calcom (superpose $uniquePairWise) $db $link)))
  
 
 
    ($sum-pair-H (add-the-coherence $pair-H))
 
    ($H-joint-approx  (// (* $sum-pair-H 2) (* $n (- $n 1))))
    

     
    
    )
    $H-joint-approx
    )

)))

( = (fun $pairwise $acc) 
  (
    if (== () $pairwise)
      $acc
      (let*
        (
          ((($head1 $head2) $tail) (decons-atom $pairwise))
        
          
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

(=(cart-helper-set $n $x $acc) (collapse (cart-helper-set_ $n $x $acc)))
(=(cart-helper-set_ $n $x $acc) 
  (if (> $n 0)

  (let* (
  ($num (superpose $x))
  ;the accumulator here is also undetrministic becuase we are adding superposed elements to it
  
  ($new (cons-atom $num $acc))
  
  )
  ;each time it cals itself, its creating branches with all the elemnts superposed on each previous braches
  (cart-helper-set_ (- $n 1) $x $new)
  )

  $acc
  )

)

; (= (rmvEl $tar $list)
; (collapse (let $el (superpose $list) (if (== $el $tar) (empty) $el)))


; )

(= (rmvEl $tar $list)
(collapse (let* (($el (superpose $list)) (($link $var $conc) $el) (($link2 $var2 $conc2) $tar)) (if (and (== $link $link2) (== $conc $conc2)) (empty) $el)))


)

(= (sup-num $db $pattern)
    (let $sup (counter $db $pattern)
        $sup
    )
)

(= (counter $db $ptrn)
    (let $result (collapse (match $db $ptrn $ptrn))
         (tuple-count $result)
    )
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

($whole1 (collapse $sub-int))
($whole2 (cons-atom $superTV $whole1))
($whole-comp (subtraction-atom  $whole2 (())))


)
; $sub-int

 $whole-comp

)





)




(=(handle-list-interval $x $acc )
(if (== $x ()) $acc
(let* 
((($head $tail) (decons-atom $x))
($new (union-atom $head $acc))
)
(handle-list-interval $tail $new)


)

)
)




(=(getConceptProbCall $candidate $conjunct $db $total_count)
(getConceptProb $candidate $conjunct $db $total_count  )
)

;super called







; this will be the h(x) and g(x) funcitions mentioned on the paper
; (=(max-factor $coherence) (// 1 (+ $coherence 0.000000001) ))



(=(max-factor $coherence) (* 0.03 (- 1 $coherence)))
(=(min-factor $coherence ) (* 0.03 $coherence))





(=(getcohfact ($prob-tv $coh) $db  $cand_count) 
(let* (
  (($label $mean $conf) $prob-tv)


($new_conf (* $conf $coh))
)
(EMPTV $mean $new_conf)
)

)
(=(getConceptProb $candidate $conjunct $db $total_count)


( let* (

   (($link $per $conc) $candidate)
  ($orInst (collapse (match $db ($link $any $conc) $any)))
  ($candidate_count (total_counts $candidate $db))
  ($concepts-raw (collapse (match $db ($link $anyI $anyC) $anyC)))
  ($concepts (unique-atom $concepts-raw))
  ($supercons  (SubSuperConcepts $orInst $concepts $conc super $db ))
) (if (== $supercons ()) (empty) (let* (
  

  ($sup-prob-body (collapse  (get-prob-func (superpose $supercons) $db $candidate $conjunct $total_count )))

  ($superProbsmax (collapse (getcohfact (superpose $sup-prob-body) $db  $candidate_count)))
  ($maxSuperprob (avrg_tv $superProbsmax ))
  ($avrg_super_tv (cons-atom TruthValue $maxSuperprob))


 )
 $avrg_super_tv


)))

)


(= (total_counts $pattern $db) (cal_binomial (db_size $db) (n_conjuncts_new $pattern)))




(= (get-prob-func $superconc  $db  $candPat $conjunct $total_count)
(let* (
  (($link $some1 $some2) $candPat)
; ($concCoh (getcohfact $superconc $db $maxOrmin))

($coher (coherence $superconc $db  $link))
($con_super_pattern ($link $some1 $superconc))

;here we would have the the g(x) funcion that takes in the coherence 
($conjWoutCand (rmvEl $candPat $conjunct))
($conjWSup (cons-atom $con_super_pattern $conjWoutCand))
($compconj (cons-atom , $conjWSup))
($comb-support (collapse (match $db $compconj $compconj)))
($filtered-sups (filter-conjuncts $comb-support))
($conjSup (size-atom  $filtered-sups   ))
($conjProb (// $conjSup $total_count))
($supConSup (sup-num $db $con_super_pattern ))
($canConSup (sup-num $db $candPat  ))
($superprob (// $supConSup $total_count))
($candidateProb (// $canConSup $total_count))


($final_prob (*  $conjProb (// $candidateProb $superprob)))
($conf (count_to_confidence $total_count ))




)
((TruthValue $final_prob $conf) $coher)
)


)
(= (DEFAULT_K) 800.0)

(= (count_to_confidence $x) (// $x (+ $x (DEFAULT_K))))

(= (handle_interval_list $list-el $type)
(let ($maxsup $minsup)  $list-el (if (== $type maxsup ) $maxsup $minsup
))
)

(= (prob $pattern $db $total_count) (// (sup-num $db $pattern) $total_count))

(= (IIsurp-pln $pattern $db ) (
    let* (
        
        ($total_count (total_counts $pattern $db))
        ; ($pattern_prob (emp-tv $pattern $db ))
       
        ; ($result_tv_inter (do-ji-tv-est $db $pattern) )
        ($subset-results_tvs (get_set_prob_intervals $pattern $db $total_count))
        ; (($results ) (collapse (union-atom $results_tv_inter $subset-results_tvs)))

        ; ($final_estimate (avrg_tv $results))
        ; ($final_tv (cons-atom TruthValue $final_estimate))
 
        ; ($dst (do-jsd $final_tv $pattern_prob))
    ) 
        $subset-results_tvs    
) )

