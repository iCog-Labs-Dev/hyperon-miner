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



(= (min-sup) 4)
(= (surp-mode ) none)
(= (db-ratio) 0.5)
(= (num-of-conjuct) 2)
(= (normalization) True)


(pattern-miner &dbspace &temp &temp2 (min-sup) (num-of-conjuct) (surp-mode) (db-ratio)  (normalization))

;; Expected output 

; (hasSupport (, (Inheritance $l98#2924653 sodaDrinker) (Inheritance $l98#2924653 ugly)) 4), 
; (hasSupport (, (Inheritance $p32#2924654 ugly) (Inheritance $p32#2924654 sodaDrinker)) 4), 
; (hasSupport (, (Inheritance Cason $g53#2924655) (Inheritance Allen $g53#2924655)) 4),
;  (hasSupport (, (Inheritance Cason $c91#2924656) (Inheritance Abe $c91#2924656)) 4), 
;  (hasSupport (, (Inheritance Abe $e05#2924657) (Inheritance Allen $e05#2924657)) 4), 
;  (hasSupport (, (Inheritance Abe $u27#2924658) (Inheritance Cason $u27#2924658)) 4), 
;  (hasSupport (, (Inheritance Allen $y76#2924659) (Inheritance Abe $y76#2924659)) 4), 
;  (hasSupport (, (Inheritance Allen $i80#2924660) (Inheritance Cason $i80#2924660)) 4), 
;  (hasSupport (, (Inheritance $l98#2924531 sodaDrinker) (Inheritance $l98#2924531 ugly)) 4), 
;  (hasSupport (, (Inheritance $p32#2924532 ugly) (Inheritance $p32#2924532 sodaDrinker)) 4), 
;  (hasSupport (, (Inheritance Cason $g53#2924533) (Inheritance Allen $g53#2924533)) 4), 
;  (hasSupport (, (Inheritance Cason $c91#2924534) (Inheritance Abe $c91#2924534)) 4), 
;  (hasSupport (, (Inheritance Abe $e05#2924535) (Inheritance Allen $e05#2924535)) 4), 
 
; .... too many to list all 
    
(= (min-sup2) 4)
(= (num-of-conjuct2) 3)
!(pattern-miner &dbspace &temp &temp2 (min-sup2) (num-of-conjuct2) (surp-mode) (db-ratio)  (normalization))



(= (min-sup3) 4)
(= (num-of-conjuct3) 3)
(= (surp-mode3) isurp-old)
(pattern-miner &dbspace &temp &temp2 (min-sup3) (num-of-conjuct3) (surp-mode3) (db-ratio)  (normalization))


