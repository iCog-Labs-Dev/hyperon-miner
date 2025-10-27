! (import! &self boost)

;; Mathematical constants
(= (pi) 3.141592653589793)

;; Exponential function using e^x = exp(x*ln(e)) via pow-math
(= (exp $x)
   (pow-math 2.718281828459045 $x))

;; Natural logarithm: ln(x) = log_e(x)
(= (ln $x)
   (log-math 2.718281828459045 $x))

;; Gamma function using Lanczos approximation
(= (gamma-lanczos-coeff 0) 0.99999999999980993)
(= (gamma-lanczos-coeff 1) 676.5203681218851)
(= (gamma-lanczos-coeff 2) -1259.1392167224028)
(= (gamma-lanczos-coeff 3) 771.32342877765313)
(= (gamma-lanczos-coeff 4) -176.61502916214059)
(= (gamma-lanczos-coeff 5) 12.507343278686905)
(= (gamma-lanczos-coeff 6) -0.13857109526572012)
(= (gamma-lanczos-coeff 7) 9.9843695780195716e-6)
(= (gamma-lanczos-coeff 8) 1.5056327351493116e-7)

;; Gamma function with reflection formula for z < 0.5
(= (gamma $z)
   (if (< $z 0.5)
       ;; Reflection formula: Γ(z)Γ(1−z)=π/sin(πz)
       (/ (pi) (* (sin-math (* (pi) $z)) (gamma (- 1 $z))))
       (gamma-lanczos (- $z 1))))

;; Lanczos approximation implementation
(= (gamma-lanczos $z)
   (let $x (gamma-sum $z 1 9)
        (let $t (+ $z 7.5)
             (let $sqrt-term (sqrt-math (* 2 (pi)))
                  (let $pow-term (pow-math $t (+ $z 0.5))
                       (let $exp-term (exp (- 0 $t))
                            (* (* (* $sqrt-term $pow-term) $exp-term) $x)))))))

;; Sum the Lanczos coefficients
(= (gamma-sum $z $i $max)
   (if (>= $i $max)
       (gamma-lanczos-coeff 0)
       (+ (/ (gamma-lanczos-coeff $i) (+ $z $i))
          (gamma-sum $z (+ $i 1) $max))))

;; Beta function: B(a,b) = Γ(a)Γ(b)/Γ(a+b)
(= (beta $a $b)
   (/ (* (gamma $a) (gamma $b))
      (gamma (+ $a $b))))

;; Incomplete beta function using Simpson's rule integration
(= (incomplete-beta $x $a $b)
   (if (<= $x 0.0)
       0.0
       (if (>= $x 1.0)
           (beta $a $b)
           (incomplete-beta-simpson $x $a $b 500))))

;; Simpson's rule integration
(= (incomplete-beta-simpson $x $a $b $steps)
   (let $h (/ $x $steps)
        (let $h-over-3 (/ $h 3)
             (* $h-over-3 (simpson-sum $h $a $b 0 $steps 0)))))

;; Recursive Simpson's sum with accumulator
(= (simpson-sum $h $a $b $i $steps $acc)
   (if (> $i $steps)
       $acc
       (let $t (* $i $h)
            (if (and (> $t 0) (< $t 1))
                (let $y (* (pow-math $t (- $a 1))
                          (pow-math (- 1 $t) (- $b 1)))
                     (let $coeff (simpson-coeff $i $steps)
                          (simpson-sum $h $a $b (+ $i 1) $steps (+ $acc (* $coeff $y)))))
                (simpson-sum $h $a $b (+ $i 1) $steps $acc)))))

;; Simpson's rule coefficients
(= (simpson-coeff $i $steps)
   (if (or (== $i 0) (== $i $steps))
       1
       (if (== (mod $i 2) 1)
           4
           2)))

;; Regularized incomplete beta function: I_x(a,b)
(= (regularized-incomplete-beta $x $a $b)
   (/ (incomplete-beta $x $a $b)
      (beta $a $b)))

;; Helper functions for min/max
(= (min-val $a $b)
   (if (< $a $b) $a $b))

(= (max-val $a $b)
   (if (> $a $b) $a $b))

;; Main CDF function (clamps x to [0,1])
(= (beta-cdf $x $alpha $beta)
   (let $x-clamped (max-val 0 (min-val $x 1))
        (regularized-incomplete-beta $x-clamped $alpha $beta)))

;; Helper: modulo using floor-math
(= (mod $a $b)
   (- $a (* $b (floor-math (/ $a $b)))))

;; Example usage:
;; !(beta-cdf 0.3 2.0 5.0)
;; Expected result: approximately 0.16308

;; Test gamma function:
;; !(gamma 5)  ; Should return 24.0 (4!)
;; !(gamma 1)  ; Should return 1.0

;; Test beta function:
;; !(beta 2 3) ; Should return 0.08333... (1/12)

!(boost-math-cdf 0.3 2.0 5.0).
