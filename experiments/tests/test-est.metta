! (register-module! ../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:rules:est-tv)
! (import! &self experiments:rules:emp-tv)
! (import! &kb experiments:data:ugly_man_sodaDrinker)

! (bind! square (py-atom numpy.square (-> Number Number)))






;; =============================================================================
;; Test: do-ji-tv-est (Joint Independet Probability - Zero Strength Case)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify correct calculation of joint independent probability for a multi-clause pattern
;;   when no matching instances exist in the knowledge base.
;;
;; Inputs:
;;   - Knowledge Base: &kb (assumed to contain inheritance relations)
;;   - Pattern: 
;;       (, (Inheritance $x sodaDrinker) 
;;          (Inheritance $x human) 
;;          (Inheritance $x woman))
;;
;; Expected Output:
;;   ((<original-pattern>) (STV 0 0.010755362007978185))
;;
;; Verification:
;;   1. Pattern Structure: Tests handling of 3-clause conjunction
;;   2. Strength Verification: 0 indicates no matches in &kb
;;   3. Confidence Calculation: Validates low-confidence estimation logic
;;   4. Return Structure: Ensures (pattern, truth-value) tuple format
;;

;; =============================================================================
(assertEqual 
  (do-ji-tv-est &kb 
    (, (Inheritance $x sodaDrinker) 
       (Inheritance $x human) 
       (Inheritance $x woman))) 
  ((, (Inheritance $x sodaDrinker) 
      (Inheritance $x human) 
      (Inheritance $x woman)) 
   (STV 0 0.010755362007978185)))

;; =============================================================================
;; Test: conjunct-pattern (Pattern Construction - Two-Clause Conjunction)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify correct construction of a conjunctive pattern from two inheritance clauses
;;   using the `conjunct-pattern` function.
;;
;; Inputs:
;;   - Knowledge Base: &kb (to store the conjucted pattern; not used for construction)
;;   - Pattern Components: 
;;       (Inheritance $x sodaDrinker)
;;       (Inheritance $x woman)
;;
;; Expected Output:
;;   (, (Inheritance $x sodaDrinker) (Inheritance $x woman))
;;
;; Verification:
;;   1. Pattern Construction: Confirms correct formation of conjunction pattern
;;   2. Structural Integrity: Ensures output is a list of the original clauses
;;   3. Order Preservation: Maintains clause ordering as given in input
;;   4. Unification Readiness: Valid format for further logical operations
;;
;; Key Observations:
;;   - The test checks a pure syntactic transformation without evaluation
;;   - The knowledge base is not actively queried; only passed as context
;;   - Ensures consistent behavior for downstream processing pipelines
;; =============================================================================
(assertEqual 
  (conjunct-pattern 
    ((Inheritance $x sodaDrinker) 
     (Inheritance $x woman)) 
    &kb) 
  (, (Inheritance $x sodaDrinker) 
     (Inheritance $x woman)))
     

;; =============================================================================
;; Test: flatten (Pattern Flattening - Nested Conjunction Case)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Ensure that nested conjunctions are properly flattened into a single-level pattern
;;   using the `flatten` function.
;;
;; Inputs:
;;   - Pattern: 
;;       (, 
;;         (, (Inheritance $x human) 
;;             (Inheritance $x sodaDrinker)) 
;;         (Inheritance $x man))
;;
;; Expected Output:
;;   (, 
;;     (Inheritance $x human) 
;;     (Inheritance $x sodaDrinker) 
;;     (Inheritance $x man))
;;
;; Verification:
;;   1. Nesting Elimination: Confirms proper flattening of nested conjunctions
;;   2. Clause Preservation: All original clauses are retained in the correct order
;;   3. Output Format: Validates resulting flat pattern is usable in reasoning functions
;;   4. Structural Integrity: No loss or duplication of pattern elements
;;
;; Key Observations:
;;   - Nested patterns commonly arise from dynamic pattern generation
;;   - Flattening ensures compatibility with pattern matchers expecting flat lists
;;   - Supports compositional pattern logic in inference engines
;; =============================================================================
(assertEqual 
  (flatten 
    (, 
      (, (Inheritance $x human) 
         (Inheritance $x sodaDrinker)) 
      (Inheritance $x man))) 
  (, 
    (Inheritance $x human) 
    (Inheritance $x sodaDrinker) 
    (Inheritance $x man)))



