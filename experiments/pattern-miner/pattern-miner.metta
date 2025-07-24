
! (bind! &dbspace (new-space))
! (bind! &specspace (new-space))
! (bind! &cndpspace (new-space))
! (bind! &aptrnspace (new-space))
! (bind! &conjspace (new-space))


--------------------------------------------------
;; do-surp 
--------------------------------------------------
;; computes the isurp or isurp-old surprissingness scoring 
;; algorithms for patterns which  already have not score 
;(: do-surp (-> space space Atom Atom Atom Atom))
(= (do-surp $kb $db $surp-mode (supportOf $pattern $support) $normalization ) 
         (case (match $kb  (surprisingnessOf $pattern $surp_val) $pattern)
              ( ($pattern  ())
                 (Empty  (add-atom-nodup $kb  (surprisingnessOf $pattern ($surp-mode $pattern $db $normalization)) ))))
)

---------------------------------------------------
;; call-surprisingness
---------------------------------------------------
;;function to call the surprisingness algorithms based 
;; on the input surp mode.
;(: call-surprisingness (-> space space Atom pattern Atom))
(= (call-surprisingness $kb $db $surp-mode $pattern)
  (case $surp-mode (
     (none (add-atom-nodup $kb $pattern))
     (nisurp-old  (do-surp $kb $db isurp-old $pattern True))
     (isurp-old  (do-surp $kb $db isurp-old  $pattern False))
     ($_  ())
  )))


--------------------------------------------------------------
;; pattern-miner 
--------------------------------------------------------------
;; the main pattern mining pipeline for the functional approach 
;(: pattern-miner (-> $space space Number Number Atom Atom))
(= (pattern-miner $kb $db $minsup $depth $surp-mode) ( 
    let*
    (    (() (println! "==== Pattern Miner Started ====="))
         ($dummy (collapse (let ($link $x $y) (get-atoms $db) (add-atom &dbspace ($link $x $y))) ))
         ($frequent-pattern  (frequency-pattern-miner  &dbspace &specspace &cndpspace &aptrnspace &conjspace $minsup $depth))
         ($dummy3  (call-surprisingness $kb &dbspace $surp-mode $frequent-pattern))
          )  ()))



