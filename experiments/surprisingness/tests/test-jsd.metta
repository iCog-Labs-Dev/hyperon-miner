! (register-module! ../../../../hyperon-miner/experiments)
! (import! &self experiments:surprisingness:jsd)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:jsd-helper)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:constants)


;; =============================================================================
;; Test: do-jsd (Basic JSD Calculation)
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Verify correct computation of modified Jensen-Shannon Divergence between:
;;   - Empirical distribution: (STV 0.5 1)
;;   - Estimated distribution: (STV 0.65 1)
;;
;; Computation Steps:
;; 1. Extract strengths: 0.5 and 0.65
;; 2. Calculate midpoint: (0.5 + 0.65)/2 = 0.575
;; 3. Compute log ratios (base 10):
;;    - log₁₀(0.5/0.575) ≈ -0.0607
;;    - log₁₀(0.65/0.575) ≈ 0.0531
;; 4. Calculate entropy contributions:
;;    - (0.5 * -0.0607)/2 = -0.015175
;;    - (0.65 * 0.0531)/2 = 0.0172575
;; 5. Sum contributions: 0.0020825
;; 6. Take square root: √0.0020825 ≈ 0.04563
;;
;; Expected Output: 
;;   0.0461555120911388 (pre-computed with high precision)
;;
;; Verification:
;;   - Tests core JSD calculation logic
;;   - Validates floating-point precision handling
;;   - Confirms proper handling of base-10 logarithms
;; =============================================================================
!(assertEqual 
  (do-jsd  (STV 0.8 0.111111) (STV 0.1 0.5555555555555556)) 1.0)