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
!(import! &temp   experiments:miner:miner-rules)
!(import! &self  experiments:miner:system-proofs)
!(import! &self experiments:miner:miner)
!(import! &self experiments:miner:miner-utils)

;;create new space for kb
!(bind! &kb (new-space))

;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-atom &kb $atoms) )


;; define hyper parameters 
(=(min-sup) 6)
(=(surp-mode ) nisurp-old)
(=(db-ratio) 0.5)

!(cog-mine &db &kb (min-sup) (surp-mode )  (db-ratio))
;; Expected result 
 ;(: (((((old-surp normalize) ((emp-prob-rule (((minsupport FACT4) msT) CPU)) CPUPROB)) ((((dst-from-interval ((emp-prob-rule (((minsupport FACT4) msT) CPU)) CPUPROB)) 
 ;((est-prob-rule ((partitions ((emp-prob-rule (((minsupport FACT4) msT) CPU)) CPUPROB)) CPUPARTN)) CPUESTPROB)) CPU) CPUDST)) DIVIDECPU) MINIMUMCPU) 
 ;(surp-old (, (Inheritance $x#27676 human) (Inheritance $x#27676 sodaDrinker) (Inheritance $x#27676 man)) 0.6772486772486773))
