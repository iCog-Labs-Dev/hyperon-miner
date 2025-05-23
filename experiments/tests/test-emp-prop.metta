


! (register-module! ../../experiments)

! (import! &kb experiments:data:ugly_man_sodaDrinker)
! (import! &self experiments:rules:emp-prob)
! (import! &self experiments:rules:emp-tv)
! (import! &self experiments:rules:est-tv)
; ! (import! &self experiments:utils:eq_prob)
! (import! &self experiments:rules:isurp)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:bs-utils)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:emp-tv-bs)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:eq_prob_adaptor)




! (add-reduct &self (= (get-space) (new-space)))
! (add-atom (get-space) (Inheritance Abe human))
! (add-atom (get-space) (Inheritance Rio human))
! (add-atom (get-space) (Inheritance Bob human))
! (add-atom (get-space) (Inheritance Mike human))
! (add-atom (get-space) (Inheritance Mike Nil))
! (add-atom (get-space) (Inheritance Zac human))
! (add-atom (get-space) (Inheritance Zac human))
! (add-atom (get-space) (Parent Abe Nil ))


;; =============================================================================
;; Test: emp-prob-pbs (Zero Probability)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify that patterns with no matches in the space correctly return 0 probability
;;
;; Inputs:
;;   - Pattern: (, (Inheritance $x $z) (Inheritance $x human))
;;   - Space: (get-space) [current knowledge base]
;;   - Threshold: 0.5
;;
;; Expected Output:
;;   0.0 (since the pattern doesn't match any exact instances)
;;
;; Verification:
;;   Tests correct handling of patterns with no matches in the space
;; =============================================================================
(assertEqual 
  (emp-prob-pbs 
    (, (Inheritance $x $z) (Inheritance $x human)) 
    (get-space) 
    0.5) 
  0.0)

;; =============================================================================
;; Test: emp-prob-pbs (Single Atom Probability)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify correct probability calculation for a single atom pattern
;;
;; Inputs:
;;   - Pattern: (Inheritance $x human)
;;   - Space: (get-space)
;;   - Threshold: 0.9
;;   - Ratio: 0.5
;;
;; Expected Output:
;;   0.75 (representing 75% match probability)
;;
;; Verification:
;;   Tests basic probability calculation for single-atom patterns
;; =============================================================================
(assertEqual 
  (emp-prob-pbs 
    (Inheritance $x human) 
    (get-space) 
    0.9 
    0.5)  
  0.75)

;; =============================================================================
;; Test: subsample-py
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify creation of a random subsample from the knowledge space
;;
;; Inputs:
;;   - Space: (get-space)
;;   - Sample size: 4
;;
;; Expected Output:
;;   [GroundingSpace-0x5569c27b0ad8] (or similar memory reference)
;;
;; Verification:
;;   Tests that subsampling returns a new space object with random selection
;;   Note: Exact contents vary due to randomness
;; =============================================================================
(subsample-py (get-space) 4)


;; =============================================================================
;; Test: sup-num
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify correct counting of pattern matches in the space
;;
;; Inputs:
;;   - Space: (get-space)
;;   - Pattern: (Inheritance $x human)
;;
;; Expected Output:
;;   6 (exact matches found)
;;
;; Verification:
;;   Tests accurate counting of pattern instances in the knowledge base
;; =============================================================================
(assertEqual 
  (sup-num 
    (get-space) 
    (Inheritance $x human)) 
  6)

;; =============================================================================
;; Test: emp_prob_bs (Pattern Tuple)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify bootstrap probability estimation for pattern tuples
;;
;; Inputs:
;;   - Pattern: (, (Inheritance $x man) (Inheritance $x ugly))
;;   - Space: &kb
;;   - Bootstrap iterations: 5
;;   - Subsample size: 5
;;
;; Expected Output:
;;   Varies between 0 and 1 (due to random sampling)
;;
;; Verification:
;;   Tests probabilistic estimation with multiple iterations
;;   Note: Non-deterministic output requires statistical validation
;; =============================================================================
(emp_prob_bs 
  (, (Inheritance $x man) (Inheritance $x ugly)) 
  &kb 
  5 
  5)

  ;; =============================================================================
;; Test: emp_prob_bs (Single Atom)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify bootstrap probability estimation for single atoms
;;
;; Inputs:
;;   - Pattern: (Inheritance $x man)
;;   - Space: &kb
;;   - Bootstrap iterations: 5
;;   - Subsample size: 5
;;
;; Expected Output:
;;   Varies between 0 and 1 (due to random sampling)
;;
;; Verification:
;;   Tests probabilistic estimation for simpler patterns
;;   Note: Non-deterministic output requires statistical validation
;; =============================================================================
(emp_prob_bs 
  (Inheritance $x man)  
  &kb 
  5 
  5)
; =============================================================================
; Test: subsmp-size (with 50% Database Ratio)
; -----------------------------------------------------------------------------
; Purpose:
;   Verify sample size calculation when the database ratio is set to 50%, testing:
;   1. Correct handling of the db_ratio parameter
;   2. Proper scaling of sample size based on database coverage
;   3. Interaction between pattern complexity and database ratio
;
; Inputs:
;   - Pattern: 3-clause pattern (Inheritance relationships)
;   - Total space size: 64 atoms
;   - Database ratio: 0.5 (50% of db considered relevant)
;
; Expected Output: 
;   149.7097081964987 (calculated sample size)
;

; Verification:
;   The result shows the system:
;   1. Treats db_ratio as a linear scaling factor 
;   2. Still accounts for full pattern complexity
;   3. Maintains same calculation structure as other ratio values
; =============================================================================
(assertEqual
  (subsmp-size 
    (, (Inheritance $x man)
       (Inheritance $x ugly) 
       (Inheritance $x sodaDrinker))
    64
    0.5)  ;; 50% database ratio parameter
  149.7097081964987)



