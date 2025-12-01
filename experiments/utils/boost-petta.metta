;; ============================================================
;; Beta Distribution CDF Implementation in Pure MeTTa
;; ============================================================


;; create a log funciton with base 'e'
(=(log $x)(
    log-math 2.718281828459045 $x
))

(= (exp-e $x)
    (pow-math 2.718281828459045 $x)
)

;; Helper functions for numerical computation


(= (clamp $x $low $high) (max-of-two $low (min-of-two $x $high)))

;; ============================================================
;; Log-Gamma approximation (Stirling's approximation)
;; ============================================================


(= (lgamma $z)
   (let* (
       ($z_adj (if (<= $z 0) 0.5 $z))
       ($log_z (log $z_adj))
       ($inv_z (/ 1 $z_adj))
       ($inv_z3 (/ 1 (* $z_adj (* $z_adj $z_adj))))
       ($term1 (* (- $z_adj 0.5) $log_z))
       ($term2 (- 0 $z_adj))
       ($term3 (* 0.5 (log (* 2 3.141592653589793))))
       ($term4 (/ 1 (* 12 $z_adj)))
       ($term5 (- 0 (/ 1 (* 360 $inv_z3))))
       ($result (+ $term1 (+ $term2 (+ $term3 (+ $term4 $term5)))))
   )
   $result))

;; ============================================================
;; Log-Beta function: log(B(a,b)) = lgamma(a) + lgamma(b) - lgamma(a+b)
;; ============================================================

(= (log-beta $a $b)
   (- (+ (lgamma $a) (lgamma $b))
      (lgamma (+ $a $b))))

;; ============================================================
;; Continued fraction for incomplete beta (Lentz's method)
;; Recursive implementation with iteration counter
;; ============================================================

(= (betacf-iter $a $b $x $m $am $bm $az $qab $qap $qam)
   (if (> $m 10)
       $az
       (let* (
           ($em $m)
           ($tem (* $em 2))
           ($d1 (/ (* $em (* (- $b $em) $x))
                   (* (+ $qam $tem) (+ $a $tem))))
           ($ap (+ $az (* $d1 $am)))
           ($bp (+ (- 1 (* (* $qab $x) (/ 1 $qap))) (* $d1 $bm)))
           ($d2 (/ (- 0 (* (* (+ $a $em) (+ $qab $em)) $x))
                   (* (+ $qap $tem) (+ $a $tem))))
           ($app (+ $ap (* $d2 $az)))
           ($bpp (+ $bp (* $d2 1)))
           ($am_new (/ $ap $bpp))
           ($bm_new (/ $bp $bpp))
           ($az_new (/ $app $bpp))
           ($converged (< (abs (- $az_new $az)) (* 0.00000000000003 (abs $az_new))))
       )
       (if $converged
           $az_new
           (betacf-iter $a $b $x (+ $m 1) $am_new $bm_new $az_new $qab $qap $qam)))))

(= (betacf $a $b $x)
   (let* (
       ($qab (+ $a $b))
       ($qap (+ $a 1))
       ($qam (- $a 1))
   )
   (betacf-iter $a $b $x 1 1.0 1.0 1.0 $qab $qap $qam)))

;; ============================================================
;; Regularized incomplete beta I_x(a, b)
;; ============================================================
(= (incomplete-beta $a $b $x)
   (if (<= $x 0)
       0.0
       (if (>= $x 1)
           1.0
           (let* (
               ($_ (println! ("Calculating incomplete-beta with a=" $a ", b=" $b ", x=" $x)))
               ($log_x (log $x))
               ($log_1mx (log (- 1 $x)))
               ($log-betta (log-beta $a $b))
               ($log_bt (- (+ (* $a $log_x) (* $b $log_1mx))
                           $log-betta))
               ($bt (exp-e $log_bt))
               ($threshold (/ (+ $a 1) (+ $a (+ $b 2))))
               ($use_direct (< $x $threshold))
               ($_ (println! ("use_direct =" $use_direct)))
           )
           (if $use_direct
               (/ (* $bt (betacf $a $b $x)) $a)
               (- 1 (/ (* $bt (betacf $b $a (- 1 $x))) $b))))
          )
     )
)

;; ============================================================
;; Beta CDF: main function
;; ============================================================

(= (beta-cdf $x $alpha $beta)
   (let* (
       ($x_clamped (clamp $x 0.0 1.0))
   )
   (incomplete-beta $alpha $beta $x_clamped)))

;; ============================================================
;; Main exported function (compatible with original interface)
;; ============================================================

(= (boost-math-cdf $alpha $beta $x)
   (beta-cdf $x $alpha $beta))

;; ============================================================
;; Example usage:
;; !(boost-math-cdf 2.0 5.0 0.3)
;; !(beta-cdf 0.5 2.0 2.0)
;; ============================================================


