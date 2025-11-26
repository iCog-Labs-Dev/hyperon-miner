!(import! &self ../../utils/common-utils)
!(import! &self  ../../utils/binomialMetta)
!(import! &self  ../../utils/constants)
!(import! &self  ../../utils/TruthValue)
!(import! &self  ../../utils/surp-utils)
!(import! &self  ../../utils/partition-metta )
;! (import! &self  ../../utils/customType)
!(import! &self ../../truth-values/est-tv)
!(import! &self ../isurp-old)






;;;;;;;;;;;
;; Tests ;;
;;;;;;;;;;;

!(import! &self ../../data/ugly_man_sodaDrinker)
!(migrateAtoms &self &db  (Inheritance $x $y))


;; =============================================================================
;; Test: isurp-old with out normalization
;; -----------------------------------------------------------------------------

!(test (isurp-old (, (Inheritance $x man) (Inheritance $x ugly)
   (Inheritance $x sodaDrinker)) &db False) 0.00014607068574401354)


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
!(test (isurp-old (, (Inheritance $x man)
   (Inheritance $x ugly)
   (Inheritance $x sodaDrinker)) &db True) 0.999707773232028)



;; =================================
;;  Test with coupled patterns
;; =================================
;; import coupled atoms
!(import! &self ../../data/nested_coupled/mock_coupled)
!(migrateAtoms &self &dbc  (Inheritance $x $y))

!(test (isurp-old (, (Inheritance (Person $x) man)
   (Inheritance (Person $x) ugly)
   (Inheritance (Person $x) sodaDrinker)) &dbc True) 0.999707773232028)



;; =====================
;; Nested patterns
;; =====================
;; import nested atoms
!(import! &self ../../data/nested_coupled/true_nested)
!(migrateAtoms &self &dbn  (Inheritance $x $y))
!(test (isurp-old (, (Inheritance (And (And (Person $x) man) (Or human sodaDrinker)) (Or (And human man) (And human sodaDrinker)))
                           (Inheritance (And (And (Person $x)   man) (Or human sodaDrinker)) (Or (And human man) (And human ugly)))
                           (Inheritance (And (And human man)   (Or (Person $x) (Person Mike)))   (Or (And human man)   (And human sodaDrinker)))
                            (Inheritance (And (And (Person $x) man) (Or human ugly))        (Or (And human man) (And human sodaDrinker)))) &dbn True)
                             0.9996837944664032)




