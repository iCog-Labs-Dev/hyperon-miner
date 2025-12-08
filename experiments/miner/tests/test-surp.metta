
;; import utils 
!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/surp-utils/partition-metta)
!(import! &self ../../utils/surp-utils/binomialMetta)
!(import! &self ../../utils/surp-utils/surp-utils)
!(import! &self ../../utils/surp-utils/beta-dist)
!(import! &self ../../utils/surp-utils/blk-abstractness)
!(import! &self ../../utils/surp-utils/eq-prob-petta)
!(import! &self ../../utils/surp-utils/bs-utils)
!(import! &self ../../utils/surp-utils/jsd-helper)
!(import! &self ../../utils/TruthValue)
!(import! &self ../../utils/constants)

; import truth value computing components
!(import! &self ../../truth-values/emp-tv)
!(import! &self ../../truth-values/est-tv)
!(import! &self ../../utils/index_to_var)


; import surprisingness scoring functions 
!(import! &self ../../surprisingness/emp-prob)
!(import! &self ../../surprisingness/isurp)
!(import! &self ../../surprisingness/jsd)


;; load the db space 
!(import! &self ../../data/ugly_man_sodaDrinker)
!(migrateAtoms &self &db  (Inheritance $x $y))




;; load rules , system-proofs and miner-utils ...
!(import! &self   ../surp-rules)
!(migrateAtoms &self (superpose (&kb &kb1 &kb2 &kb3 &kb4))  (: $prabst $primis))

!(import! &self  ../system-proofs)
!(import! &self ../miner-utils)



;; mocking the frequent pattern miner results 
(= (mock-frequent-miner $kb) (superpose (
   (add-atom $kb  (: FACT1  (hasSupport (, (Inheritance $x human) (Inheritance $x ugly) (Inheritance $x woman)) 1))) 
   (add-atom $kb     (: FACT2 (hasSupport (, (Inheritance $x sodaDrinker) (Inheritance $x human) (Inheritance $x woman)) 1)))
   (add-atom $kb (: FACT3 (hasSupport (,  (Inheritance $x human) (Inheritance $x sodaDrinker) (Inheritance $x ugly)) 1)))
   (add-atom $kb(: FACT4 (hasSupport (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) 8)))
                     )))


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
(add-atom $kb (: surpMode (surp-mode $surp-mode)))
(let $size (db_size $db)  (add-atom $kb (: dbsize (db-size $size))) )
(add-atom $kb (: normalize (normalized $normalization))  
                                    ))))



; ------------------------------------------------------------------------------------
; ; old-isurprisingnes without normalization 
; ; define hyper parameters -> 1
(=(min-sup) 6)
(=(surp-mode ) isurp-old)
(=(db-ratio) 0.5)
(= (normalization) False)

!(init-params &kb &db (min-sup) (surp-mode) (db-ratio) (normalization))


!(println! ("========== isurp-old test without  normalization ==============="))



!(assertEqual (syn &kb (fromNumber 19) (: $prf  (Isurp $pattern $surp))) 
   ;; Expected reslt  
(: ((((((isurp-rule normalize) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) (((emp-prob-rule surpMode) 
   (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB)) ((((est-prob-rule surpMode) (((universal-count 
   (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) (partitions-rule CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MINIMUMCPU) 
   (Isurp (, (Inheritance $_57590 man) (Inheritance $_57590 ugly) (Inheritance $_57590 sodaDrinker)) 0.00014607068574401354))  )

; ------------------------------------------------------------------------------------
; ;; old-isurprisingnes with normalization 
; ;; define hyper parameters -> 2
(= (min-sup2) 6)
(= (surp-mode2 ) isurp-old)
(= (db-ratio2) 0.5)
(= (normalization2) True)
 
 ;; import rules 
!(import! &self   ../surp-rules)
!(migrateAtoms &self &kb2 (: $prabst $primis))
;;init 
!(init-params &kb2 &db (min-sup2) (surp-mode2) (db-ratio2) (normalization2))

!(println! ("========== isurp-old test with normalization =============="))

!(assertEqual (syn &kb2 (fromNumber 19) (: $prf  (Isurp $pattern $surp)))
;;Expected result 
 (: ((((((((isurp-rule normalize) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) 
    (((emp-prob-rule surpMode) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB)) 
    ((((est-prob-rule surpMode) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) 
     (partitions-rule CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) 
     (Isurp (, (Inheritance $_36206 man) (Inheritance $_36206 ugly) (Inheritance $_36206 sodaDrinker)) 0.999707773232028)))




; ------------------------------------------------------------------------------------
; isurp with normalization 
; define hyper parameters -> 1
(=(min-sup3) 6)
(=(surp-mode3 ) isurp)
(=(db-ratio3) 0.5)
(=(normalization3) True)

;import rules
!(import! &self   ../surp-rules)
!(migrateAtoms &self &kb3 (: $prabst $primis))

!(init-params &kb3 &db (min-sup3) (surp-mode3) (db-ratio3) (normalization3))

!(println! ("========== isurp test with normalization =============="))

!(assertEqual (syn &kb3 (fromNumber 19) (: $prf (Isurp $prattern  $surp))) 
             ;; Expecged result 
              (: ((((((((isurp-rule normalize) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) 
               CPUUNIVERSAL)) ((((emp-prob-rule surpMode) (((((est-prob-rule surpMode) (((minsupport FACT4) msT) CPU)) (partitions-rule CPUPARTN)) dbr) CPUESTPROB)) dbr) CPUPROB))
                (((((est-prob-rule surpMode) (((minsupport FACT4) msT) CPU)) (partitions-rule CPUPARTN)) dbr) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU)
                (Isurp (, (Inheritance $_60714 man) (Inheritance $_60714 ugly) (Inheritance $_60714 sodaDrinker)) 0.8333333333333334)) )




;------------------------------------------------------------------------------------
; Jsd surprisingness 
; define hyper parameters -> 4
(=(min-sup4) 6)
(=(surp-mode4 ) jsd)
(=(db-ratio4) 0.5)
(= (normalization4) True)

;!(import! &db-sm experiments:data:small-ugly)
!(import! &self   ../../data/small-ugly)
!(migrateAtoms &self &db-sm (Inheritance $prabst $primis))

;; import rules 
!(import! &self   ../surp-rules)
!(migrateAtoms &self &kb4 (: $prabst $primis))

!(init-params &kb4 &db-sm (min-sup4) (surp-mode4) (db-ratio4) (normalization4))

!(println! ("========== JSD Test =============="))

(let $result (call_replace (syn &kb4 (fromNumber 19) (: $prf (jsd-surp $pattern $surp))))  
(assertEqual $result (: ((((jsd-tv ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) ((emp-rule ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) CPUEMP))
 (((est-rule ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) ((emp-rule ((((minsupport FACT4) CPUReplaceindex) msT) CPU)) CPUEMP)) CPUEST)) JSDCPU)
  (jsd-surp (, (Inheritance Z man) (Inheritance Z ugly) (Inheritance Z sodaDrinker)) 0.8608962449888359))) )





