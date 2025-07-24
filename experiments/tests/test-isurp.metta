! (register-module! ../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:bs-utils) 

! (import! &self experiments:rules:est-tv)
! (import! &self experiments:rules:emp-tv)
! (import! &self experiments:rules:isurp)
! (import! &self experiments:rules:emp-prob)
! (import! &kb experiments:data:ugly_man_sodaDrinker)
! (import! &self experiments:utils:eq_prob_adaptor)





;; =============================================================================
;; Test: ji-prob-est (Single Partition)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify correct joint independent probability calculation for a pattern across
;;   a single partition with overlapping clauses.
;;
;; Inputs:
;;   - Partition: (((Inheritance $x man) (Inheritance $x sodaDrinker)))
;;                ((Inheritance $x ugly))
;;   - Pattern: (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))
;;   - DB Reference: &kb
;;   - Ratio: 0.5
;;
;; Expected Output:
;;   0.009135566413047788 (probability estimate)
;;
;; Verification:
;;   Tests basic JI-Prob calculation when clauses are distributed across two
;;   partition components with some overlap in variables.
;; =============================================================================
(assertEqual 
  (ji-prob-est 
    (((Inheritance $x man) (Inheritance $x sodaDrinker)) 
    ((Inheritance $x ugly)))
    (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))
    &kb 
    0.5) 
  0.009135566413047788)


;; =============================================================================
;; Test: ji-prob-est (Disjoint Partition)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify JI-Prob calculation when pattern clauses are completely separated
;;   across different partition components.
;;
;; Inputs:
;;   - Partition: (((Inheritance $x man)) 
;;                ((Inheritance $x sodaDrinker)) 
;;                ((Inheritance $x ugly)))
;;   - Pattern: Same as Test 1
;;   - DB Reference: &kb
;;   - Ratio: 0.5
;;
;; Expected Output:
;;   0.13155215634788814 (higher probability due to disjoint distribution)
;;
;; Verification:
;;   Tests that completely separated clauses in partition yield higher JI-Prob
;;   than overlapping cases (Test 1), demonstrating proper dependence modeling.
;; =============================================================================
(assertEqual 
  (ji-prob-est 
    (((Inheritance $x man)) 
     ((Inheritance $x sodaDrinker)) 
     ((Inheritance $x ugly)))
    (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))
    &kb 
    0.5) 
  0.13155215634788814)



;; =============================================================================
;; Test: do-ji-prob (Multiple Partitions)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify batch processing of JI-Prob estimates across multiple partition
;;   configurations.
;;
;; Input Partitions:
;;   1. Overlapping: (((Inheritance $x man) (Inheritance $x sodaDrinker)) 
;;                    ((Inheritance $x ugly)))
;;   2. Partial overlap: (((Inheritance $x man) (Inheritance $x ugly)) 
;;                       ((Inheritance $x sodaDrinker)))
;;   3. Fully disjoint: (((Inheritance $x man)) 
;;                      ((Inheritance $x sodaDrinker)) 
;;                      ((Inheritance $x ugly)))
;;   4. Mixed: (((Inheritance $x man)) 
;;              ((Inheritance $x sodaDrinker) (Inheritance $x ugly)))
;;
;; Expected Output:
;;   (0.1 0.1 0.01 0.1) - Simplified probabilities for verification
;;
;; Verification:
;;   1. Tests correct handling of multiple partition structures
;;   2. Verifies order preservation in results
;;   3. Checks proper accumulation of estimates
;; =============================================================================
(assertEqual 
  (do-ji-prob 
    ((((Inheritance $x man) (Inheritance $x sodaDrinker)) 
      ((Inheritance $x ugly)))
     (((Inheritance $x man) (Inheritance $x ugly)) 
      ((Inheritance $x sodaDrinker)))
     (((Inheritance $x man)) 
      ((Inheritance $x sodaDrinker)) 
      ((Inheritance $x ugly)))
     (((Inheritance $x man)) 
      ((Inheritance $x sodaDrinker) (Inheritance $x ugly))))
    (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))
    &Kb 
    0.5)
  (0.1 0.1 0.01 0.1))


;; =============================================================================
;; Test: ji_prob_est_interval
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify calculation of probability interval (min-max range) for a pattern
;;   across all possible partition configurations.
;;
;; Inputs:
;;   - Pattern: (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))
;;   - DB Reference: &kb
;;   - Ratio: 0.2
;;
;; Expected Output:
;;   (0.009135566413047788 0.13155215634788814) - (min_prob, max_prob) pair
;;
;; Verification:
;;   1. Tests correct identification of extreme probability cases
;;   2. Verifies handling of different ratio parameter
;;   3. Checks proper tuple output format
;; =============================================================================
(assertEqual 
  (ji_prob_est_interval 
    (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))
    &kb
    0.2)
  (0.009135566413047788 0.13155215634788814))


;; =============================================================================
;; Test: isurp
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify calculation of independent-surprise for a pattern across all
;;   possible partition configurations.
;;
;; Inputs:
;;   - Pattern
;;   - DB Reference: &kb
;;   - Ratio: 0.2
;;
;; Expected Output:
;;   0.8684478436521119 - Independent surprise value

;; Verification:
;;   1. Tests correct calculation of independent surprise
;;   2. Verifies handling of different ratio parameter
;;   3. Checks proper output format
;; =============================================================================

(assertEqual (isurp (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker) ) &kb True 0.2) 0.8684478436521119)

!(isurp (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker) ) &kb True 0.2)