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
! (import! &self experiments:surprisingness:isurp-old)
! (import! &self experiments:surprisingness:emp-prob)
! (import! &self experiments:surprisingness:jsd)

;; load the db space 
! (import! &db experiments:data:ugly_man_sodaDrinker)


;; load rules , system-proofs and miner-utils ...
!(import! &temp   experiments:miner:surp-rules)
!(import! &self  experiments:miner:system-proofs)
; !(import! &self experiments:miner:surp-miner)
!(import! &self experiments:miner:miner-utils)

;;create new space for kb
!(bind! &kb (new-space))

;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-atom &kb $atoms) )


;; define hyper parameters 
(=(min-sup) 6)
(=(surp-mode ) isurp)
(=(db-ratio) 0.5)
(= (normalization) True)



;; Initialize hyperparameters            
!(add-atom &kb (: msT (ms-threshold (min-sup))))
!(add-atom &kb (: dbref (db-ref &db)))
!(add-atom &kb (: dbr (db-ratio (db-ratio))))
!(add-atom &kb (surp-mod (surp-mode)))
!(add-atom &kb (db-ratio (db-ratio)))
!(add-atom &kb (db-size (db_size &db)))
!(add-atom &kb (db-ref &db))
!(add-atom &kb (: surpMode (surp-mode (surp-mode))))
!(add-reduct &kb (: dbsize (db-size (db_size &db))))
!(add-reduct &kb (if (normalization)
                                    (: normalize (normalized True))  
                                    (: normalize (normalized False))))
                                
    


;; mocking the frequent pattern miner results 
 !(add-atom &kb (: FACT1  (hasSupport (, (Inheritance $x human) (Inheritance $x ugly) (Inheritance $x woman)) 1)))
 !(add-atom &kb (: FACT2 (hasSupport (, (Inheritance $x sodaDrinker) (Inheritance $x human) (Inheritance $x woman)) 1)))
 !(add-atom &kb (: FACT3 (hasSupport (,  (Inheritance $x human) (Inheritance $x sodaDrinker) (Inheritance $x ugly)) 1)))
 !(add-atom &kb (: FACT4 (hasSupport (,  (Inheritance $x human) (Inheritance $x sodaDrinker) (Inheritance $x man)) 8)))


! (syn &kb (fromNumber 17) (: $prf (empProb $pattern $prob)))
; ! (syn &kb (fromNumber 1) (: $prf (surp-mode $mode)))

;; Expected result 
 ;(: (((((old-surp normalize) ((emp-prob-rule (((minsupport FACT4) msT) CPU)) CPUPROB)) ((((dst-from-interval ((emp-prob-rule (((minsupport FACT4) msT) CPU)) CPUPROB)) 
 ;((est-prob-rule ((partitions ((emp-prob-rule (((minsupport FACT4) msT) CPU)) CPUPROB)) CPUPARTN)) CPUESTPROB)) CPU) CPUDST)) DIVIDECPU) MINIMUMCPU) 
 ;(surp-old (, (Inheritance $x#27676 human) (Inheritance $x#27676 sodaDrinker) (Inheritance $x#27676 man)) 0.6772486772486773))
