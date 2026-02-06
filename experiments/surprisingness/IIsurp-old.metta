; Compact, consistently formatted version of IIsurp-old.metta
; Informative comments similar to isurp-old placed above key functions.

; Utility: multiply list of numbers
(=(prob-accumulator $lst) (foldl-atom $lst 1 $acc $x (* $x $acc)))

; Return factor list (max or min) from coherence facts
(=(get-coh-fact-sub $coh $maxormin) (if (== $maxormin max) (max-factor $coh) (min-factor $coh)))

; Compute conjunct probability  for a combination of subpatterns that form a conjunct.
; Parameters: $comb (expression of subpatterns ), $db, $total_count
; Returns: tuple ($maxsubprob $minsubprob)
(=(get-comb-prob $comb $db $total_count)
 (let* (($comb-conj (cons-atom , $comb))
        ($comb-support (collapse (match $db $comb-conj $comb-conj)))
        ($filtered-sups (filter-conjuncts $comb-support))
        ($sup-num (size-atom $filtered-sups))
        ($comb-prob-main (// $sup-num $total_count))
        ($prob-bodies (collapse (get-conc-prob-for-sub (superpose $comb) $db $total_count)))
        ($subProbsmax (collapse (get-coh-fact-sub (superpose $prob-bodies) max)))
        ($Accumulatedcohformax (prob-accumulator $subProbsmax))
        ($maxsubprob (* $comb-prob-main $Accumulatedcohformax))
        ($subProbsmin (collapse (get-coh-fact-sub (superpose $prob-bodies) min)))
        ($Accumulatedcohformin (prob-accumulator $subProbsmin))
        ($minsubprob (* $comb-prob-main $Accumulatedcohformin)))
   ($maxsubprob $minsubprob)))

; Compute subpattern probability intervals by considering subpatterns and sub concept relationships.
; Returns ($max-bound $min-bound) or () if none.
(=(sub-prob-main $conjunct-w-comma $db $total_count)
 (let* (($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
        ($filted-conjunct-w-subconcepts (collapse (filter-subpatterns-w-subs (superpose $conjunct) $db))))
  (if (== $filted-conjunct-w-subconcepts ()) ()
   (let* (($cart-combs (cart-helper $filted-conjunct-w-subconcepts () $db))
          ($filtered-conc (collapse (filter-subpatterns-wout-subs (superpose $conjunct) $filted-conjunct-w-subconcepts $db)))
          ($with-conc (map-atom $cart-combs $s (union-atom $filtered-conc $s)))
          ($comb-probs (collapse (get-comb-prob (superpose $with-conc) $db $total_count)))
          ($allMaxs (collapse (handle-cart-probs (superpose $comb-probs) max)))
          ($max-bound (max-atom $allMaxs))
          ($allMins (collapse (handle-cart-probs (superpose $comb-probs) min)))
          ($min-bound (min-atom $allMins)))
     ($max-bound $min-bound)))))

(=(sub-prob-main $conjunct-w-comma $db $total_count $conc_db)
 (let* (($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
        ($filted-conjunct-w-subconcepts (collapse (filter-subpatterns-w-subs (superpose $conjunct) $db $conc_db))))
  (if (== $filted-conjunct-w-subconcepts ()) ()
   (let* (($cart-combs (cart-helper $filted-conjunct-w-subconcepts () $db))
          ($filtered-conc (collapse (filter-subpatterns-wout-subs (superpose $conjunct) $filted-conjunct-w-subconcepts $db)))
          ($with-conc (map-atom $cart-combs $s (union-atom $filtered-conc $s)))
          ($comb-probs (collapse (get-comb-prob (superpose $with-conc) $db $total_count)))
          ($allMaxs (collapse (handle-cart-probs (superpose $comb-probs) max)))
          ($max-bound (max-atom $allMaxs))
          ($allMins (collapse (handle-cart-probs (superpose $comb-probs) min)))
          ($min-bound (min-atom $allMins)))
     ($max-bound $min-bound)))))

; Select max or min value from list elements produced by cartesian handling
(=(handle-cart-probs $list-el $type) (let ($max $min) $list-el (if (== $type max) $max $min)))

; Compute probability intervals for a conjunct by combining super-concept estimates and subpattern estimates.
; Returns ($retval-max $retval-min) or () when none.
(=(get-set-prob-intervals $conjunct-w-comma $db $total_count)
 (let* (($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
        ($interval-list (collapse (get-concept-prob-call (superpose $conjunct) $conjunct $db $total_count)))
        ($all-fn-sups (handle-list-interval $interval-list ()))
        ($sub-int (sub-prob-main $conjunct-w-comma $db $total_count))
        (($all-prob-est) (collapse (union-atom $all-fn-sups $sub-int)))
        ($retval-max (if (== $all-prob-est ()) () (max-atom $all-prob-est)))
        ($retval-min (if (== $all-prob-est ()) () (min-atom $all-prob-est))))
  ($retval-max $retval-min)))

(=(get-set-prob-intervals $conjunct-w-comma $db $total_count $conc_db)
 (let* (($conjunct (if (== (car-atom $conjunct-w-comma) ,) (cdr-atom $conjunct-w-comma) ($conjunct-w-comma)))
        ($interval-list (collapse (get-concept-prob-call (superpose $conjunct) $conjunct $db $total_count $conc_db)))
        ($all-fn-sups (handle-list-interval $interval-list ()))
        ($sub-int (sub-prob-main $conjunct-w-comma $db $total_count $conc_db))
        (($all-prob-est) (collapse (union-atom $all-fn-sups $sub-int)))
        ($retval-max (if (== $all-prob-est ()) () (max-atom $all-prob-est)))
        ($retval-min (if (== $all-prob-est ()) () (min-atom $all-prob-est))))
  ($retval-max $retval-min)))

; Simple wrappers to call getConceptProb (with or without conc_db)
(=(get-concept-prob-call $candidate $conjunct $db $total_count) (getConceptProb $candidate $conjunct $db $total_count))
(=(get-concept-prob-call $candidate $conjunct $db $total_count $conc_db) (getConceptProb $candidate $conjunct $db $total_count $conc_db))

; Convert coherence & prob tuple into adjusted probability using max/min factor.
(=(getcohfact ($prob $coh) $db $maxOrmin)
 (let* (($factor (if (== $maxOrmin max) (max-factor $coh) (min-factor $coh)))
        ($new_prob (* $factor $prob)))
  $new_prob))

; Total count helper for IIsurp (uses iisurp variants)
(= (total_counts-iisurp $pattern $db) (cal_binomial-iisurp (db_size-iisurp $db) (n_conjuncts_new-iisurp $pattern)))

; Build a super-pattern by replacing candidate with its superconcept and estimate its probability + coherence.
; Returns ($final_prob $coher)
(= (get-prob-func $superconc $db $candPat $conjunct $total_count)
 (let* ((($link $some1 $some2) $candPat)
        ($coher (coherence $superconc $db $link))
        ($con_super_pattern ($link $some1 $superconc))
        ($conjWoutCand (rmvEl-iisurp $candPat $conjunct))
        ($conjWSup (cons-atom $con_super_pattern $conjWoutCand))
        ($compconj (cons-atom , $conjWSup))
        ($comb-support (collapse (match $db $compconj $compconj)))
        ($check-sup (size-atom $comb-support))
        ($filtered-sups (filter-conjuncts $comb-support))
        ($conjSup (size-atom $filtered-sups))
        ($conjProb (// $conjSup $total_count))
        ($supConSup (sup-num-iisurp $db $con_super_pattern))
        ($canConSup (sup-num-iisurp $db $candPat))
        ($superprob (// $supConSup $total_count))
        ($candidateProb (// $canConSup $total_count))
        ($final_prob (* $conjProb (// $canConSup $supConSup))))
  ($final_prob $coher)))

; Helper to choose element from interval structure (kept for compatibility)
(= (handle_interval_list $list-el $type) (let ($maxsup $minsup) $list-el (if (== $type maxsup ) $maxsup $minsup)))

; Main IIsurp-old surprisingness computation.
; Steps:
; - compute total_count and empirical pattern probability
; - compute independent-partition estimates (results-inter)
; - compute subset/super concept estimates (subset-results)
; - union estimates, derive emin/emax, compute distance and return it
(= (IIsurp-old $pattern $db $normalize)
 (let* ($_ (println! "==== IIsurp-old surprisingness =====")
        ($total_count (total_counts-iisurp $pattern $db))
        ($psup (collapse (match $db $pattern $pattern)))
        ($pattern_prob (// (size-atom $psup) $total_count))
        ($partitions (partitions $pattern))
        ($results-inter (isurp-old_iisurp $partitions $db $total_count))
        ($subset-results (get-set-prob-intervals $pattern $db $total_count))
        ($results (if (not (== $subset-results ())) (union-atom $results-inter $subset-results) $results-inter))
        ($emin (min-atom $results))
        ($emax (max-atom $results))
        ($dst (dst-from-interval-iisurp $emin $emax $pattern_prob)))
  $dst))

(= (IIsurp-old $pattern $db $normalize $conc_db)
 (let* ($_ (println! "==== IIsurp-old surprisingness =====")
        ($total_count (total_counts-iisurp $pattern $db))
        ($psup (collapse (match $db $pattern $pattern)))
        ($pattern_prob (// (size-atom $psup) $total_count))
        ($partitions (partitions $pattern))
        ($results-inter (isurp-old_iisurp $partitions $db $total_count))
        ($subset-results (get-set-prob-intervals $pattern $db $total_count $conc_db))
        ($results (if (not (== $subset-results ())) (union-atom $results-inter $subset-results) $results-inter))
        ($emin (min-atom $results))
        ($emax (max-atom $results))
        ($dst (dst_from_interval-iisurp $emin $emax $pattern_prob)))
  $dst))