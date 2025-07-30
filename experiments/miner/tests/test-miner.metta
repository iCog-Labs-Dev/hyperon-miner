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

;; import truth value computing components
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:truth-values:emp-tv)

;; import surprisingness scoring functions 
! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:isurp-old)
! (import! &self experiments:surprisingness:emp-prob)
! (import! &self experiments:surprisingness:jsd)


;; load rules , system-proofs and miner-utils ...
!(import! &temp   experiments:miner:freq-miner-rules)
!(import! &temp2   experiments:miner:surp-rules)
!(import! &self  experiments:miner:system-proofs)
!(import! &self experiments:miner:miner-utils)
!(import! &self experiments:miner:main)
!(import! &self experiments:miner:freq-miner)



!(import! &self experiments:rules:conj-exp)
!(import! &self experiments:rules:freq-pat)
!(import! &self experiments:rules:use-python)
!(import! &self experiments:utils:variable-combinations)
!(import! &self experiments:rules:build-specialization)
!(import! &self experiments:rules:conjunction-expansion)

; ! (import! &dbspace experiments:data:ugly_man_sodaDrinker)
! (import! &dbspace experiments:data:small-ugly)



(= (min-sup) 3)
(= (surp-mode ) isurp-old)
(= (db-ratio) 0.5)
(= (num-of-conjuct) 2)
(= (normalization) True)


!(pattern-miner &dbspace &temp &temp2 (min-sup) (num-of-conjuct) (surp-mode) (db-ratio)  (normalization))

;; Expected output 
