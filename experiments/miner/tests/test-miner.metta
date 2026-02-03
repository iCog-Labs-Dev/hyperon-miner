;; import utils 
!(import! &self "../../utils/surp-utils/boost_petta.py")
!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/constants)
!(import! &self ../../utils/TruthValue)
!(import! &self ../../utils/surp-utils/partition-metta)
!(import! &self ../../utils/surp-utils/binomialMetta)
!(import! &self ../../utils/surp-utils/beta-dist)
!(import! &self ../../utils/surp-utils/surp-utils)
!(import! &self ../../utils/surp-utils/blk-abstractness)
!(import! &self ../../utils/surp-utils/eq-prob-petta)
!(import! &self ../../utils/surp-utils/bs-utils)
!(import! &self ../../utils/surp-utils/jsd-helper)

; import truth value computing components
!(import! &self ../../truth-values/emp-tv)
!(import! &self ../../truth-values/est-tv)
!(import! &self ../../utils/index_to_var)


; import surprisingness scoring functions 
!(import! &self ../../surprisingness/emp-prob)
!(import! &self ../../surprisingness/isurp)
!(import! &self ../../surprisingness/jsd)


;; 
!(import! &self ../../utils/variable-combinations)
!(import! &self ../../utils/sort)
!(import! &self ../../utils/remove_useless_clauses)
!(import! &self ../../frequent-pattern-miner/conjunction-expansion)

;; config kb : load the chainer , rules , system-proofs ....
!(import! &freq-kb-temp  ../freq-miner-rules)
!(import! &surp-kb-temp  ../surp-rules)
!(import! &self  ../system-proofs)
!(import! &self ../miner-utils)
!(import! &self ../freq-miner)
!(import! &self ../main)


;; load the db space 
!(import! &db-temp ../../data/ugly_man_sodaDrinker)



(= (min-sup) 4)
(= (surp-mode ) none)
(= (db-ratio) 0.5)
(= (num-of-conjuct) 3)
(= (normalization) True)
(= (conj_exp) True)


!(pattern-miner &db-temp &freq-kb-temp &surp-kb-temp (min-sup) (num-of-conjuct) (conj_exp) (surp-mode) (db-ratio)  (normalization))

;; Expected output 

; (: (((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((((specializationy 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter))
; msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) 
; msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) 
; CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar)
; CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT)
; CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex)
; CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1)
; CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) CPUReplaceindex) 
; (hasSupport (, (Inheritance $_638824 human) (Inheritance $_638824 ugly) (Inheritance $_638824 sodaDrinker)) 5))

; (: (((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((((specializationy 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) 
; CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) 
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) 
; CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) 
; CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) 
; CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) 
; CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) 
; CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) CPUReplaceindex) (hasSupport (, (Inheritance $_637552 man) (Inheritance $_637552 ugly) 
; (Inheritance $_637552 sodaDrinker)) 5))

(= (surp-mode1) isurp-old)
(= (min-sup2) 5)
(pattern-miner &db-temp &freq-kb-temp &surp-kb-temp (min-sup2) (num-of-conjuct) (conj_exp) (surp-mode1) (db-ratio)  (normalization))

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



(= (surp-mode2) isurp)
(pattern-miner &db-temp &freq-kb-temp &surp-kb-temp (min-sup2) (num-of-conjuct) (conj_exp) (surp-mode2) (db-ratio)  (normalization))

; (: ((((((((isurp-rule normalize) (((universal-count (((minsupport (((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand 
; ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) 
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport 
; (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) 
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) 
; CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep 
; (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) 
; CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) 
; CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) 
; CPUJoin) CPUReplaceindex)) msT) CPU)) dbsize) CPUUNIVERSAL)) ((((emp-prob-rule surpMode) (((((est-prob-rule surpMode) (((minsupport 
; (((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((((specializationy 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) 
; CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) 
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) 
; CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) 
; CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) 
; CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) 
; CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) 
; CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) CPUReplaceindex)) msT) CPU)) (partitions-rule CPUPARTN)) dbr) CPUESTPROB)) dbr) CPUPROB)) 
; (((((est-prob-rule surpMode) (((minsupport (((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport 
; (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) 
; CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) 
; CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy (
; (((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) 
; CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) 
; CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) CPUReplaceindex)) msT) CPU)) 
; (partitions-rule CPUPARTN)) dbr) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) 
; (Isurp (, (Inheritance $_4008 man) (Inheritance $_4008 ugly) (Inheritance $_4008 sodaDrinker)) 0.8333333333333334))



(= (min-sup3) 5)
(= (num-of-conjuct3) 3)
(= (surp-mode3) jsdsurp)

(import! &db-sm   ../../data/small-ugly)
(pattern-miner &db-sm &freq-kb-temp &surp-kb-temp (min-sup3) (num-of-conjuct3) (conj_exp) (surp-mode3) (db-ratio)  (normalization))


