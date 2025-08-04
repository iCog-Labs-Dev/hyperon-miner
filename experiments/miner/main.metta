;;;;;;;;;;;;;;;;;
;; Basic steps ;;
;;;;;;;;;;;;;;;;;

;: - Initialize Miner – Create a function to initialize the frequent pattern miner.
;: - Mine Patterns – Extract patterns that meet the minsup threshold.
;: - Launch Backward Chainer – Use the mined patterns and the surprisingness rule in the backward chainer.
;: - Calculate Surprisingness – The rule triggers do-isurp to compute the surprisingness value for patterns that satisfy it.
;: - Sort & Return – Return patterns sorted by their surprisingness value.



;; Type definition for -> to prevent early reduction
;; of the conclusions before matching the correct premises.
(: -> (-> Atom Atom Type))

;;create working space for db and kbs
!(bind! &freq-kb (new-space)) 
!(bind! &db (new-space)) 
!(bind! &surp-kb  (new-space)) 
!(bind! &res (new-space))



-----------------------------------------------------------------------------
;; clean-atomspace
----------------------------------------------------------------------------
;; Clean AtomSpaces from unnecessary atoms for the operation, which might occur on importing.
(= (clean-atomspaces $dbspace $freq-kb $surp-kb) (
    superpose (
            (println! "==== Cleaning AtomSpaces =====") 
            (let ($link $x $y) (get-atoms $dbspace) (add-atom &db ($link $x $y)))
            (let $atoms  (get-atoms $freq-kb) (add-reduct &freq-kb $atoms) )
            (let $atoms  (get-atoms $surp-kb) (add-reduct &surp-kb $atoms) )
    )
))



----------------------------------------------------------------------
;; init-miner 
----------------------------------------------------------------------
;; Initialize hyperparameters in both knowledge bases so as to make them accessible for the chainne.r
(= (init-miner $db $kb1 $kb2 $ms $surp $db-ratio $normalization)
    ( superpose (  
                  (println! "==== Initialize hyperparameters =====") 
                  (add-atom (superpose ($kb1 $kb2)) (: msT (ms-threshold $ms)))
                  (add-atom (superpose ($kb1 $kb2)) (: dbref (db-ref $db)))
                  (add-atom (superpose ($kb1 $kb2)) (: dbr (db-ratio $db-ratio)))
                  (add-atom (superpose ($kb1 $kb2)) (surp-mod $surp))
                  (add-atom (superpose ($kb1 $kb2)) (db-ratio $db-ratio))
                  (add-atom (superpose ($kb1 $kb2)) (db-size (db_size $db)))
                  (add-atom (superpose ($kb1 $kb2)) (db-ref $db))
                  (add-atom $kb2 (: surpMode (surp-mode $surp)))
                  (add-reduct $kb2 (if $normalization
                                              (: normalize (normalized True))  
                                              (: normalize (normalized False))))
                                
    )))

-----------------------------------------------------------
;; get-patterns
-----------------------------------------------------------
;;Returns frequent patters with their support from the kb
(= (get-patterns $kb) (
  chain (match $kb (: msT (ms-threshold $ms)) $ms) $msT
          ( match $kb (: $x (supportOf $pattern $value))
                (let True (>= $value $msT) (($pattern) (sup $value))))           
))


-----------------------------------------------------------------
;; mine-surp
-----------------------------------------------------------------
;; extract the mode of the Surprisingness
;; if the surprisingness mode is none return lis of mined patterns
;; otherwise launches the backward chainer for surprising patterns mining
(= (mine-surp $kb $res $surp-mode)  
  ( case $surp-mode (
        (none  (let $result  (get-patterns $kb) (add-atom $res $result)) ) 
        (jsdsurp (let $result  (syn $kb (fromNumber 13) (: $prf (jsdsurp $what_is_surprise $value)))   (add-atom $res $result)))
        ($_        (let (: $prf $ccln) (syn $kb (fromNumber 17) (: $prf (isurp $what_is_surprise $value)))    (add-atom $res $ccln)))
    )                                                         
))





--------------------------------------------------------------------------------------
;; pattern-miner
--------------------------------------------------------------------------------------
;; Chainer-based frequent and surprisingness pattern miner.
(= (pattern-miner $dbspace $freq-kb $surp-kb $ms $num-of-conjuct $surp-mode $db-ratio $norm) (
    let* (
        (() (println! "==== Pattern Miner Started ====="))
        ($dummy (collapse (clean-atomspaces $dbspace $freq-kb $surp-kb)))
        ($dummy2 (collapse (init-miner &db &freq-kb &surp-kb $ms $surp-mode $db-ratio $norm)))
        (() (frequent-miner &db &freq-kb $num-of-conjuct)) 
        ($dummy3 (collapse (match &freq-kb (: $prf (hasSupport $nptrn $count))  (add-atom &surp-kb (: $prf (hasSupport $nptrn $count))))))
        (() (println! "==== Surprissingness Scoring Started ====="))
        ($dummy4  (mine-surp &surp-kb &res $surp-mode))
    )    
       ; (match $surp-kb $x $x)
          (get-atoms &res)
))
