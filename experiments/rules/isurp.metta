;;! (register-module! ../../experiments)
;;! (import! &self experiments:utils:common-utils)
;;! (import! &self experiments:utils:beta-dist)
;;! (import! &self experiments:utils:constants)
;;! (import! &self experiments:utils:TruthValue)
;;! (import! &self experiments:utils:surp-utils)
;;! (import! &self experiments:utils:miner-utils)
;;! (import! &self experiments:utils:gen_partition)
;;! (import! &self experiments:rules:est-tv)
;;! (import! &self experiments:rules:emp-tv)
;;! (import! &self experiments:rules:emp-prob-pbs)


;; Calculate the empirical probability of pattern, using
;; boostrapping if necessary
(=(emp_prob_pbs_mem $subpattern $db  $db_ratio) 0.4)


;; ==============================================================
;; Function: pro-prob-wout-joint (Product Probability Without Joint Variables)
;; Purpose:  Computes the product probability of subpatterns while ignoring
;;           dependencies between joint variables (treats components as independent)
;;
;; Parameters:
;;   $subpatterns - List of pattern components to evaluate
;;   $db          - Database/context for probability calculation
;;   $db_ratio    - Sampling ratio for empirical probability estimation
;;   $p           - Accumulator for the product probability (starts at 1)
;;
;; How it works:
;; 1. Base Case: When no subpatterns remain, returns accumulated probability
;; 2. Recursive Case:
;;    a. Decomposes subpatterns into head (current) and tail (remaining)
;;    b. Calculates empirical probability of current subpattern
;;    c. Multiplies with accumulated probability
;;    d. Recursively processes remaining subpatterns
;;
;; Mathematical Formulation:
;;   P(pattern) = Π P(subpattern_i) for i in 1..n
;;   Where subpatterns are treated as independent components
;;
;; Key Characteristics:
;; - Recursive implementation
;; - Tail-recursive for efficiency
;; - Multiplicative probability accumulation
;; - Uses empirical probability (emp-prob) for component estimates
;;
;; Typical Usage:
;; Used within ji_prob_est to compute the independent probability component
;; before applying joint variable corrections
;; ==============================================================
(=(pro-prob-wout-joint $subpatterns $db $db_ratio $p) (
  if (== $subpatterns ()) $p (
    let* ((($subpattern $tail) (decons-atom $subpatterns))
    ($empr (emp-prob  (cons-atom , $subpattern) $db))
    ($new_prob (* $p $empr))
    ; ($_ (println! ("new_prob" $new_prob)))
    )
       (pro-prob-wout-joint $tail $db $db_ratio $new_prob)
  )
))



;; ==============================================================
;; Function: ji-prob-est (Joint-Independent Probability Estimate)
;; Purpose:  Estimates the probability of a pattern by:
;;           1. Treating partition components as independent
;;           2. Accounting for joint variables between components
;;
;; Parameters:
;;   $partition - Database partition (components to evaluate separately)
;;   $pattern   - The pattern to evaluate
;;   $db        - The database/context
;;   $db_ratio  - Sampling ratio for probability estimation
;;
;; How it works:
;; 1. Calculates component probability ($p) without joint variables:
;;    (pro-prob-wout-joint $partition $db $db_ratio 1)
;;    - This gives the base probability ignoring variable dependencies
;;
;; 2. Gets database size for normalization:
;;    (db_size $db)
;;
;; 3. Computes joint variable correction factor:
;;    (eq-prob-py $partition $pattern $db-size)
;;    - Estimates probability that joint variables have equal values
;;    - Accounts for dependencies between components
;;
;; 4. Returns combined probability estimate:
;;    (* $p $eq_prob)
;;    - Product of independent probability and joint correction factor
;;
;; Mathematical Interpretation:
;;   P(pattern) ≈ P(components independent) × P(variables equal)
;;
;; Key Characteristics:
;; - Conservative estimate (tends to underestimate true probability)
;; - Handles variable dependencies through eq-prob-py correction
;; - Uses sampling (via db_ratio) for computational efficiency
;;
;; Typical Usage:
;; Used within ji_prob_est_interval to provide probability bounds
;; for surprisingness calculations (isurp function)
;; ==============================================================
(= (ji-prob-est $partition $pattern $db $db_ratio) (let* 
( 
  
  ($p (pro-prob-wout-joint $partition $db $db_ratio 1))
  ($db-size (db_size $db))
  ($eq_prob (eq-prob-py $partition $pattern $db-size))
  )
  (* $p $eq_prob)

)
)


; (=(do-ji-prob $partitions $pattern $db $db_ratio) (
;   if (== $partitions ()) () (
;      let* ((($partition $tail) (decons-atom $partitions))
;             ($jip (ji-prob-est $partition $pattern $db $db_ratio))
;              ($dummy (do-ji-prob $tail $pattern $db $db_ratio)))
;              (cons-atom $jip $dummy) ))
; )


;; Previous Implementation: ^
;; - Utilizes explicit recursion to operate over the list of partitions.
;; - Decomposes the partitions list using a deconstructing approach (decons-atom).
;; - For each partition, it computes the probability estimate using ji-prob-est.
;; - Recursively processes the remaining partitions until an empty list is reached.
;; - This method leverages conditional checks and explicit recursion, which can lead to deeper call stacks.
;;
;; New Implementation: v
;; - Avoids explicit recursion by exploiting metta's non-deterministic properties.
;; - Uses the 'superpose' function to combine results directly from all partitions.
;; - Applies 'collapse' to aggregate the result of ji-prob-est computed on the combined partitions.
;; - This approach is more concise and potentially more efficient as it abstracts the iteration over partitions.
;;
;; Overall Comparison:
;; - Both versions aim to calculate the ji-prob-est over partitions with a given pattern and database ratio.
;; - The older recursive approach handles each partition individually, while the new version collectively processes
;;   the partitions via superposition and collapse.
;; - The new implementation simplifies the code and leverages metta's capabilities to avoid deep recursion.

(=(do-ji-prob $partitions $pattern $db $db_ratio) (
   collapse (ji-prob-est (superpose $partitions) $pattern $db $db_ratio)
))





;; ==============================================================
;; Function: ji_prob_est_interval
;; Purpose: Estimates the expected probability interval [emin, emax] for a pattern
;;          using a Joint Independent (JI) estimation method
;;
;; Parameters:
;;   $pattern    - The pattern whose probability we want to estimate
;;   $db         - The database/context for probability estimation
;;   $db_ratio   - Ratio parameter controlling database sampling/weighting
;;
;; How it works:
;; 1. Generates partitions of the database excluding the pattern:
;;    (generet-partition-without-pattern $pattern)
;;    - Creates modified versions of the database that exclude the target pattern
;;    - This is similar to jackknife resampling in statistics
;;
;; 2. Computes probability estimates across partitions:
;;    (do-ji-prob partitions $pattern $db $db_ratio)
;;    - Calculates probability estimates for the pattern in each modified partition
;;    - The $db_ratio likely controls the size/weight of sampled partitions
;;
;; 3. Determines the minimum and maximum observed probabilities:
;;    (min-max probabilities)
;;    - Finds the range [emin, emax] of probability values across partitions
;;
;; 4. Returns the probability interval as (emin emax)
;;
;; Mathematical Interpretation:
;;   Provides a robust probability estimation by:
;;   - Creating multiple variants of the database (pattern-excluded)
;;   - Measuring how the pattern's probability varies across these variants
;;   - Returning the observed range of probabilities
;;
;; Typical Usage:
;;   Used as input for surprisingness measures (like isurp) to determine
;;   whether a pattern occurs more/less frequently than expected
;;
;; Return Value:
;;   Returns a pair (emin emax) representing the estimated probability range
;; ==============================================================
(=(ji_prob_est_interval $pattern $db $db_ratio) (
   let ($emin $emax) (min-max  (do-ji-prob (generet-partition-without-pattern $pattern) $pattern $db $db_ratio))
        ($emin $emax)
))








;; ==============================================================
;; Function: isurp (Intensional Surprisingness)
;; Purpose:  Measures how statistically surprising a pattern is
;;           within a given database context, with optional normalization
;;
;; Parameters:
;;   $pattern    - The pattern to evaluate for surprisingness
;;   $db         - The database/context to evaluate against
;;   $normalize  - Boolean flag to normalize the result (0-1 range)
;;   $db_ratio   - Ratio parameter for database sampling/weighting
;;
;; How it works:
;; 1. Calculates probability interval (emin, emax) for the pattern using ji_prob_est_interval
;;    - This estimates the expected probability range of the pattern
;; 2. Computes empirical probability (emp) using emp-prob-pbs
;;    - The actual observed probability in the database
;; 3. Measures distance (dst) between empirical probability and expected interval
;;    - Using dst_from_interval (likely measures how far emp is from expected range)
;; 4. Determines maximum probability value (maxprb) between emp and emax
;; 5. Returns:
;;    - If normalize=true: The ratio of distance to max probability (clamped to 1.0)
;;    - If normalize=false: The raw distance value (clamped to 1.0)
;;
;; Mathematical Interpretation:
;;   Measures how much the observed frequency deviates from expected,
;;   with normalization option to make values comparable across patterns
;;
;; Return Value:
;;   Returns a surprisingness measure between 0 and 1, where:
;;   - 0 = completely expected
;;   - 1 = maximally surprising
;; ==============================================================

(=(isurp $pattern $db $normalize $db_ratio) (
    let* (
      (($emin $emax) (ji_prob_est_interval $pattern $db $db_ratio))
           ($emp (emp-prob-pbs  $pattern $db $emax $db_ratio))
            ($dst (dst_from_interval $emin $emax $emp))
             ($maxprb (max ($emp $emax))))
               (min ((if $normalize (// $dst $maxprb) $dst) 1.0))
))





