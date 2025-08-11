

(: Pattern Type)
(: ($link $a $b) Pattern)


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












;;;;;;;;;;;;;;;;;;;;
;;High-Level Steps;;
;;;;;;;;;;;;;;;;;;;;
;; - Compute the probability of the pattern (pattern_prob).
;; - Generate all partitions excluding the pattern.
;; - Calculate the probabilities of all partitions (iprob).
;; - Identify the minimum and maximum probabilities (emin, emax) of the partitions.
;; - Compute the distance of pattern_prob from the interval [emin,emax]
;; - Normalize the distance if required.
;; - Bound the final surprisingness value to a maximum of 1.0



;;The total count is implemented using the binomial coefficient and the power of 
;;the database size and number of conjuncts, because in the classic implementation, 
;;the documentation recommends using powers — but the actual implementation uses the binomial coefficient.

;;Calculates the total possible counts for a pattern based on database size 
;;and the number of conjunctive clauses in the pattern.
;(=(total_counts $pattern $db) (pow (db_size $db) (n_conjuncts_new $pattern)))

;; Function: total_counts
;; Description: Calculates the total possible counts for a pattern using the binomial coefficient.
;; Parameters:
;;   - $pattern: The pattern whose total count is to be estimated.
;;   - $db: The database context in which the pattern appears.
;; Returns:
;;   - The total number of possible combinations based on database size and number of conjunctive clauses.
(=(total_counts $pattern $db) (cal_binomial (db_size $db) (n_conjuncts_new $pattern)))


;; Function: accumulator-x
;; Description: Computes the product of a list of numbers recursively
;; Parameters:
;;   - $num_list: A list of numbers to multiply.
;;   - $prev_value (optional): The accumulated product (defaults to 1).
;; Returns:
;;   - The product of all elements in the list as a single number.
(=(accumulator-x $num_list) (accumulator-x $num_list 1))
(=(accumulator-x $num_list $prev_value)  (
   if (== $num_list ()) $prev_value (let ($head $tail) (decons-atom $num_list) (accumulator-x $tail (* $head $prev_value)))
))

;;Determines the number of conjunctive clauses in a pattern.
(=(n_conjuncts_new $pattern) (
   let ($head $tail) (decons-atom $pattern) (
    if (== $head ,) (tuple-count $tail) 1)
))


;;Recursively calculates the support for each component of a 
(=(compute-component-support $cps $db)
(collapse (sup-num $db (superpose $cps)) )
)


;; Calculate the support for each component of the conjunctive 
;; pattern and return the product of their results.
(=(ptrn-support $pattern $db)(
    let $cps (ptrn-comps $pattern) 
           (accumulator-x (compute-component-support $cps $db))
))


; Function: prob
; Description: Calculates the probability of a pattern occurring in a given database.
; Parameters:
;   - $pattern: The pattern whose probability is to be calculated.
;   - $db: The database in which the pattern is evaluated.
; Returns:
;   - The probability value as a ratio of the pattern's support to its total possible count.
(=(prob $pattern $db $total_count) (// (ptrn-support  $pattern $db) $total_count))


;;Converts a list of blocks into a conjunctive pattern
(=(add-pattern $blks $db) (
let* ( ($pattern (cons-atom , $blks)) ($dummy (add-atom $db $pattern))) $pattern
))


;;Calculates the probability of a block within a partition by first converting 
;;it into a pattern and then computing its probability.
(= (blk-prob $blk $db $total_count) (
    let $pattern (cons-atom , $blk) (prob $pattern $db $total_count)
  ))
                      

; Function: iprob
; Description: Estimates the probability of each partition under the assumption that blocks 
;              within a partition are independent. It multiplies the probabilities of individual blocks.
; Parameters:
;   - $partition: A list of blocks representing the partition.
;   - $db: The database used to evaluate block probabilities.
; Returns:
;   - The estimated joint probability of the partition, computed by multiplying individual block probabilities.
(=(iprob-old $partition $db) 
    (accumulator-x (collapse  (blk-prob  (superpose $partition) $db)))                              
)

;;Recursive steps for iprob
(=(iprob_ $partition $db $total_count)(
    if (== $partition ()) () (
        let* (
           ( ($head $tail) (decons-atom $partition))
           ($prob (blk-prob $head $db $total_count))
           ($dummy (iprob_ $tail $db $total_count))
        ) 
             (cons-atom $prob $dummy)
    )
))


;;This is the recursive version of iprob-old. While the non-deterministic (or above) 
;;implementation works within this file, it causes issues when used from other files.


(=(iprob $partition $db $total_count) (
    let $products (iprob_ $partition $db $total_count) (accumulator-x $products)
))


;;Recursive steps for isurp

(= (isurp-old_ $partitions $db $total_count) (
    if (== $partitions ()) () (
        let* (
            (($head $tail) (decons-atom $partitions))
             ($res (iprob $head $db $total_count))
             ($dummy (isurp-old_ $tail $db $total_count)))
        (cons-atom $res $dummy)
    )
))

;; Function: isurp-old
;; Description: Computes the I-surprisingness of a conjunctive pattern based on its probability 
;;              and the distribution of probabilities from independently generated partitions. 
;;              It measures how far the pattern's probability deviates from the expected interval 
;;              defined by the minimum and maximum probabilities. Optionally, the surprisingness 
;;              value can be normalized.
; Parameters:
;   - $pattern: A conjunctive pattern whose surprisingness is to be evaluated.
;   - $db: The database or corpus used for evaluating probabilities.
;   - $normalize: A boolean flag indicating whether to normalize the surprisingness by the pattern's probability.
; Returns:
;   - A numeric value representing the surprisingness score, optionally normalized and capped at 1.0.







; !(get-type (, (inher $a $b) (inher $a $b)))
; !(get-type (inher $a $b) )










;(: isurpo-old (-> Pattern SpaceType Bool Number)) 
(= (isurp-old $pattern $db $normalize) (
    let* (
        (() (println! (called-for $pattern)))
        ($total_count (total_counts $pattern $db))
        ($pattern_prob (prob $pattern  $db $total_count ))
        ($partitions (generet-partition-without-pattern $pattern))
        ($results  (isurp-old_  $partitions $db $total_count))
        (($emin $emax) (min-max $results))
        ($dst (dst_from_interval $emin $emax $pattern_prob))
    ) 
         (min ((if $normalize (// $dst $pattern_prob) $dst) 1.0))       
) )



























