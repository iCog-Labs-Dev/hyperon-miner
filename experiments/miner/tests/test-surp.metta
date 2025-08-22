!(register-module! ../../../experiments)

;; import utils and rules files 
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

;; import truth value computing components
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:truth-values:emp-tv)

;; import surprisingness scoring functions 
! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:emp-prob)
! (import! &self experiments:surprisingness:jsd)

;; load the db space 
! (import! &db experiments:data:ugly_man_sodaDrinker)


;; load rules , system-proofs and miner-utils ...
!(import! &temp   experiments:miner:surp-rules)
!(import! &self  experiments:miner:system-proofs)
!(import! &self experiments:miner:miner-utils)

;;create new space for kb
!(bind! &kb (new-space))

;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-atom &kb $atoms) )



;; Initialize hyperparameters            
(= (init-params $kb $db $min-sup $surp-mode $db-ratio $normalization )
(superpose
((add-atom $kb (: msT (ms-threshold $min-sup)))
(add-atom $kb (: dbref (db-ref $db)))
(add-atom $kb (: dbr (db-ratio $db-ratio)))
(add-atom $kb (surp-mod $surp-mode))
(add-atom $kb (db-ratio $db-ratio))
(add-atom $kb (db-size (db_size $db)))
(add-atom $kb (db-ref $db))
(add-reduct $kb (: surpMode (surp-mode $surp-mode)))
(add-reduct $kb (: dbsize (db-size (db_size $db))))
(add-reduct $kb (if $normalization
                                    (: normalize (normalized True))  
                                    (: normalize (normalized False)))))))
                                

(=(remove-params $kb) 
   (superpose (
(remove-atom $kb (: msT (ms-threshold $min-sup)))
(remove-atom $kb (: dbref (db-ref $db)))
(remove-atom $kb (: dbr (db-ratio $db-ratio)))
(remove-atom $kb (surp-mod $surp-mode))
(remove-atom $kb (db-ratio $db-ratio))
(remove-atom $kb (db-size (db_size $db)))
(remove-atom $kb (db-ref $db))
(remove-atom $kb (: surpMode (surp-mode $surp-mode)))
(remove-atom $kb (: dbsize (db-size (db_size $db))))
(remove-atom $kb (: normalize (normalized $value)) ) 
                                   
   ))) 


;; mocking the frequent pattern miner results 
 !(add-atom &kb (: FACT1  (hasSupport (, (Inheritance $x human) (Inheritance $x ugly) (Inheritance $x woman)) 1)))
 !(add-atom &kb (: FACT2 (hasSupport (, (Inheritance $x sodaDrinker) (Inheritance $x human) (Inheritance $x woman)) 1)))
 !(add-atom &kb (: FACT3 (hasSupport (,  (Inheritance $x human) (Inheritance $x sodaDrinker) (Inheritance $x ugly)) 1)))
 !(add-atom &kb (: FACT4 (hasSupport (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) 8)))
------------------------------------------------------------------------------------
;; old-isurprisingnes without normalization 
;; define hyper parameters -> 1
(=(min-sup) 6)
(=(surp-mode ) isurp-old)
(=(db-ratio) 0.5)
(= (normalization) False)

; !(init-params &kb &db (min-sup) (surp-mode) (db-ratio) (normalization))

; !(println! ("========== isurp-old test without  normalization ==============="))
; !(syn &kb (fromNumber 19) (: $prf (isurp $pattern $surp))) 
; !(remove-params &kb) 
;; Expected result 
;;(: ((((((isurp normalize) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) 
;;((emp-prob-rule (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB)) 
;;((((est-prob-rule surpMode) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) 
;;(partitions CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MINIMUMCPU) (
;;isurp (, (Inheritance $x#58368 man) (Inheritance $x#58368 ugly) (Inheritance $x#58368 sodaDrinker)) 0.00014607068574401343))

------------------------------------------------------------------------------------
;; old-isurprisingnes with normalization 
;; define hyper parameters -> 1
(=(min-sup2) 6)
(=(surp-mode2 ) isurp-old)
(=(db-ratio2) 0.5)
(= (normalization2) True)

!(init-params &kb &db (min-sup2) (surp-mode2) (db-ratio2) (normalization2))

!(println! ("========== isurp-old test with normalization =============="))
! (syn &kb (fromNumber 19) (: $prf (isurp $pattern $surp)))

;;Expected result 
;;()]
;;(: ((((((((isurp normalize) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) 
;;((emp-prob-rule (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB)) 
;;((((est-prob-rule surpMode) (((universal-count (((minsupport FACT4) msT) CPU)) dbsize) CPUUNIVERSAL)) (partitions CPUPARTN)) CPUESTPROB)) 
;;((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) 
;;(isurp (, (Inheritance $x#45638 man) (Inheritance $x#45638 ugly) (Inheritance $x#45638 sodaDrinker)) 0.999707773232028))


