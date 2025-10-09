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



!(import! &self experiments:frequent-pattern-miner:conj-exp)
!(import! &self experiments:frequent-pattern-miner:freq-pat)
!(import! &self experiments:frequent-pattern-miner:use-python)
!(import! &self experiments:utils:variable-combinations)
; !(import! &self experiments:rules:build-specialization)
!(import! &self experiments:frequent-pattern-miner:conjunction-expansion)

; ! (import! &dbspace experiments:data:ugly_man_sodaDrinker)
! (import! &dbspace experiments:data:small-ugly)



(= (min-sup) 4)
(= (surp-mode ) none)
(= (db-ratio) 0.5)
(= (num-of-conjuct) 2)
(= (normalization) True)


(pattern-miner &dbspace &temp &temp2 (min-sup) (num-of-conjuct) (surp-mode) (db-ratio)  (normalization))

;; Expected output 

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) 
; CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport
; (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU))
; CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount)
; maxClauses) CPU) CPUSortConjunctions) CPUJoin) (hasSupport (, (Inheritance Abe Z) (Inheritance Allen Z)) 4)),

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation)
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) 
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables)
; CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) (hasSupport (, (Inheritance Abe Z) (Inheritance Cason Z)) 4)), 

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) 
; CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) 
; CPUSortConjunctions) CPUJoin) (hasSupport (, (Inheritance Allen Z) (Inheritance Cason Z)) 4)), 

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex)
; CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport 
; (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) 
; CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean))
; CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) (hasSupport (, (Inheritance Z sodaDrinker) (Inheritance Z ugly)) 4))

(= (surp-mode1 ) isurp-old)
(pattern-miner &dbspace &temp &temp2 (min-sup) (num-of-conjuct) (surp-mode1) (db-ratio)  (normalization))

; (: ((((((((isurp-rule normalize) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex)
; CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) 
; dbsize) CPUUNIVERSAL)) (((emp-prob-rule surpMode) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT)
; CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB))
; ((((est-prob-rule surpMode) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) 
; CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) (partitions CPUPARTN)) CPUESTPROB))
; ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) 
; (Isurp (, (Inheritance Abe $c72#4454482) (Inheritance Allen $c72#4454482)) 0.9666666666666667))

; (: ((((((((isurp-rule normalize) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter))
; msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) 
; CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) (((emp-prob-rule surpMode) (((universal-count ((((minsupport 
; ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses)
; CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables)
; CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB)) ((((est-prob-rule surpMode) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand
; ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support 
; (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar)
; CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) (partitions CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) 
; (Isurp (, (Inheritance Abe $i82#4454483) (Inheritance Cason $i82#4454483)) 0.9666666666666667))

; (: ((((((((isurp-rule normalize) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU))
; CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT)
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) (((emp-prob-rule surpMode) (((universal-count ((((minsupport ((((((supportFormat 
; ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate 
; (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables)
; CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) CPUPROB)) ((((est-prob-rule surpMode) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar))
; CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin))
; CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) (partitions CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) 
; (Isurp (, (Inheritance Allen $k55#4454484) (Inheritance Cason $k55#4454484)) 0.9666666666666667)), 

; (: ((((((((isurp-rule normalize) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables)
; CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) (((emp-prob-rule surpMode) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationy 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation)
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL))
; CPUPROB)) ((((est-prob-rule surpMode) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex)
; CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) 
; CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) (partitions CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) 
; (Isurp (, (Inheritance $u31#4454485 sodaDrinker) (Inheritance $u31#4454485 ugly)) 0.9666666666666667))



(= (min-sup2) 4)
(= (num-of-conjuct2) 3)
!(pattern-miner &dbspace &temp &temp2 (min-sup2) (num-of-conjuct2) (surp-mode) (db-ratio)  (normalization))
; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT)
; CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU)
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT)
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUReplaceindex) CPUCount) maxClauses) CPUequals)
; ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex)
; CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar)
; CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) (hasSupport (, (Inheritance Abe Z) (Inheritance Allen Z) (Inheritance Cason Z)) 4))





(= (min-sup3) 4)
(= (num-of-conjuct3) 3)
(= (surp-mode3) isurp-old)
(pattern-miner &dbspace &temp &temp2 (min-sup3) (num-of-conjuct3) (surp-mode3) (db-ratio)  (normalization))

; (: ((((((((isurp-rule normalize) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((((((((((((((((((conjunction-expand 
; ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU)
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) 
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUReplaceindex) CPUCount) maxClauses) CPUequals)
; ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex)
; CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar)
; CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) (((emp-prob-rule surpMode) (((universal-count ((((minsupport
; ((((((supportFormat ((((((((((((((((((conjunction-expand ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU)
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) (
; (candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) 
; CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar)
; CPUConjunctionClean)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex)
; CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables)
; CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL))
; CPUPROB)) ((((est-prob-rule surpMode) (((universal-count ((((minsupport ((((((supportFormat ((((((((((((((((((conjunction-expand ((((((((((((((((((conjunction-expand ((candidate (((minsupport 
; (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU))
; CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex)
; CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables)
; CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) 
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) 
; CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) CPUReplaceindex) msT) CPU)) dbsize) CPUUNIVERSAL)) 
; (partitions CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) (Isurp (, (Inheritance Abe $r55#16311061) (Inheritance Allen $r55#16311061) (Inheritance Cason $r55#16311061)) 0.9928571428571429))

