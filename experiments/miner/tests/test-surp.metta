!(register-module! ../../../experiments)

;; import utils 
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:binomialMetta)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:emp-tv-bs)
! (import! &self experiments:utils:bs-utils)
! (import! &self experiments:utils:util-jsd)
! (import! &self experiments:utils:eq_prob_adaptor)
! (import! &self experiments:utils:customType)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)
! (import! &self experiments:utils:index_to_var)

;; import truth value computing components
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:truth-values:emp-tv)
! (import! &self experiments:utils:jsd-helper)

;; import surprisingness scoring functions 
! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:emp-prob)
! (import! &self experiments:surprisingness:jsd)

;; load the db space 
! (import! &db experiments:data:ugly_man_sodaDrinker)

!(import! &self experiments:frequent-pattern-miner:use-python)


;; load rules , system-proofs and miner-utils ...
!(import! &temp   experiments:miner:surp-rules)
!(import! &self  experiments:miner:system-proofs)
!(import! &self experiments:miner:miner-utils)


;;create new space for kb
!(bind! &kb (new-space))
!(bind! &kb1 (new-space))
!(bind! &kb2 (new-space))
!(bind! &kb3 (new-space))
!(bind! &kb4 (new-space))



;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-atom (superpose (&kb &kb1 &kb2 &kb3 &kb4)) $atoms) )


;; mocking the frequent pattern miner results 
(= (mock-frequent-miner $kb) (
   add-reduct $kb  (superpose ( 
       (: FACT1  (hasSupport (, (Inheritance Z human) (Inheritance Z ugly) (Inheritance Z woman)) 1)) 
                     (: FACT2 (hasSupport (, (Inheritance Z sodaDrinker) (Inheritance Z human) (Inheritance Z woman)) 1))
                     (: FACT3 (hasSupport (,  (Inheritance Z human) (Inheritance Z sodaDrinker) (Inheritance Z ugly)) 1))
                     (: FACT4 (hasSupport (, (Inheritance Z man) (Inheritance Z ugly) (Inheritance Z sodaDrinker)) 8))))
)) 


;; Initialize hyperparameters            
(= (init-params $kb $db $min-sup $surp-mode $db-ratio $normalization )
(superpose
(
(mock-frequent-miner $kb) 
(add-atom $kb (: msT (ms-threshold $min-sup)))
(add-atom $kb (: dbref (db-ref $db)))
(add-atom $kb (: dbr (db-ratio $db-ratio)))
(add-atom $kb (surp-mod $surp-mode))
(add-atom $kb (db-ratio $db-ratio))
(add-atom $kb (db-size (db_size $db)))
(add-atom $kb (db-ref $db))
(add-reduct $kb (: surpMode (surp-mode $surp-mode)))
(add-reduct $kb (: dbsize (db-size (db_size $db))))
(add-atom $kb (: normalize (normalized $normalization))  
                                    ))))



------------------------------------------------------------------------------------
; old-isurprisingnes without normalization 
; define hyper parameters -> 1
(=(min-sup) 6)
(=(surp-mode ) isurp-old)
(=(db-ratio) 0.5)
(= (normalization) False)

!(init-params &kb &db (min-sup) (surp-mode) (db-ratio) (normalization))

!(println! ("========== isurp-old test without  normalization ==============="))

!(let $result (call_replace (syn &kb (fromNumber 19) (: $prf (Isurp $pattern $surp)))) (assertEqual $result 
 ;; Expected result
 (: ((((((isurp-rule normalize) (((universal-count ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL))
  (((emp-prob-rule surpMode) (((universal-count ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB))
   ((((est-prob-rule surpMode) (((universal-count ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) 
   (partitions CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MINIMUMCPU)
    (Isurp (, (Inheritance Z man) (Inheritance Z ugly) (Inheritance Z sodaDrinker)) 0.00014607068574401343))
 ))



------------------------------------------------------------------------------------
;; old-isurprisingnes with normalization 
;; define hyper parameters -> 2
(= (min-sup2) 6)
(= (surp-mode2 ) isurp-old)
(= (db-ratio2) 0.5)
(= (normalization2) True)
 
!(init-params &kb2 &db (min-sup2) (surp-mode2) (db-ratio2) (normalization2))

!(println! ("========== isurp-old test with normalization =============="))

!(let $result (call_replace (syn &kb2 (fromNumber 19) (: $prf (Isurp $prattern  $surp)))) (assertEqual $result
;;Expected result 
 (: ((((((((isurp-rule normalize) (((universal-count ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL))
  (((emp-prob-rule surpMode) (((universal-count ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB))
   ((((est-prob-rule surpMode) (((universal-count ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL))
    (partitions CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU)
     (Isurp (, (Inheritance Z man) (Inheritance Z ugly) (Inheritance Z sodaDrinker)) 0.999707773232028))))




------------------------------------------------------------------------------------
; isurp with normalization 
; define hyper parameters -> 1
(=(min-sup3) 6)
(=(surp-mode3 ) isurp)
(=(db-ratio3) 0.5)
(= (normalization3) True)

!(init-params &kb3 &db (min-sup3) (surp-mode3) (db-ratio3) (normalization3))

!(println! ("========== isurp test with normalization =============="))

!(let $result (call_replace (syn &kb3 (fromNumber 19) (: $prf (Isurp $prattern  $surp)))) (assertEqual $result 
;;Expected result 
  (: ((((((((isurp-rule normalize) (((universal-count ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL))
   ((((emp-prob-rule surpMode) (((((est-prob-rule surpMode) ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) (partitions CPUPARTN))
    dbr) CPUESTPROB)) dbr) CPUPROB)) (((((est-prob-rule surpMode) ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) 
    (partitions CPUPARTN)) dbr) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU)
     (Isurp (, (Inheritance Z man) (Inheritance Z ugly) (Inheritance Z sodaDrinker)) 0.8333333333333334))))



------------------------------------------------------------------------------------
; Jsd surprisingness 
; define hyper parameters -> 4
(=(min-sup4) 6)
(=(surp-mode4 ) jsd)
(=(db-ratio4) 0.5)
(= (normalization4) True)

! (import! &db-sm experiments:data:small-ugly)


!(init-params &kb4 &db-sm (min-sup4) (surp-mode4) (db-ratio4) (normalization4))

!(println! ("========== JSD Test =============="))

!(let $result (call_replace (syn &kb4 (fromNumber 19) (: $prf (jsd-surp $pattern $surp))))  
(assertEqual $result (: ((((jsd-tv ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) ((emp-rule ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) CPUEMP))
 (((est-rule ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) ((emp-rule ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) CPUEMP)) CPUEST)) JSDCPU)
  (jsd-surp (, (Inheritance Z man) (Inheritance Z ugly) (Inheritance Z sodaDrinker)) 0.8605207271269311))) )
