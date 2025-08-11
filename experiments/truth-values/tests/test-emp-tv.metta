
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
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:truth-values:emp-tv)
! (import! &kb experiments:data:ugly_man_sodaDrinker)



! (add-reduct &self (= (get-space) (new-space)))
! (add-atom (get-space) (Inheritance Abe human))
! (add-atom (get-space) (Inheritance Rio human))
! (add-atom (get-space) (Inheritance Bob human))
! (add-atom (get-space) (Inheritance Mike human))
! (add-atom (get-space) (Inheritance Mike Nil))
! (add-atom (get-space) (Inheritance Zac human))
! (add-atom (get-space) (Inheritance Zac human))
! (add-atom (get-space) (Parent Abe Nil ))



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
;; Expected: 7 instances of (Inheritance $x $y)
;; =============================================================================
!(assertEqual (sup (Inheritance $x $y) (get-space)) 7)

;; =============================================================================
;; Test: Universe Counting
;; -----------------------------------------------------------------------------
;; Verifies counting of all Inheritance relationships regardless of arguments
;; Expected: 8 total Inheritance relations
;; =============================================================================
!(assertEqual (universe-count (Inheritance $x) (get-space)) 8)

;; =============================================================================
;; Test: Empirical Truth Value Calculation
;; -----------------------------------------------------------------------------
;; Verifies truth value calculation for specific pattern
;; Expected: (EMPTV 0.125 0.08888888888888889)
;;   - Strength: 12.5% 
;;   - Confidence: ~8.89%
;; =============================================================================
!(assertEqual (emp-tv (Inheritance Zac $x) (get-space)) 
              (EMPTV 0.125 0.08888888888888889))

;; =============================================================================
;; Test: Database Expansion
;; -----------------------------------------------------------------------------
;; Verifies database size after duplication and expansion
;; Expected: Original size + 1
;; =============================================================================
!(assertEqual (db_size (duplicate-and-expand-space (get-space) 1)) 
              (+ 1 (db_size (get-space))))

;; =============================================================================
;; Test: Atom Addition
;; -----------------------------------------------------------------------------
;; Verifies atom insertion and size tracking
;; Expected: Total size becomes 12 after adding 4 atoms
;; =============================================================================
!(add_n_atoms_to_db (get-space) 4)
!(assertEqual (db_size (get-space)) 12)

;; =============================================================================
;; Test: Bounded Database Copy (Case 1)
;; -----------------------------------------------------------------------------
;; Verifies copying with size limit when original < max size
;; Setup: Original size = 8, max = 10
;; Expected: New size = 10 (all atoms copied)
;; =============================================================================
!(assertEqual (db_size (copy-db-by-size (new-space) 
                       (collapse (get-atoms (get-space))) 0 10)) 
              10)

;; =============================================================================
;; Test: Bounded Database Copy (Case 2) 
;; -----------------------------------------------------------------------------
;; Verifies copying with size limit when original > max size
;; Setup: Original size = 8, max = 6  
;; Expected: New size = 6 (only 6 atoms copied)
;; =============================================================================
!(assertEqual (db_size (copy-db-by-size (new-space)
                       (collapse (get-atoms (get-space))) 0 6)) 
              6)

;; =============================================================================
;; Test: Iterative Truth Value Calculation
;; -----------------------------------------------------------------------------
;; Verifies truth value calculation with iterations
;; Expected: (EMPTV 0.0833 0.0923)
;;   - Strength: ~8.33%
;;   - Confidence: ~9.23%
;; =============================================================================
!(assertEqual (do_emp_tv (Inheritance $x Nil) (get-space) 1)
               (EMPTV 0.08999691262735415 0.0470518165574747))

;; =============================================================================
;; Test: List Element Access
;; -----------------------------------------------------------------------------
;; Verifies zero-based indexing of knowledge base elements  
;; Expected: Third element is (Inheritance Bob human)
;; =============================================================================
!(assertEqual (get-element 2 ((Inheritance Abe human) 
                             (Inheritance Rio human)
                             (Inheritance Bob human)
                             (Inheritance Mike human)
                             (Inheritance Mike Nil)
                             (Inheritance Zac human)
                             (Inheritance Zac human)
                             (Parent Abe Nil)))
              (Inheritance Bob human))

;; =============================================================================
;; Test: Sample Size Calculation
;; -----------------------------------------------------------------------------
;; Verifies statistical sample size calculation
;; Expected: numpy.power(44.444, 1) 
;; Note: Uses Python numpy integration
;; =============================================================================
!(assertEqual (subsmp-size (Inheritance Abe human) 20 0.9)
              ((py-atom numpy.power) 44.44444444444445 1))

;; =============================================================================
;; Test: Bootstrapped Truth Value
;; -----------------------------------------------------------------------------
;; Verifies truth value with bootstrap sampling
;; Expected: (EMPTV 0.2428 0.04109)
;;   - Strength: ~24.28%
;;   - Confidence: ~4.11%
;; =============================================================================
!(assertEqual (emp-tv-bs (Inheritance Zac $x) (get-space) 8 0.6 0.9)
              (EMPTV 0.2428095704426711 0.04109232092138521))

;; =============================================================================
;; Test: Simple Truth Value Construction  
;; -----------------------------------------------------------------------------
;; Verifies EMPTV struct creation from raw values
;; Expected: (EMPTV 0 0.00012498)
;; =============================================================================
!(assertEqual (mk-stv 1.7689693569125715 1.0178393379503528)
              (EMPTV 0 0.0001249843769528809))




