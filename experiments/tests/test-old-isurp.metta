! (register-module! ../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:binomialMetta)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:rules:est-tv)
! (import! &self experiments:rules:isurp-old)
! (import! &db experiments:data:ugly_man_sodaDrinker)







;;;;;;;;;;;
;; Tests ;;
;;;;;;;;;;;
;; Test old normalized I-Surprisingess for the ugly male soda drinker
;; =============================================================================
;; Test: isurp-old (Independent Surprisingness - Multi-Clause Pattern)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Evaluate the independent surprisingness of a conjunctive inheritance pattern
;;   using the `isurp-old` function, which estimates how unexpected the combination
;;   of facts is, given their individual probabilities.
;;
;; Inputs:
;;   - Pattern: 
;;       (, 
;;         (Inheritance $x man) 
;;         (Inheritance $x sodaDrinker) 
;;         (Inheritance $x ugly))
;;   - Knowledge Base: &db
;;   - Truth Assumption: True (computing surprisingness of asserted pattern)
;;
;; Expected Output:
;;   0.6775956284153006
;;
;; Verification:
;;   1. Surprisingness Metric: Tests how unexpected the full pattern is if clauses were independent
;;   2. Independence Assumption: ISURP assumes each clause is probabilistically independent
;;   3. Interpretation: Lower values → expected combinations; higher values → surprising
;;   4. Numerical Precision: Verifies floating point output accuracy
;;
;; Key Observations:
;;   - The surprisingness reflects deviation from what would be expected if the facts were independent
;;   - Useful for identifying novel or counterintuitive patterns in &db
;;   - A value < 1 suggests moderate-to-low surprisingness of this particular conjunction
;; =============================================================================
(assertEqual 
   (isurp-old 
     (, 
       (Inheritance $x man) 
       (Inheritance $x sodaDrinker) 
       (Inheritance $x ugly)) 
     &db 
     True) 
   0.6775956284153006)

!(assertEqual 
    (isurp-old  
        (,
            (Inheritance $x man) 
            (Inheritance $x ugly)) 
        &db  
        True) 
    0.5081967213114754)


