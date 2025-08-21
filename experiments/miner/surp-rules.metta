;; Rules 
-----------------------------------------------------------------
;; Rule to check if a pattern meets the minimum support threshold.
(: minsupport 
    (-> (hasSupport $ptrn $cnt)
          (-> (ms-threshold $ms)
                 (-> (⍃ $ms $cnt)
                        (minsup $ptrn)))))




------------------------------------------------------------
;; Rule to calculate the empirical truth value of a pattern.
;;(: emp-rule 
;;         (-> (minsup $ptrn) 
;;               (-> (db-ref $db) 
;;                      (-> (emp-cpu $ptrn $db $emp) 
;;                               (emp-val $ptrn (emp-tv (flatten $ptrn) $db))))))

;; Rule to calculate the empirical truth value of a pattern.
-----------------------------------------------------------------------
;; The change made was that the emp-tv function, which was 
;; previously placed in the conclusion, was interrupting the chainer.
;; So, it was moved to emp-cpu, which serves as a system-proof.
-----------------------------------------------------------------------
(: emp-rule 
       (-> (minsup $ptrn) 
              (-> (emp-cpu $ptrn $emp ) 
                      (emp-val $ptrn $emp))))




;; Rule to calculate the probability (or truth value) estimate of a
;; pattern, given the empirical probabilities (truth values) of its
;; components.
----------------------------------------------------------------------
;;For now, the emp result is not used by est-tv because it represents 
;;the pattern emp-tv , not its components. The component-wise emp-tv is 
;;calculated within the est-tv function
---------------------------------------------------------------------
(: est-rule 
    (-> (minsup $ptrn)
        (->  (emp-val $ptrn $emp)
                (->(est-cpu $ptrn $emp $est)
                      (est-tv $ptrn $est)))))
                      

----------------------------------------------------------------------
;; Rule to calculate the Jensen-Shannon Distance between the empirical
;; truth value and the truth value estimate of a pattern according to
;; some db.
(: jsd-tv 
            (-> (minsup $ptrn)
                 (-> (emp-val $ptrn $emp)
                       (-> (est-tv $ptrn $est)
                              (jsdsurp $ptrn (do-jsd $emp $est))))))




--------------------------------------------------------------------
;; computes the total number of possible combinations 
(: universal-count 
 (-> (minsup $pattern)
     (-> (db-size $db-size) 
        (-> (universal-cpu $pattern $db-size $ucount)
               (universal-count-of $pattern $ucount)))))  


----------------------------------------------------------------------
;; Rule to calculate the empirical probability of a pattern.
(: emp-prob-rule 
      (-> (prob-cpu $pattern $ucount $prob)
                             (empProb $pattern $ucount $prob)))


------------------------------------------------------------------------
;;  generate partitions for a pattern.          
(: partitions 
         (-> (partition-cpu $pattern $partitions)
                  (partitions $pattern $partitions)))


------------------------------------------------------------------------
;; Rule to estimate the probability interval for a pattern.(isurp-old)
(: est-prob-rule 
          (-> (surp-mode isurp-old)
            (-> (partitions $pattern $partitions)
                  (-> (est-prob-cpu  $pattern $partitions $ucount $emin-emax)
                           (est-prob $pattern $ucount $emin-emax))))) 



------------------------------------------------------------------------
;; Rule to estimate the probability interval for a pattern.(isurp)
(: est-prob-rule 
          (-> (surp-mode isurp)
              (-> (partitions $pattern $partitions)
                  (-> (db-ratio $db-ratio) 
                        (-> (ji-prob-est-cpu $pattern $partitions $db-ratio $emin-emax)
                              (est-prob $pattern  $emin-emax))))))
        
                           
------------------------------------------------------------------------
;; Rule to calculate the distance from the empirical probability to the estimated interval (upper bound).
(: dst-from-interval 
    (-> (⍄ $emp $emax) 
         (-> (dst-cpu $emp $emax $dst)
               (dst $pattern $emp ($emin $emax) $dst))))


-----------------------------------------------------------------------
;; Rule to calculate the distance from the empirical probability to the estimated interval (lower bound).
(: dst-from-interval 
       (-> (⍄ $emin $emp) 
          (-> (dst-cpu $emin $emp $dst)
              (dst $pattern $emp ($emin $emax) $dst))))




------------------------------------------------------------------------
;; Rule to calculate the old surprisingness value (normalized True).
(: isurp 
   (-> (normalized True) 
      (-> (universal-count-of $pattern $count)
         (-> (empProb $pattern $count $emp)
              (-> (est-prob $pattern $count ($emin $emax)) 
                  (-> (dst $pattern $emp ($emin $emax) $dst)
                     (-> (maximum $emp $emax $max)
                             (-> (divide $dst $max $normalized) 
                                 (-> (minimum $normalized 1.0 $minimum)
                                      (isurp $pattern $minimum ))))))))))




---------------------------------------------------------------------
;; Rule to calculate the old surprisingness value (normalized False).
(: isurp 
   (-> (normalized False) 
               (-> (dst $pattern $dst)
                     (-> (minimum $dst 1.0 $minimum )
                              (isurp $pattern $minimum )))))
                                                  