


(= (powerset $lst)
   (if (== $lst ())
       (())                             
       (let* (
          (($head $tail) (decons-atom $lst))
          ($ps-tail   (powerset $tail)) 
          ($with-head (map-atom $ps-tail $s (cons-atom $head $s)))
         )
         (union-atom $ps-tail $with-head) 
       )
   )
)
; Compute the odd-ratio based factor for a conjunctive pattern.
; Steps:
; - get empirical support for pattern and instances
; - enumerate proper non-empty subsets of conjuncts
; - compute odds ratio per subset via sub-handler
; - average ratios and convert to labeled factor via handle_odds
(= (odd-ratio $pattern $db) 

(let*(
  ($ins (collapse (match $db $any $any)))
  ($unique-ins (unique-atom $ins))
  ($pat-wout-comma (cdr-atom $pattern))
  ($emp-sup(collapse (match $db $pattern $pattern)))
  
  ; ($emp-sup (filter-conjuncts-only-instances $emp-sup-inter))
  ($emp-sup-size (size-atom $emp-sup))
  ($subs (powerset $pat-wout-comma))
  ($subs-wout-pat (subtraction-atom $subs (() $pat-wout-comma)))
  ($odd-ratios (collapse (sub-handler (superpose $subs-wout-pat) $pat-wout-comma $emp-sup $db $unique-ins $emp-sup-size) ))

  ($total-ratio (foldl-atom $odd-ratios 0 $acc $x (+ $x $acc)))
  ($avrg-total (// $total-ratio (size-atom $odd-ratios)))
  ($factor (handle_odds $avrg-total))
  )
  $factor
))

; For each subset, compute odds ratio relative to the full conjunct minus the subset.
; Returns a list of odd ratios.


(=(sub-handler $sub-pat $conjunct $emp-sup $db $unique-ins $emp-size)

(let* (

  ($full-pat (cons-atom , $sub-pat))
  
  ($conjunct-wout-sub (subtraction-atom $conjunct $sub-pat))
  ($full-conjunct-wout-sub (cons-atom , $conjunct-wout-sub ))
  ($sub-above (collapse (match $db $full-conjunct-wout-sub $full-conjunct-wout-sub) ))
  ($size-conj-wout-sub (size-atom $sub-above))
  ($size-notchosen-and-rest (- $size-conj-wout-sub (size-atom $emp-sup)) )
  ($sub-support (collapse (match $db $full-pat $full-pat)))
  ($chosen-size (size-atom $sub-support ))
  ($size-chosen-and-not-rest (- $chosen-size (size-atom $emp-sup)))

  ($size-union-rest (- (+ $size-conj-wout-sub $chosen-size  ) (size-atom $emp-sup) ))

  ($unique-ins-size (size-atom $unique-ins))

  ($size-not-rest-not-chosen (- $unique-ins-size $size-union-rest))

  ($odds-of-sub-w-rest (// (+ $emp-size 0.5) (+ $size-notchosen-and-rest 0.5) ) )

  ($odds-of-sub-wout-rest (// (+ $size-chosen-and-not-rest 0.5) (+ $size-not-rest-not-chosen 0.5)) )
  ($odd_ratio (// $odds-of-sub-w-rest $odds-of-sub-wout-rest ))
  
)
$odd_ratio
))



(= (// $a $b) (/ (* 1.0 $a) $b))


(=(handle_odds $or) (let* 

(($cor (< $or 1))
  (($ans $label ) (if  $cor ((// 1 $or ) negative) ($or positive) ))
  )($ans $label)

) )


