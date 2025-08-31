! (register-module! ../../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:binomialMetta)
! (import! &self experiments:utils:beta-dist)

! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:customType)
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:surprisingness:isurp-old)

 ! (import! &db experiments:data:ugly_man_sodaDrinker)
 ; ! (import! &db experiments:data:mock_coupled)
;  ! (import! &db experiments:data:true_nested)





! (add-reduct &self (= (get-space) (new-space)))

! (add-atom (get-space) (Inheritance A B))
! (add-atom (get-space) (Inheritance B C))
! (add-atom (get-space) (Inheritance D E))
! (add-atom (get-space) (Inheritance E F))


;; =============================================================================
;; Test: isurp-old (Empty / Trivial Partition)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify that `isurp-old` correctly handles empty or trivial partitions
;;   where no meaningful independent surprise can be derived.
;;
;; Inputs:
;;   - Pattern: (, $x $y)
;;   - DB Reference: (get-space)
;;   - Total Count Flag: False
;;
;; Expected Output:
;;   1
;;

;; =============================================================================
!(assertEqual (isurp-old (, $x $y) (get-space) False) 1)


;; =============================================================================
;; Test: isurp-old whitout normalization
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify `isurp-old` produces a very small independent-surprise value when
;;   the given pattern has low likelihood in the database.
;;
;; Inputs:
;;   - Pattern: (, (Inheritance $x man)
;;                  (Inheritance $x ugly)
;;                  (Inheritance $x sodaDrinker))
;;   - DB Reference: &db
;;   - Total Count Flag: False
;;
;; Expected Output:
;;   0.00014607068574401343
;;

;; =============================================================================
!(assertEqual (isurp-old (, (Inheritance $x man)
   (Inheritance $x ugly)
   (Inheritance $x sodaDrinker)) &db False) 0.00014607068574401343)


;; =============================================================================
;; Test: isurp-old with normalization
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify `isurp-old` produces a near-1 independent-surprise value when
;;   the given pattern is highly likely in the database.
;;
;; Inputs:
;;   - Pattern: (, (Inheritance $x man)
;;                  (Inheritance $x ugly)
;;                  (Inheritance $x sodaDrinker))
;;   - DB Reference: &db
;;   - Total Count Flag: True
;;
;; Expected Output:
;;   0.999707773232028
;;
;; =============================================================================
!(assertEqual (isurp-old (, (Inheritance $x man)
   (Inheritance $x ugly)
   (Inheritance $x sodaDrinker)) &db True) 0.999707773232028)





