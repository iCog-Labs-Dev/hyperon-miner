;================================================================




;caritsean product of the probabilities of the superpose, every superconcept of a subpattern with every superconcept of the other subpattern in the conjunct

;=========================

; (=(cart-helper $n $x $acc) (if (> $n 0)

; (let* (

; ($num (superpose $x))
; ;the accumulator here is also undetrministic becuase we are adding superposed elements to it
; ($new (cons-atom $num $acc)))
; ;each time it cals itself, its creating branches with all the elemnts superposed on each previous braches
; (cart-helper (- $n 1) $x $new)
; )

; $acc
; ))


;the output needs to be collasped by the caller
(=(cart-helper $lstofsubpatterns  $acc $db) (if (not (== $lstofsubpatterns ()))

(let* (
  (($head $tail) (decons-atom $lstofsubpatterns))

(($subpat-fir $subcons) $head)
(($link $a $b) $subpat-fir)
; ($subcons  (get-sub-conc-only $head $db))

($subcon-el (superpose $subcons))
;the accumulator here is also undetrministic becuase we are adding superposed elements to it
($new (cons-atom  ($link $subcon-el) $acc)))
;each time it cals itself, its creating branches with all the elemnts superposed on each previous braches
(cart-helper $tail $new $db)
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


(=(get-conc-prob-for-sub $conc-b $db $total_count)

(let* (
  (($link $conc) $conc-b)
  ($coh (coherence $conc $db $link))
  ($support (collapse (match $db ($link $any $conc) $any)))
  ($sup-size (size-atom $support))
  ($calcProb (// $sup-size $total_count))



)
($calcProb $coh)


)

(=(prob-accumulator $lst) (foldl-atom $lst 1 $acc $x (* $x $acc)))

)
;supercalled with the list of sub concepts, 
(=(get-comb-prob $comb $db $total_count)




(let* (($prob-bodies (collapse (get-conc-prob-for-sub (superpose $comb) $db $total_count))) 
($subProbsmax (collapse (getcohfact (superpose $prob-bodies) $db max)))
($Accumulatedformax (prob-accumulator $subProbsmax))

($subProbsmin (collapse (getcohfact (superpose $prob-bodies) $db min)))
($Accumulatedformin (prob-accumulator $subProbsmin))
 


))
($Accumulatedformax $Accumulatedformin)

)


;the caller of this function should chekc if the return is -1, then not to include it in the final min-max interval
(=(sub-prob-main $conjunct-w-comma $db $total_count) 



( let*  (($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
  
  ($filted-conjunct-w-subconcepts (collapse (filter-subpatterns-w-subs (superpose $conjunct) $db)))) (if (== $filted-conjunct-w-subconcepts () ) ()


 (let* (
  ; ($total_count (universe-count $conjunct-w-comma $db))

; ($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))

; ($filted-conjunct-w-subconcepts (collapse (filter-subpatterns-w-subs (superpose $conjunct) $db)))


; ($cart-combs (collapse (cart-helper $conjunct ())))
($cart-combs (collapse (cart-helper $filted-conjunct-w-subconcepts () $db)))

; ($filtered-conc (collapse (filter-subpatterns-wout-subs (superpose $conjunct) $db )))

($filtered-conc (collapse (filter-subpatterns-wout-subs (superpose $conjunct) $filted-conjunct-w-subconcepts  $db )))

($with-conc (map-atom
                         $cart-combs
                         $s
                         (union-atom $filtered-conc $s))) 



($comb-probs (collapse (get-comb-prob (superpose $with-conc) $db $total_count)))

($allMaxs (collapse (handleCartProbs (superpose $comb-probs) max)))
($max-bound (max-atom $allMaxs))

($allMins (collapse (handleCartProbs (superpose $comb-probs) min)))
($min-bound (max-atom $allMins))




)
($max-bound $min-bound)
)))

)

(=(handleCartProbs $list-el $type) 
let ($max $min) $list-el (if (== $type max) $max $min)
)


(=(filter-subpatterns-w-subs $subpattern)
(let* ((($link $a $b) $subpattern)
($subcons  (get-sub-conc-only $subpattern $db)))
(if (== $subcons ()) (empty) ($subpattern $subcons))
)
)

; (=(filter-subpatterns-wout-subs $subpattern)
; (let* ((($link $a $b) $head)
; ($subcons  (get-sub-conc-only $head $b)))
; (if (== $subcons ())  $subpattern (empty))
; )
; )

; (=(filter-subpatterns-wout-subs $subpattern $wsubs $db)
; (let* ((($link $a $b) $head)
; ($subcons  (get-sub-conc-only $head $db)))
; (if (== $subcons ())  $b (empty))
; )
; )

(=(filter-subpatterns-wout-subs $subpattern $wsubs $db)
(let* (
  ($pats (collapse (return_only_pats (superpose $wsubs) )))
  ($intersec (intersection-atom ($subpattern) $pats))
  ($size (size-atom $intersec))
  
  (($link $a $b) $subpattern)
)
(if (== $size 0)  ($link $b) (empty))
)
)

(=(return_only_pats $wsub) (let ($pat $cons) $wsub ) $pat)