
! (register-module! ../../../../hyperon-miner/experiments)

! (import! &self experiments:utils:emp-tv-bs)
! (import! &self experiments:utils:bs-utils)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:customType)
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:truth-values:emp-tv)
! (import! &db experiments:data:ugly_man_sodaDrinker)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)



! (add-reduct &self (= (get-space) (new-space)))
! (add-reducts (get-space) (collapse (get-atoms &db))) 

;; Documentation:


;; =============================================================================
;; Test Suite: Knowledge Base Operations
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify core operations on knowledge bases including:
;;   - Support counting
;;   - Truth value calculations
;;   - Database manipulation
;;   - Statistical operations
;; =============================================================================

;; =============================================================================
;; Test: Basic Pattern Support
;; -----------------------------------------------------------------------------
;; Verifies counting of matching patterns in the knowledge base
;; Expected: 60 instances of (Inheritance $x $y)
;; =============================================================================
!(assertEqual (sup (Inheritance $x $y) (get-space)) 60)



;; =============================================================================
;; Test: Universe Counting
;; -----------------------------------------------------------------------------
;; Verifies counting of all Inheritance relationships regardless of arguments
;; Expected: 60 total Inheritance relations
;; =============================================================================
!(assertEqual (universe-count (Inheritance $x) (get-space)) 60)

;; =============================================================================
;; Test: Empirical Truth Value Calculation
;; -----------------------------------------------------------------------------
;; Verifies truth value calculation for specific pattern
;; Expected: (EMPTV 0.125 0.08888888888888889)
;;   - Strength: 12.5% 
;;   - Confidence: ~8.89%
;; =============================================================================
!(assertEqual (emp-tv (, (Inheritance $x woman) (Inheritance $x sodaDrinker)) (get-space)) 
              (EMPTV 0.001388888888888889 0.08181818181818183))

;; =============================================================================
;; Test: Database Expansion
;; -----------------------------------------------------------------------------
;; Verifies database size after duplication and expansion
;; Expected: Original size + 1
;; =============================================================================
!(assertEqual (db_size (duplicate-and-expand-space (get-space) 1)) 
              (+ 1 (db_size (get-space))))


;; =============================================================================
;; Test: Bounded Database Copy (Case 1)
;; -----------------------------------------------------------------------------
;; Verifies copying with size limit when original < max size
;; Setup: Original size = 60, max = 70
;; Expected: New size = 60 (all atoms copied)
;; =============================================================================
!(assertEqual (let $x (collapse (get-atoms (get-space))) (db_size (copy-db-by-size (new-space) $x 0 70))) 
              60)



;; =============================================================================
;; Test: Bounded Database Copy (Case 2) 
;; -----------------------------------------------------------------------------
;; Verifies copying with size limit when original > max size
;; Setup: Original size = 60, max = 6  
;; Expected: New size = 6 (only 6 atoms copied)
;; =============================================================================
!(assertEqual (let $x (collapse (get-atoms (get-space))) (db_size (copy-db-by-size (new-space) $x 0 6))) 
              6)

;; =============================================================================
;; Test: Iterative Truth Value Calculation
;; -----------------------------------------------------------------------------
;; Verifies truth value calculation with iterations
;; Expected: (EMPTV 0 0.0001249843769528809)
;;   - Strength: ~0%
;;   - Confidence: ~0.0125%
;; =============================================================================
!(assertEqual (do_emp_tv (,(Inheritance $x ugly) (Inheritance $x woman)) (get-space) 0.02)
               (EMPTV 0 0.0001249843769528809))