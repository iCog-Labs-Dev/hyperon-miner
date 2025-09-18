! (register-module! ../../../../hyperon-miner/experiments)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:emp-prob)
! (import! &self experiments:truth-values:emp-tv)
! (import! &db experiments:data:ugly_man_sodaDrinker)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:customType)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:truth-values:est-tv)





;; =============================================================================
;; Test: ji-est-tv
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify estimation of TruthValues for joint-inference patterns across
;;   multiple partition configurations.
;;
;; Inputs:
;;   - DB Reference: &db
;;   - Total Count: 60
;;   - Pattern: (, (Inheritance $x ugly) 
;;                  (Inheritance $x man) 
;;                  (Inheritance $x sodaDrinker))
;;   - Partitions:
;;       1. (((Inheritance $x man)) 
;;           ((Inheritance $x sodaDrinker) (Inheritance $x ugly)))
;;       2. (((Inheritance $x man) (Inheritance $x ugly)) 
;;           ((Inheritance $x sodaDrinker)))
;;       3. (((Inheritance $x man) (Inheritance $x sodaDrinker)) 
;;           ((Inheritance $x ugly)))
;;       4. (((Inheritance $x man)) 
;;           ((Inheritance $x sodaDrinker)) 
;;           ((Inheritance $x ugly)))
;;
;; Expected Output:
;;   ((STV 0.0 0.0001979229795046239) 
;;    (STV 0.0 0.0001979229795046239) 
;;    (STV 0.0 0.0001979229795046239) 
;;    (STV 4.6296296296296274e-5 0.0006976744186046506))
;;
;; Verification:
;;   1. Confirms per-partition TruthValue estimation
;;   2. Validates stability of small probability values
;;   3. Ensures correct mapping from partitions to output list
;; =============================================================================
(assertEqual (ji-est-tv &db 60 (,(Inheritance $x ugly) (Inheritance $x man) (Inheritance $x sodaDrinker)) 
   (
     (((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly))) 
     (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) 
     (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) 
     (((Inheritance $x man)) ((Inheritance $x sodaDrinker)) ((Inheritance $x ugly)))
   )) 
 ((STV 0.0 0.0001979229795046239) 
  (STV 0.0 0.0001979229795046239) 
  (STV 0.0 0.0001979229795046239) 
  (STV 4.6296296296296274e-5 0.0006976744186046506)))


;; =============================================================================
;; Test: pro_prob_without_joint
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify calculation of projected probabilities for partitions without
;;   explicit joint variable handling.
;;
;; Inputs:
;;   - DB Reference: &db
;;   - Partition: (((Inheritance $x man)) 
;;                 ((Inheritance $x sodaDrinker) (Inheritance $x ugly)))
;;
;; Expected Output:
;;   (0 0.001979229795046239)
;;
;; Verification:
;;   1. Confirms proper exclusion of joint variable estimation
;;   2. Verifies output in tuple format (min, max probability)
;;   3. Validates magnitude consistency with joint-inclusive cases
;; =============================================================================
(assertEqual 
 (pro_prob_without_joint &db (((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly))))
 (0 0.001979229795046239))


;; =============================================================================
;; Test: joint-variables
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify extraction of shared variables among a pattern and partition
;;   configuration.
;;
;; Inputs:
;;   - Pattern: (, (Inheritance $x ugly) 
;;                  (Inheritance $x man) 
;;                  (Inheritance $x sodaDrinker))
;;   - Partition: (((Inheritance $x man)) 
;;                 ((Inheritance $x sodaDrinker) (Inheritance $x ugly)))
;;
;; Expected Output:
;;   ($x)
;;
;; Verification:
;;   1. Confirms correct identification of common variable `$x`
;;   2. Verifies minimal variable extraction for shared sub-clauses
;;   3. Ensures proper output format (variable list)
;; =============================================================================
(assertEqual 
   (joint-variables (,(Inheritance $x ugly) (Inheritance $x man) (Inheritance $x sodaDrinker)) 
                    (((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly))))
   ($x))


;; =============================================================================
;; Test: prob-with-joint
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify probability calculation with explicit joint variable inclusion.
;;
;; Inputs:
;;   - DB Reference: &db
;;   - Total Count: 60
;;   - Partition: (((Inheritance $x man)) 
;;                 ((Inheritance $x sodaDrinker) (Inheritance $x ugly)))
;;   - Joint Variable: ($x)
;;   - Ratio: 1
;;
;; Expected Output:
;;    0.016666666666666666
;;
;; Verification:
;;   1. Confirms handling of explicit joint variable `$x`
;;   2. Validates consistent probability estimation with ratio scaling
;;   3. Checks compatibility with corresponding `pro_prob_without_joint` case
;; =============================================================================
!(assertEqual (prob-with-joint &db 60 (((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly))) ($x) 1) 0.016666666666666666)



