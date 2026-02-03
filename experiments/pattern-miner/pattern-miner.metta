



;--------------------------------------------------
;; do-jsd-surp 
;--------------------------------------------------
;; computes the est-tv and emp-tv of pattern first
(= (do-jsd-surp $kb $db (supportOf $pattern $support))(
   case (match $kb  (surprisingnessOf $pattern $surp_val) $pattern)
( ($pattern ())
  (Empty ( let* (
     ($val (collapse (superpose ((emp-tv $pattern $db) (do-ji-tv-est $db $pattern))) ) )
     (((EMPTV $strength $confidence) (STV $str $conf)) $val)
     ($jsd (do-jsd (EMPTV $strength $confidence) (STV $str $conf))))
     (add-atom-nodup $kb   (surprisingnessOf $pattern $jsd))
     ))))
)

(= (do-IIsurp $kb $db (supportOf $pattern $support) $conc_db)(
   case (match $kb  (surprisingnessOf $pattern $surp_val) $pattern)
( ($pattern ())
  (Empty ( let* (
     
     ($surp (IIsurp-old $pattern $db False $conc_db))
     
     )
     (add-atom-nodup $kb   (surprisingnessOf $pattern $surp))
     ))))
)





;--------------------------------------------------
;; do-surp 
;--------------------------------------------------
;; computes the isurp or isurp-old surprissingness scoring 
;; algorithms for patterns which  already have not score 
;(: do-surp (-> space space Atom Atom Atom Atom))
(= (do-surp $kb $db $surp-mode (supportOf $pattern $support) $normalization $db-ratio) 
         (case (match $kb  (surprisingnessOf $pattern $surp_val) $pattern)
              ( ($pattern  ())
                 (Empty   (let $surp  (case $surp-mode (
                                           (isurp  (isurp $pattern $db $normalization $db-ratio))
                                           (isurp-old (isurp-old $pattern $db $normalization)) ))
                            (add-atom-nodup $kb  (surprisingnessOf $pattern $surp) )))))
)




;---------------------------------------------------
;; call-surprisingness
;---------------------------------------------------
;;function to call the surprisingness algorithms based 
;; on the input surp mode.
;(: call-surprisingness (-> space space Atom pattern Atom))

; 

(= (call-surprisingness $kb $db $pattern $surp-mode $normalization $db-ratio $conc_db)
  (if (== $surp-mode none)
         (add-atom $kb $pattern)
      (if (== $surp-mode jsd)
           (do-jsd-surp $kb $db $pattern)
            
            ( if (== $surp-mode IIsurp)
               (let   (collapse (let $el (superpose $conc_db) (add-atom &conceptSpace $el))) (do-IIsurp $kb $db $pattern &conceptSpace ))

               (do-surp $kb $db $surp-mode $pattern $normalization $db-ratio))
      )
   )
)






;--------------------------------------------------------------
;; pattern-miner 
;--------------------------------------------------------------
;; the main pattern mining pipeline for the functional approach 
;(: pattern-miner (-> $space space Number Number Atom Atom))



(= (pattern-miner $kb $db $minsup $depth $surp-mode $normalization $db-ratio $conj_exp ) ( 
    let*
    (    (true (println! "==== Pattern Miner Started ====="))
         ($dummy (collapse (let ($link $x $y) (get-atoms $db) (add-atom &dbspace ($link $x $y))) ))

         
 
         ($frequent-pattern  (frequency-pattern-miner &dbspace &specspace &cndpspace &aptrnspace &conjspace $minsup $depth $conj_exp))

          ($rel-rets (inititate-IIsurp-miner &dbspace &conceptSpace_mid) )

        

         ($dummy3  (call-surprisingness $kb &dbspace $frequent-pattern $surp-mode $normalization $db-ratio $rel-rets ))
          )  ()))