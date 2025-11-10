
! (import! &self ../../utils/common-utils)
! (import! &self  ../../utils/binomialMetta)
! (import! &self  ../../utils/constants)
! (import! &self  ../../utils/TruthValue)
! (import! &self  ../../utils/surp-utils)
! (import! &self  ../../utils/partition-metta )
;! (import! &self  ../../utils/customType)
! (import! &self ../../truth-values/est-tv)
! (import! &self ../isurp-old)

! (import! &self ../../data/ugly_man_sodaDrinker)
;  ! (import! &dbc experiments:data:nested_coupled:mock_coupled)
;  ! (import! &dbn experiments:data:nested_coupled:true_nested)






;;;;;;;;;;;
;; Tests ;;
;;;;;;;;;;;
; !(assertEqual (isurp-old (, $x $y) (get-space)  False) 1)


; (assertEqual (isurp-old (, (Inheritance $x man) (Inheritance $x ugly)
;    (Inheritance $x sodaDrinker)) &db False) 0.00014607068574401343)


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
; (assertEqual (isurp-old (, (Inheritance $x man)
;    (Inheritance $x ugly)
;    (Inheritance $x sodaDrinker)) &db True) 0.999707773232028)


; ;test with coupled patterns
; (assertEqual (isurp-old (, (Inheritance (Person $x) man)
;    (Inheritance (Person $x) ugly)
;    (Inheritance (Person $x) sodaDrinker)) &dbc True) 0.999707773232028)




; ;nested patterns test
; (assertEqual (isurp-old (, (Inheritance (And (And (Person $x) man) (Or human sodaDrinker)) (Or (And human man) (And human sodaDrinker)))

; (Inheritance (And (And (Person $x)   man) (Or human sodaDrinker)) (Or (And human man) (And human ugly)))

; (Inheritance (And (And human man)   (Or (Person $x) (Person Mike)))   (Or (And human man)   (And human sodaDrinker)))

; (Inheritance (And (And (Person $x) man) (Or human ugly))        (Or (And human man) (And human sodaDrinker)))) &dbn True) 0.9996837944664032)




!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &db (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))

!(db_size &db)



;!(isurp-old-petta (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &db True)