
 ;; Rule to calculate the empirical truth value of a pattern.

 ;;;;;;;;;;
 ;; Type ;;
 ;;;;;;;;;;


 ;; =============================================================================
;; Type: TruthValue
;; -----------------------------------------------------------------------------
;; Purpose: Represents a truth value with confidence measurement
;; Constructor: (EMPTV <strength> <confidence>)
;; =============================================================================
(: TruthValue Type)
(: EMPTV (-> $a $b TruthValue))



;; =============================================================================
;; Constant: Default_k
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Provides a default smoothing constant used in confidence calculations.
;;
;; Value:
;;   - 1
;;
;; Usage:
;;   Used in the denominator of the count_to_confidence function to avoid
;;   overconfidence with small sample sizes.
;; =============================================================================
(= (Default_k) 1)

;; =============================================================================
;; Constant: DEFAULT_K
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Defines a large default scaling constant used in statistical calculations
;;   or other smoothing functions (context-dependent).
;;
;; Value:
;;   - 800.0
;;
;; Usage:
;;   Intended for use where a higher smoothing or normalization factor is needed.
;;   Not currently referenced in count_to_confidence.
;; =============================================================================
(= (DEFAULT_K) 800.0)

;; =============================================================================
;; Function: count_to_confidence
;; -----------------------------------------------------------------------------
;; Purpose: 
;;   Calculate a confidence value based on a count using a smoothing constant.
;;
;; Parameters:
;;   - $x: The count value (e.g., number of observations or samples)
;;
;; Internal Calculation:
;;   1. Adds the smoothing constant Default_k to the input count
;;   2. Divides the count by the sum to compute a normalized confidence
;;      => confidence = x / (x + Default_k)
;;
;; Returns:
;;   - A confidence value between 0 and 1
;; =============================================================================
(= (count_to_confidence $x) (// $x (+ $x (Default_k))))

;; =============================================================================
;; Function: emp-tv
;; -----------------------------------------------------------------------------
;; Purpose: Calculate empirical truth value for a pattern in database
;; Parameters:
;;   - $pattern: Target pattern to evaluate
;;   - $db: Database to analyze
;; 
;; Internal Computation:
;;   1. universe-count: Get total relevant items
;;   2. sup-num: Get pattern occurrences
;;   3. confidence: Calculate using count_to_confidence
;;   4. mean: Calculate support ratio
;; 
;; Returns:
;;   - EMPTV structure containing mean and confidence
(= (emp-tv $pattern $db)
    (let*
        (  
            ( ($ucount ) ( (universe-count $pattern $db)))
            ( ($ms) ($ucount)) ;;  we didn't use ms for support calculation
            ( ($sup) ( (sup-num $pattern $db)))
            ( ($conf) ( (count_to_confidence $ucount)) )
            ($mean (// $sup $ucount))
            ($confidence   (* 1e-1 $conf))
        )
    (EMPTV $mean  $confidence)))


;; =============================================================================
;; Function: prob_to_support
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Calculate the support of a given pattern in a database using a probability estimate.
;;
;; Parameters:
;;   - $pattern: The pattern whose support is being computed. Represents a data structure or identifier.
;;   - $db: The database (typically a space or collection) where the pattern is evaluated.
;;   - $prob: The probability estimate of the pattern (a numeric likelihood value).
;;
;; Internal Calculation:
;;   1. Retrieve the universe count of the pattern in the given database using universe-count
;;   2. Multiply the count by the given probability estimate
;;      => support = probability × universe count
;;
;; Returns:
;;   - The support value, representing the expected count or weight of the pattern in the database
;; =============================================================================
(= (prob_to_support $pattern $db $prob)
    (* $prob (universe-count $pattern $db))
)


;; =============================================================================
;; Function: support_estimate_calculator
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Estimate the support for a pattern in a scaled database and compute the
;;   empirical truth value using bootstrapping techniques.
;;
;; Parameters:
;;   - $pattern: The pattern for which the support estimate and truth value are calculated.
;;   - $db: The database in which the pattern's support is evaluated.
;;   - $prob_estimate: The estimated probability of the pattern's occurrence.
;;   - $db_ratio: A scaling factor applied to the database size to reflect effective data contribution.
;;
;; Internal Calculation:
;;   1. Compute support estimate using prob_to_support based on pattern, db, and prob_estimate.
;;   2. Scale the database size by multiplying db_size with db_ratio.
;;   3. Call emp_tv_pbs with calculated values to compute the empirical truth value.
;;
;; Returns:
;;   - An empirical truth value (e.g., confidence and mode), adjusted via bootstrapping
;; =============================================================================
(= (support_estimate_calculator $pattern $db $prob_estimate $db_ratio)

    (let* ( ($support_estimate (prob_to_support $pattern $db $prob_estimate))
            ($database_size (* (db_size $db) $db_ratio)))
        (emp_tv_pbs $pattern $db $prob_estimate $db_ratio $database_size $support_estimate)))


;; =============================================================================
;; Function: categorize_by_support_estimate
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Categorize the subsample size based on a comparison between the support estimate 
;;   and the database size.
;;
;; Parameters:
;;   - $db_size: The size of the database.
;;   - $support_estimate: The estimated support of a pattern in the database.
;;
;; Internal Calculation:
;;   1. Compare the support estimate to the database size.
;;   2. If support estimate is greater than or equal to db size, assign category 1.
;;   3. Otherwise, assign category 2.
;;
;; Returns:
;;   - 1: If support estimate ≥ database size
;;   - 2: If support estimate < database size
;; =============================================================================
(= (categorize_by_support_estimate $db_size $support_estimate)
    (if (>= $support_estimate $db_size)
        1
        2)
)


;; =============================================================================
;; Function: emp_tv_pbs
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Calculate the empirical truth value (ETV) of a pattern in a database,
;;   selecting the computation method based on the estimated support relative
;;   to the database size. Bootstrapping is used if necessary.
;;
;; Parameters:
;;   - $pattern: The pattern for which the ETV is calculated.
;;   - $db: The database where the pattern is evaluated.
;;   - $prob_estimate: The estimated probability of the pattern.
;;   - $db_ratio: A scaling factor for adjusting database size.
;;   - $db_size: The effective (scaled) size of the database.
;;   - $support_estimate: The estimated support count of the pattern.
;;
;; Internal Calculation:
;;   1. Categorize the support estimate relative to the database size using categorize_by_support_estimate.
;;   2. If category is 1 (support ≥ db_size), use bootstrapping with emp-tv-bs.
;;   3. If category is 2 (support < db_size), use direct empirical calculation via emp_tv.
;;   4. Default case also falls back to emp_tv.
;;
;; Returns:
;;   - emp-tv-bs result: If bootstrapping is needed.
;;   - emp_tv result: Otherwise.
;; =============================================================================
(= (emp_tv_pbs $pattern $db $prob_estimate $db_ratio $db_size $support_estimate)
    (case (categorize_by_support_estimate $db_size $support_estimate)
        (
            (1 (emp-tv-bs $pattern $db $db_size $db_ratio $support_estimate))
            (2 (emp-tv $pattern $db))
            ($_ (emp-tv $pattern $db))
        )))


;; =============================================================================
;; Function: sup
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Compute the support of a pattern in a database by counting how many data
;;   trees match the pattern.
;;
;; Parameters:
;;   - $pattern: The pattern to be matched against data in the database.
;;   - $db: The database of data trees where the pattern is searched.
;;
;; Internal Calculation:
;;   1. Perform pattern matching on the database using the `match` function.
;;   2. Collapse the result to a flat collection of matches.
;;   3. Count the number of resulting tuples using `tuple-count`.
;;      => This represents the number of data trees that match the pattern.
;;
;; Returns:
;;   - An integer indicating the support (number of matches) for the given pattern.
;; =============================================================================
(= (sup $pattern $db)
    (tuple-count 
        (collapse 
            (match $db $x (let $pattern $x $pattern)))))


 ;;ji_tv_est_mem this function is used to estimate the joint probability of a pattern.
 ;;ji_tv_est_mem is going to implemented in est-tv rule.

;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (=(do-ji-tv-est $db $pattern) (
;;    let $prtns (generet-partition-without-pattern $pattern)  
;;          ( let ($strength $confidence) (avrg_tv (ji-est-tv $db (db_size $db) $pattern $prtns) )
;;          ($pattern  (ETV $strength $confidence)))  
;;          ;;(ji-est-tv $db (db_size $db) $pattern $prtns)             
;; ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; MOCKING ;;;;;;
;;;;;;;;;;;;;;;;;
( = (do-ji-tv-est-dummy $db $pattern) (                     
    $pattern  (STV 0.0016129032258064761 0.012488011224382688)                        
))                                                    
                                                      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; =============================================================================
;; Function: ji_tv_est
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Estimate the truth value (TV) of a pattern in a database using a joint independent method.
;;
;; Parameters:
;;   - $pattern: The pattern for which the truth value is being estimated.
;;   - $db: The database containing data for evaluation.
;;
;; Internal Calculation:
;;   1. Call `do-ji-tv-est` with the database and pattern to perform joint independent estimation.
;;   2. Extract the truth value ($tv) from the result, which is assumed to be a tuple ($pat $tv).
;;   3. Return the extracted truth value.
;;
;; Returns:
;;   - $tv: The estimated truth value of the pattern based on joint independent.
;; =============================================================================
(= (ji_tv_est $pattern $db) 
    (let* 
        (
            ($out_est (do-ji-tv-est $db $pattern)) 
            (($pat $tv) $out_est)
        )
        $tv
    )
)



 ;; =============================================================================
;; Function: categorize_subsize
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Categorize a subset size based on whether it exceeds half of a given threshold size.
;;
;; Parameters:
;;   - $subsize: The size of the subset to be evaluated.
;;   - $ts: The threshold size used for comparison.
;;
;; Internal Calculation:
;;   1. Divide the threshold size by 2.
;;   2. Compare the subset size to this half-threshold.
;;   3. If subset size > half of threshold, return 2; otherwise, return 1.
;;
;; Returns:
;;   - 2: If $subsize > ($ts / 2)
;;   - 1: If $subsize ≤ ($ts / 2)
;; =============================================================================
(= (categorize_subsize $subsize $ts)
    (if (> $subsize (// $ts 2))
        2
        1)
)


;; =============================================================================
;; Function: copy-db
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Create a copy of a given database by duplicating its contents into a new instance.
;;
;; Parameters:
;;   - $db: The database to be copied (destination for the copied data).
;;   - $old-db-content: The content of the original database that needs to be duplicated.
;;
;; Internal Calculation:
;;   1. If the $old-db-content is empty, return the original database as is.
;;   2. Otherwise, add the first element of the content (car-atom) to the new database using `add-reduct`.
;;   3. Recursively process the rest of the content (cdr-atom) to continue copying the remaining data.
;;   
;; Returns:
;;   - A new database instance containing all the data from the original database.
;; =============================================================================
(= (copy-db $db $old-db-content)
    (if (== $old-db-content ()) $db
        (let* ( ($_ (add-reduct $db (car-atom $old-db-content)) )
            )
        (copy-db $db (cdr-atom $old-db-content))
    )
))


;; =============================================================================
;; Function: add_n_atoms_to_db
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Add a specified number of atoms to a given database recursively.
;;
;; Parameters:
;;   - $db: The database to which atoms will be added.
;;   - $n: The number of atoms to add to the database.
;;
;; Internal Calculation:
;;   1. If $n is less than or equal to 0, return the database as is (base case for recursion).
;;   2. Otherwise, add a new atom to the database using `add-atom` (assumed to add "Pattern").
;;   3. Recursively call the function, reducing $n by 1, to continue adding atoms until the count is reached.
;;
;; Returns:
;;   - The database with the specified number of atoms added.
;; =============================================================================
(= (add_n_atoms_to_db $db $n)
    (if (<= $n 0) $db
        (let* ( ($_ (add-atom $db Pattern))
            )
        (add_n_atoms_to_db $db (- $n 1))
    )
))


;; =============================================================================
;; Function: copy-and-add-atom
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Create a copy of the given database and add a specified number of atoms to the new database.
;;   This function ensures that the contents of the original database are duplicated into a new instance,
;;   and then it adds a specified number of atoms to the new database.
;;
;; Parameters:
;;   - $db: The original database to be copied.
;;   - $n: The number of atoms to add to the new database.
;;
;; Internal Calculation:
;;   1. If $n is less than or equal to 0, return the original database without any modifications.
;;   2. Otherwise, create a new database by copying the contents of $db using `copy-db`.
;;   3. Add atoms to the new database by calling `add_n_atoms_to_db` with the new database and $n.
;;
;; Returns:
;;   - A new database instance, containing the original database's data and the additional atoms added.
;; =============================================================================
(= (copy-and-add-atom $db $n)
    (if (<= $n 0) $db
        (let* ( ($new-db (copy-db (new-space) ( (collapse (get-atoms $db)) ))))
        )
    (add_n_atoms_to_db $db $n)
))

;; =============================================================================
;; Function: duplicate-and-expand-space
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Create a copy of the given space and add a specified number of atoms to the new space.
;;   This function ensures that all the contents of the original space are duplicated into a new space instance,
;;   and then a specified number of atoms are added to the new space.
;;
;; Parameters:
;;   - $space: The original space to be copied.
;;   - $n: The number of atoms to add to the new space.
;;
;; Internal Calculation:
;;   1. Copy the contents of the original space into a new space instance using `copy-db` and `collapse`.
;;   2. Add atoms to the new space by calling `add_n_atoms_to_db` with the new space and $n.
;;
;; Returns:
;;   - A new space instance containing the original space's data and the additional atoms added.
;; =============================================================================
(= (duplicate-and-expand-space $space $n)
    (let $new-db (copy-db  (new-space) (collapse (get-atoms $space) ) )
        (add_n_atoms_to_db $new-db $n)
    )
)



;; =============================================================================
;; Function: copy-db-by-size
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Create a copy of the given database up to a specified size. This function ensures that the contents of the original 
;;   database are duplicated into a new database instance until the specified size is reached.
;;
;; Parameters:
;;   - $db: The new database instance where the contents of the original database will be copied.
;;   - $old-db-content: The contents of the original database that need to be copied.
;;   - $n: The current count of atoms added to the new database.
;;   - $size: The maximum number of atoms to be copied to the new database.
;;
;; Internal Calculation:
;;   1. If the $old-db-content is empty or the current count $n has reached the specified $size, return the current database ($db).
;;   2. Otherwise, add the first atom of $old-db-content to the new database using `add-atom`.
;;   3. Recursively call the function, incrementing $n by 1, to continue copying until the size limit is reached.
;;
;; Returns:
;;   - A new database instance containing the first $size atoms from the original database.
;; =============================================================================
(= (copy-db-by-size $db $old-db-content $n $size)
    (if (or (== $old-db-content ()) (>= $n $size)) $db
        (let* ( ($_ (add-atom $db (car-atom $old-db-content)) ))
            (copy-db-by-size $db (cdr-atom $old-db-content) (+ $n 1) $size)
        )
    )
)


;; =============================================================================
;; Function: subsample
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Adjust the size of a given database to match a specified subset size ($subsize).
;;   If the current size of the database is greater than or equal to the subset size,
;;   it returns the original database. Otherwise, it categorizes the database and either 
;;   adds or removes atoms to achieve the desired subset size.
;;
;; Parameters:
;;   - $db: The database to be subsampled.
;;   - $subsize: The target subset size for the database.
;;
;; Internal Calculation:
;;   1. If the current size of the database is less than or equal to the target subset size, return the database as is.
;;   2. Otherwise, categorize the database using `categorize_subsize` to decide whether atoms should be added or removed.
;;   3. If categorized as group 1, add atoms to the database using `duplicate-and-expand-space`.
;;   4. If categorized as group 2, remove atoms by using `copy-db-by-size` to adjust the size to the desired subset size.
;;
;; Returns:
;;   - A new database instance with a size adjusted to match the target subset size ($subsize).
;; =============================================================================
(= (subsample $db $subsize)
    (if (<= (db_size $db) $subsize)
        $db
        (case (categorize_subsize  $subsize (db_size $db))
            (
                (1 (duplicate-and-expand-space $db (- (* $subsize 2) (db_size $db)))) ; if it is in group 1 add atoms to the database
                (2 (copy-db-by-size (new-space) (collapse (get-atoms $db ) ) 0 (- (* $subsize 2) (db_size $db))))
                ($_ (copy-db-by-size (new-space) (collapse (get-atoms $db ) ) 0 (- (* $subsize 2) (db_size $db))))
            )
        )
    )
)

;; =============================================================================
;; Function: do_emp_tv
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Calculates the empirical truth value for a given pattern in a database.
;;   It processes the database to obtain a sequence of atoms, estimates the joint truth value (JTV),
;;   and then uses the support estimate calculator to compute the final empirical truth value.
;;
;; Parameters:
;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
;;   - $db: The database in which the pattern's empirical truth value is to be calculated.
;;   - $db_ratio: The ratio used to scale the database size.
;;
;; Internal Calculation:
;;   1. Extract the sequence of atoms from the database using `get-atoms` and `collapse`.
;;   2. Estimate the joint truth value (JTV) for the given pattern and database using `ji_tv_est`.
;;   3. Extract the mean and confidence values from the joint truth estimate.
;;   4. Use the `support_estimate_calculator` to compute the empirical truth value based on the mean and database ratio.
;;
;; Returns:
;;   - The computed empirical truth value for the given pattern in the database.
;; =============================================================================
(= (do_emp_tv $pattern $db $db_ratio )
    (let* ( ($db_sequence (collapse (get-atoms $db) ))
            ($jte  (ji_tv_est $pattern $db))         ;; after we get jte we must extract the mean
            (($link $mean $confidence) $jte)
            )
           (support_estimate_calculator  $pattern $db $mean $db_ratio))
)

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;TODO: suspeceted for change 

(= (gen-random $max-value)  (
        (py-dot np-rnd randint) $max-value)
)

;TODO: suspeceted for change 
(= (get-element $index $list)
    (if (== $index 0)
        (car-atom $list) ; Return the first element if index is 0
        (get-element (- $index 1) (cdr-atom $list))))

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;; Implmented Before ;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; =============================================================================
;; Function: gen-random-subsample
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Generates a random subsample of a given size from a database. The function ensures that the subsample 
;;   contains random elements from the original database and returns a new space containing only the subsample.
;;   If the requested subsample size is 0, it returns an empty space.
;;
;; Parameters:
;;   - $db: The database from which the subsample will be taken.
;;   - $subsize: The size of the subsample to generate.
;;   - $space: The space where the subsample will be stored.
;;
;; Internal Calculation:
;;   1. If the database size is equal to the subsample size, return the database as the subsample.
;;   2. If the subsample size is 0, return an empty space.
;;   3. Otherwise, collapse the database into a list of atoms.
;;   4. Generate a random index for selecting an element from the list using `gen-random`.
;;   5. Retrieve the selected element using `get-element`.
;;   6. Add the selected element to the subsample space.
;;   7. Recursively generate the remaining elements of the subsample by calling `gen-random-subsample`.
;;
;; Returns:
;;   - A new space containing the random subsample of the original database.
;; =============================================================================
(= (gen-random-subsample $db $subsize $space)
    (if (== (db_size $db) $subsize)
        $db
        (if (== $subsize 0)
            $space ; Return an empty list if the sample size is 0
            (let* (
                    ($db-element (collapse (get-atoms $db)))
                    ($random-index (gen-random $subsize)) ; Get a random index
                    ($element (get-element $random-index $db-element))
                    ($_ (add-atom $space $element)) ; Get the element from the list
                    ($tail (gen-random-subsample $db (- $subsize 1) $space)) ; Recursively generate the rest of the subsample
                )
            $space) ; Add the element to the subsample
        )
    )
)

;; =============================================================================
;; Function: emp-tv-subsmp
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Calculates the empirical truth value for a given pattern in a subsampled version of a database.
;;   The function first creates a subsample of the database of the specified size and then computes 
;;   the empirical truth value based on that subsample.
;;
;; Parameters:
;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
;;   - $db: The database from which the subsample will be drawn.
;;   - $subsize: The size of the subsample to be used.
;;
;; Internal Calculation:
;;   1. Use the `subsample-py` function to generate a subsample of the database of the desired size.
;;   2. Call the `emp-tv` function to compute the empirical truth value for the pattern based on the subsample.
;;
;; Returns:
;;   - The empirical truth value for the pattern based on the subsampled database.
;; =============================================================================
(= (emp-tv-subsmp $pattern $db $subsize)
    (let* ( ($space (subsample-py $db $subsize)))
        (emp-tv $pattern $space)
    )
)

;; =============================================================================
;; Function: emp-tv-bs-helper
;; -----------------------------------------------------------------------------
;; Purpose:
;;   This function performs bootstrapping to estimate the empirical truth value of a given pattern.
;;   It recursively generates multiple subsamples from the database, computes the empirical truth value 
;;   for each subsample, and aggregates the results.
;;
;; Parameters:
;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
;;   - $db: The database from which the subsamples will be drawn.
;;   - $n-resample: The number of resamples to perform.
;;   - $subsize: The size of each subsample.
;;
;; Internal Calculation:
;;   1. If the number of resamples is 0, return an empty list (base case).
;;   2. Otherwise, compute the empirical truth value for a random subsample of the database using `emp-tv-subsmp`.
;;   3. Recursively call the function to perform the remaining resamples.
;;   4. Add the empirical truth value for the current subsample to the list of results.
;;
;; Returns:
;;   - A list containing the empirical truth values for the pattern, calculated from multiple subsamples.
;; =============================================================================
(= (emp-tv-bs-helper $pattern $db $n-resample $subsize)
    (if (== $n-resample 0)
        () ; Base case: no more resampling, return an empty list
        (let* (
                ($subsample-tv (emp-tv-subsmp $pattern $db $subsize)) ; Compute empirical truth value for subsample
                ($remaining-esstvs (emp-tv-bs-helper $pattern $db (- $n-resample 1) $subsize)) ; Recursive call
            )
        (cons-atom $subsample-tv $remaining-esstvs)))) ; Add the result to the list and continue

;; =============================================================================
;; Function: subsmp-size
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Calculates the sub-sample size based on the given pattern, database size, 
;;   support estimate, and a minimum sub-sample size. The function computes an 
;;   appropriate sub-sample size that ensures statistical robustness.
;;
;; Parameters:
;;   - $pattern: The pattern to be matched.
;;   - $db-size: The size of the database.
;;   - $support-estimate: The estimated support value of the pattern.
;;   - $min-subsize: The minimum sub-sample size to be considered.
;;
;; Internal Calculation:
;;   1. Compute the number of conjuncts in the pattern using `n_conjuncts`.
;;   2. Calculate the alpha value, which is the ratio of the support estimate 
;;      to the database size raised to the power of the number of conjuncts.
;;   3. Calculate the base by dividing the database size by ten times alpha.
;;   4. Compute the result by raising the base to the power of 1/$nc.
;;   5. Return the maximum between the computed result and the minimum of 
;;      the minimum sub-sample size and database size.
;;
;; Returns:
;;   - The calculated sub-sample size, ensuring it is at least the minimum 
;;     size and does not exceed the database size.
;; =============================================================================
(= (subsmp-size $pattern $db-size $support-estimate)
    (let* ( ($nc (n_conjuncts $pattern))    
            (($min-size) (10))   
            ($alpha (// $support-estimate (pow-math $db-size $nc)))
            ($base (// $db-size (* 10 $alpha)))
            ($power (// 1 $nc))
            ($res (pow-math $base $power)) 
    )
        (max $res (min $min-size $db-size))
    )
)

;; =============================================================================
;; Function: emp-tv-bs
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Calculates the empirical truth value using bootstrapping (resampling) for a given pattern 
;;   and database, incorporating the database size, ratio, and support estimate. The function 
;;   performs resampling by creating multiple subsamples, computing their empirical truth values, 
;;   and combining them to estimate the final empirical truth value.
;;
;; Parameters:
;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
;;   - $db: The database in which the pattern's empirical truth value is to be calculated.
;;   - $db_size: The effective size of the database.
;;   - $db_ratio: The ratio used to scale the database size.
;;   - $support_estimate: The estimated support of the pattern in the database.
;;
;; Internal Calculation:
;;   1. Calculate the scaled database size by multiplying $db_size with $db_ratio.
;;   2. Calculate the subsample size using `subsmp-size`, based on the scaled database size and support estimate.
;;   3. Set the number of resamples to 10 (can be adjusted based on needs).
;;   4. Call `emp-tv-bs` with the specified pattern, database, number of resamples, and subsample size.
;;
;; Returns:
;;   - The empirical truth value (emp-tv) calculated using bootstrapping (resampling).
;; =============================================================================
(= (emp-tv-bs $pattern $db $db_size $db_ratio $support_estimate) (
        let* (
            ($db-size-ratio (* $db_size $db_ratio))
            ($subsize (subsmp-size $pattern $db-size-ratio $support_estimate))
            ($n-resample 10)
        )
    (emp-tv-bs $pattern $db $n-resample $subsize)
) ) ; If subsize >= db size, directly return empirical truth value






;; =============================================================================
;; Function: emp-tv-bs
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Calculates the empirical truth value using bootstrapping (resampling) for a given pattern 
;;   and database, incorporating multiple resamples and subsample sizes. The function 
;;   first checks if the subsample size is smaller than the database size. If so, it performs 
;;   bootstrapping by resampling the database multiple times, calculating the empirical truth 
;;   value for each resample, and returning the average. If the subsample size is greater than 
;;   or equal to the database size, it directly computes the empirical truth value.
;;
;; Parameters:
;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
;;   - $db: The database in which the pattern's empirical truth value is to be calculated.
;;   - $n-resample: The number of resamples to perform during bootstrapping.
;;   - $subsize: The subsample size used in the resampling process.
;;
;; Internal Calculation:
;;   1. If the subsample size is less than the database size, the function performs resampling:
;;      - Calls `emp-tv-bs-helper` to generate multiple empirical truth values (one for each resample).
;;      - Averages the resampled empirical truth values using `avrg-tv-py`.
;;      - Calls `mk-stv` to create a simple truth value from the mean and variance of the empirical truth values.
;;   2. If the subsample size is greater than or equal to the database size, it directly calculates the empirical truth value using `emp-tv`.
;;
;; Returns:
;;   - If subsize is smaller than the database size: A simple truth value based on the average empirical truth values from the resamples.
;;   - If subsize is greater than or equal to the database size: The direct empirical truth value of the pattern.
;; =============================================================================
(= (emp-tv-bs $pattern $db $n-resample $subsize)
    (if (< $subsize (db_size $db))
        (let* (
                ($esstvs (emp-tv-bs-helper $pattern $db $n-resample $subsize))
                ((EMPTV $mean $variance) (avrg-tv-py $esstvs))
            )
            (mk-stv $mean $variance)
        ) ; Return average of the empirical truth values
    (emp-tv $pattern $db))) ; If subsize >= db size, directly return empirical truth value






;; =============================================================================
;; Function: mk-stv
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Constructs a simple truth value (STV) based on the provided mean and variance.
;;   This function computes a mode and confidence value from the given parameters,
;;   and uses these values to create a final truth value. The mode is derived using 
;;   various conditions depending on the values of alpha, beta, and their relationships.
;;
;; Parameters:
;;   - $mean: The mean value representing the central tendency of the empirical truth values.
;;   - $variance: The variance representing the spread or uncertainty of the empirical truth values.
;;
;; Internal Calculation:
;;   1. Computes `alpha` and `beta` values based on the mean and variance:
;;      - `alpha = mean * (mean - 1) / variance`
;;      - `beta = (1 - mean) * (mean - 1) / variance`
;;   2. Sets initial values for `p_alpha` and `p_beta` as 1.0.
;;   3. Computes `count` based on the sum of `alpha` and `beta`, and the values of `p_alpha` and `p_beta`.
;;   4. Calculates the confidence as the ratio of `count` to `count + DEFAULT_K`.
;;   5. Based on the values of `alpha` and `beta`, computes the `mode`:
;;      - If both `alpha` and `beta` are greater than 1, it adjusts the mode based on the difference between `alpha` and `beta`.
;;      - If both `alpha` and `beta` are less than or equal to 1, the mode is set to 1.
;;      - If `alpha` is less than 1 and `beta` is less than or equal to 1, the mode is set to 0.
;;      - If `alpha` is less than or equal to 1 and `beta` is greater than 1, the mode is set to 1.
;;      - Otherwise, the mode is set to the mean value.
;;   6. Returns the final `EMPTV` (empirical truth value) consisting of the computed mode and confidence.
;;
;; Returns:
;;   - The simple truth value consisting of the computed mode and confidence.
;; =============================================================================
(= (mk-stv $mean $variance)
    (let* (
            ($alpha (* $mean (// (* $mean (- 1 $mean)) $variance)))
            ($beta (* (- 1 $mean) (// (* $mean (- 1 $mean)) $variance)))
            ($p_alpha 1.0)
            ($p_beta 1.0)
            ($count (max 0.1 (- (- (+ $alpha $beta ) $p_alpha) $p_beta)))
            ($confidence (// $count (+ $count (DEFAULT_K)))))
            ($mode  (
                    if (and (> $alpha 1) (> $beta 1))
                    (// (- $alpha 1) (- (+ $alpha $beta) 2))
                    (if (and (<= 1 $alpha) (<= 1 $beta))
                        1
                        (if (and (< $alpha 1) (<= 1 $beta))
                            0
                            (if (and (<= 1 $alpha) (< $beta 1))
                                1
                                $mean
                            )
                    )
            )
    )) 

)
(EMPTV $mode $confidence))
