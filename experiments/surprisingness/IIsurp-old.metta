



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

  
  ($prob-bodies (collapse (get-conc-prob-for-sub (superpose $comb) $db $total_count))) 

($subProbsmax (collapse (get-coh-fact-sub (superpose $prob-bodies)  max)))
($Accumulatedcohformax (prob-accumulator $subProbsmax))
($maxsubprob (* $comb-prob-main $Accumulatedcohformax))

($subProbsmin (collapse (get-coh-fact-sub (superpose $prob-bodies)  min)))
($Accumulatedcohformin (prob-accumulator $subProbsmin))
($minsubprob (* $comb-prob-main $Accumulatedcohformin))
 


)


($maxsubprob $minsubprob)
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

($allMaxs (collapse (handle-cart-probs (superpose $comb-probs) max)))
($max-bound (max-atom $allMaxs))

($allMins (collapse (handle-cart-probs (superpose $comb-probs) min)))
($min-bound (min-atom $allMins))




)



($max-bound $min-bound)
)))

)

(=(handle-cart-probs $list-el $type) 
(let ($max $min) $list-el (if (== $type max) $max $min))
)






; within the get-set-prob-intervals 

; 1st: we send each subpattern in the conjunct in its own branch using superpose , and the output from each branch is the estimate probability considering the super concept counterparts for the concept mentioned in the subpattern.

; 2nd: pass the orginal conjunct to the sub-prob-main funcitn to compute the sub-concept estimates for the conjunct

; 3rd: combine the two sets of estimates (the super concept and sub concept estimates)   and find the max and min estimate and output that. 




(=(get-set-prob-intervals $conjunct-w-comma $db $total_count) 

(let* (
  ; ($total_count (universe-count $conjunct-w-comma $db))
($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
($interval-list (collapse (get-concept-prob-call (superpose $conjunct ) $conjunct  $db $total_count)))

($all-fn-sups (handle-list-interval $interval-list ()))

($sub-int (sub-prob-main $conjunct-w-comma $db $total_count))

(($all-prob-est) (collapse (union-atom $all-fn-sups $sub-int  )))

; ; ; compute retval-max/min only when allmaxs2 is non-empty
($retval-max (if (== $all-prob-est ()) () (max-atom $all-prob-est)))
($retval-min (if (== $all-prob-est ()) () (min-atom $all-prob-est)))

; ($retval-max (if (== $all-fn-sups ()) () (max-atom $all-fn-sups)))
; ($retval-min (if (== $all-fn-sups ()) () (min-atom $all-fn-sups)))

)

; $all-fn-sups

; $interval-list 
($retval-max $retval-min)


))

(=(get-concept-prob-call $candidate $conjunct $db $total_count)
(getConceptProb $candidate $conjunct $db $total_count  )
)

; it retirves the concept from the subpattern it got through superpose.

; then fetches all the insatncs that inherit from that concept in our kb

; 3rd fetches all the unique concepts in our kb.

; 4th: passes all hte unique and the target concept to the sub-super-concepts so as to fetch all the concepts that are a super concept to our target concept and stores it in ;$supercons

; 5th: for each superconcept pass it to get-prob-func to compute the probability of a super pattern that contains the super concet along with the coherence of the super concept

; 6th: compute the final proboabilty of the super pattern by accouting for the coherence and the normalizing term which is jsut hte support of oru target concept divided by the support of the super concept. (this is done by the getcohfact , and the factor that depends on the coherence of the super concept also depends on whether we are trying to compute the max or min estimate.) 

; 7th: fetch the max estimate and min estimate from the return estimates returned by getcohfact and return them as a tuple.


(=(getConceptProb $candidate $conjunct $db $total_count)


( let* (

   (($link $per $conc) $candidate)
  ($orInst (collapse (match $db ($link $any $conc) $any)))
  ($concepts-raw (collapse (match $db ($link $anyI $anyC) $anyC)))
  ($concepts (unique-atom $concepts-raw))
  ($supercons  (sub-super-concepts $orInst $concepts $conc super $db ))
) (if (== $supercons ()) (empty) (let* (
  
  


  ($sup-prob-body (collapse  (get-prob-func (superpose $supercons) $db $candidate $conjunct $total_count )))

  ($superProbsmax (collapse (getcohfact (superpose $sup-prob-body) $db max)))
  ($maxSuperprob (max-atom $superProbsmax ))

  ($superProbsmin (collapse (getcohfact (superpose $sup-prob-body) $db min)))
  ($minSuperprob (min-atom $superProbsmin))




  
  )

  ; $supercons
  ($maxSuperprob $minSuperprob)


)))

)






; this will be the h(x) and g(x) funcitions mentioned on the paper
; (=(max-factor $coherence) (// 1 (+ $coherence 0.000000001) ))









(=(getcohfact ($prob $coh) $db $maxOrmin) 
(let* (
($factor (if (== $maxOrmin max) (max-factor $coh) (min-factor $coh)  ) )
($new_prob (* $factor $prob))
)

; $prob
$new_prob
)

)

(= (total_counts-iisurp $pattern $db) (cal_binomial-iisurp (db_size-iisurp $db) (n_conjuncts_new-iisurp $pattern)))

; (= (total_counts $pattern $db) (pow-math (db_size $db) (n_conjuncts_new $pattern)))

;supercalled by the super concepts list
;we remove the comma from conjunct before passing it here 
;total count is the universal count of the orignial conjuct



; for each superconept constructs a super pattern by exchanging a new subpattern containing the superpattern with the subpattern containing our target concept form our original conjunct. along with the coherence of the corresponding super concept.
(= (get-prob-func $superconc  $db  $candPat $conjunct $total_count)
(let* (
  (($link $some1 $some2) $candPat)
; ($concCoh (getcohfact $superconc $db $maxOrmin))

($coher (coherence $superconc $db  $link))
($con_super_pattern ($link $some1 $superconc))

;here we would have the the g(x) funcion that takes in the coherence 
($conjWoutCand (rmvEl-iisurp $candPat $conjunct))

;subtraction-atom doesn't work

; ($conjWoutCand (subtraction-atom $conjunct ($conjunct)))
($conjWSup (cons-atom $con_super_pattern $conjWoutCand))
($compconj (cons-atom , $conjWSup))
($comb-support (collapse (match $db $compconj $compconj)))
($check-sup (size-atom $comb-support ))
($filtered-sups (filter-conjuncts $comb-support))
($conjSup (size-atom  $filtered-sups   ))
($conjProb (// $conjSup $total_count))
($supConSup (sup-num-iisurp $db $con_super_pattern ))
($canConSup (sup-num-iisurp $db $candPat  ))
($superprob (// $supConSup $total_count))
($candidateProb (// $canConSup $total_count))

; ($final_prob (* (* $concCoh $conjProb) (// $candidateProb $superprob)))



($final_prob (*  $conjProb (// $canConSup $supConSup)))



)



($final_prob $coher)
)


)


(= (handle_interval_list $list-el $type)
(let ($maxsup $minsup)  $list-el (if (== $type maxsup ) $maxsup $minsup
))
)



; The first step in IIsurp is calculating the estimations assuming independence among its subpatterns like how its done Isurp and storing it in $results-inter

; The second step is to compute the estimates considering the super and sub couterparts of the subpatterns in the conjunct by calling the get-set-prob-intervals function and stroring the estimates in $subset-results.

; The third step is combining the tow sets of estimates and finding the maximum and minimum estmiates to act as bounds from which we measure the distance the empirical probability deviates from that bound, that distance becomes hte output as the surprisingness measure.

(= (IIsurp-old $pattern $db $normalize) (
    let* (
        ($_ (println! "==== IIsurp-old surprisingness ====="))
        ($total_count (total_counts-iisurp $pattern $db))
        ($psup (collapse (match $db $pattern $pattern)))
        ($pattern_prob (// (size-atom $psup) $total_count))
        
        ; ($conjunct (cdr-atom $pattern))
        ($partitions (partitions $pattern))
        ($results-inter  (isurp-old_iisurp  $partitions $db $total_count))
        ($subset-results (get-set-prob-intervals $pattern $db $total_count))
        ($results (if (not (== $subset-results ())) (union-atom $results-inter $subset-results) $results-inter))

        ($emin (min-atom $results))
        ($emax (max-atom $results))
       
        ($dst (dst-from-interval-iisurp $emin $emax $pattern_prob))

    ) 
  ;  (( $pattern_prob ) ($subset-results) ($results-inter ) ($dst) ((- $pattern_prob(car-atom $results-inter))))
 

  
 
  $dst

  

    
  ; (min-atom (((if (== True $normalize) (// $dst (max-atom ($emax $pattern_prob))) $dst) 1.0)))       

     
) )




