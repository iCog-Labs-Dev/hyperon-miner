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
(= (surp-mode ) none)
(= (db-ratio) 0.5)
(= (num-of-conjuct) 2)
(= (normalization) True)


!(pattern-miner &dbspace &temp &temp2 (min-sup) (num-of-conjuct) (surp-mode) (db-ratio)  (normalization))

;; Expected output 
; (isurp (, (Inheritance $j57#15899571 human) (Inheritance $j57#15899571 sodaDrinker)) 0.53125),
;  (isurp (, (Inheritance $i90#15899572 human) (Inheritance $i90#15899572 ugly)) 0.53125), (isurp (, (Inheritance $t46#15899573 human) (Inheritance $t46#15899573 man)) 0.53125),
;  (isurp (, (Inheritance $m52#15899574 man) (Inheritance $m52#15899574 sodaDrinker)) 0.53125), (isurp (, (Inheritance $e66#15899575 man) (Inheritance $e66#15899575 ugly)) 0.53125),
; (isurp (, (Inheritance $e27#15899576 man) (Inheritance $e27#15899576 human)) 0.53125), (isurp (, (Inheritance $f96#15899577 ugly) (Inheritance $f96#15899577 sodaDrinker)) 0.53125,
; (isurp (, (Inheritance $b90#15899578 ugly) (Inheritance $b90#15899578 man)) 0.53125), (isurp (, (Inheritance $u01#15899579 ugly) (Inheritance $u01#15899579 human)) 0.53125), 
; (isurp (, (Inheritance $f31#15899580 sodaDrinker) (Inheritance $f31#15899580 ugly)) 0.53125), (isurp (, (Inheritance $s05#15899581 sodaDrinker) (Inheritance $s05#15899581 man)) 0.53125), (isurp (, (Inheritance $s41#15899582 sodaDrinker) (Inheritance $s41#15899582 human)) 0.53125), 
; (isurp (, (Inheritance Allen $y29#15899583) (Inheritance Cason $y29#15899583)) 0.53125), 
; (isurp (, (Inheritance Allen $i37#15899584) (Inheritance Abe $i37#15899584)) 0.53125), (isurp (, (Inheritance Abe $m47#15899585) (Inheritance Cason $m47#15899585)) 0.53125),
; ...



