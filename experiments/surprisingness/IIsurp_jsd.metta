






;caritsean product of the probabilities of the superpose, every superconcept of a subpattern with every superconcept of the other subpattern in the conjunct




;===========================================





(=(prob-accumulator $lst) (foldl-atom $lst 1 $acc $x (* $x $acc)))
;supercalled with the list of sub concepts, 

(=(get-coh-fact-sub $coh $maxormin)
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

; ($subProbsmax (collapse (get-coh-fact-sub (superpose $prob-bodies)  max)))
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

(=(handle-cart-probs $list-el $type) 
(let ($max $min) $list-el (if (== $type max) $max $min))
)




;============================































(=(get_set_prob_intervals $conjunct-w-comma $db $total_count) 

(let* (
  ; ($total_count (universe-count $conjunct-w-comma $db))
($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
($interval-list (collapse (get-concept-prob-call (superpose $conjunct ) $conjunct  $db $total_count)))



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









(=(get-concept-prob-call $candidate $conjunct $db $total_count)
(getConceptProb $candidate $conjunct $db $total_count  )
)

;super called







; this will be the h(x) and g(x) funcitions mentioned on the paper
; (=(max-factor $coherence) (// 1 (+ $coherence 0.000000001) ))







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
  ($supercons  (sub-super-concepts $orInst $concepts $conc super $db ))
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

