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
(= (do_emp_tv $pattern $db $db_ratio)
    (let* ( 
            ($jte  (do-ji-tv-est $db $pattern))         ;; after we get jte we must extract the mean
            (($link $mean $confidence) ($jte))
            ($_ (println! (Mean is  =========> $mean)))
            )
           (emp_tv_pbs $pattern $db $mean $db_ratio))
)



(= (emp_tv_pbs $pattern $db $prob_estimate $db_ratio)  
     (let* (
        ($support_estimate (prob_to_support $pattern $db $prob_estimate))
        ($db-size (* (db_size $db) $db_ratio))
        ($subsize (subsmp-size $pattern $db-size $support_estimate))
        ($n-resample 10)
        )
        (if (> $support_estimate $db-size)
            (emp-tv-bs $pattern $db $n-resample $subsize)
            (emp-tv $pattern $db)
        )
     )
)





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
            (mk_stv $mean $variance)
        ) ; Return average of the empirical truth values
    (emp-tv $pattern $db))) ; If subsize >= db size, directly return empirical truth value


