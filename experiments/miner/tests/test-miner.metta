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
; !(import! &self ../../frequent-pattern-miner/conjunction-expansion)

!(import! &self ../../frequent-pattern-miner/valuation)
!(import! &self ../../frequent-pattern-miner/shallow-abstractions)
; !(import! &self ../../frequent-pattern-miner/specialization)
!(import! &self ../../frequent-pattern-miner/candidate)
;; config kb : load the chainer , rules , system-proofs ....
!(import! &freq-kb  ../freq-miner-rules)
!(import! &surp-kb  ../surp-rules)
!(import! &self  ../system-proofs)
!(import! &self ../miner-utils)
!(import! &self ../freq-miner)
!(import! &self ../main)


;; load the db space 
!(import! &db ../../data/ugly_man_sodaDrinker)
!(import! &db2 ../../data/dataset_for_n_arry_format)



(= (min-sup) 4)
(= (surp-mode ) none)
(= (db-ratio) 0.5)
(= (num-of-conjuct) 3)
(= (normalization) True)
(= (conj_exp) True)


(pattern-miner &db &freq-kb &surp-kb $x (min-sup) (num-of-conjuct) (conj_exp) (surp-mode) (db-ratio)  (normalization))

;; Expected output 

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter))
; msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs
; (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter)
; CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport (, (Inheritance Hessley $_648686) (Inheritance Davion $_648686) (Inheritance Cason $_648686)) 4))

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter))
; msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs
; (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter)
; CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport (, (Inheritance $_585176 sodaDrinker) (Inheritance $_585176 ugly) (Inheritance $_585176 man)) 5))


; ...
(= (min-sup2) 5)
(= (num-of-conjuct2) 2)
;;n-tuple test
(pattern-miner &db2 &freq-kb &surp-kb $x (min-sup2) (num-of-conjuct2) (conj_exp) (surp-mode) (db-ratio)  (normalization))

;;Expected output

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex)
; CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT)
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport (, (Inheritance $_292676 Pizza-Lover The-Slice-Shop) (Inheritance $_292676 Pizza-Lover $_292718)) 6))

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex)
; CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) 
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport (, (Inheritance $_273356 $_273362 $_273368) (Inheritance $_273386 $_273392 $_273356)) 12))

; ...

(= (surp-mode1) isurp-old)
!(pattern-miner &db &freq-kb &surp-kb $x (min-sup2) (num-of-conjuct) (conj_exp) (surp-mode1) (db-ratio)  (normalization))

; (: ((((((((isurp-rule normalize) (((universal-count (((minsupport ((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand 
; ((candidatep (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) 
; CPUGetVals)) CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport 
; (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) 
; CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep 
; (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) 
; CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) 
; CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) 
; CPUJoin)) msT) CPU)) dbsize) CPUUNIVERSAL)) ((emp-prob-rule surpMode) CPUPROB)) (((est-prob-rule surpMode) (partitions-rule CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) 
; CPUDST)) MAXIMUMCPU) DIVIDECPU) MINIMUMCPU) (Isurp (, (Inheritance $_666674 human) (Inheritance $_666674 $_666704) (Inheritance $_666722 $_666704)) 0.9973699590882525))


; (: ((((((((isurp-rule normalize) (((universal-count (((minsupport ((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep 
; (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) 
; CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports 
; (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) 
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) 
; CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport 
; (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) 
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) 
; CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) msT) CPU)) dbsize) 
; CPUUNIVERSAL)) ((emp-prob-rule surpMode) CPUPROB)) (((est-prob-rule surpMode) (partitions-rule CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) 
; MINIMUMCPU) (Isurp (, (Inheritance $_665108 $_665114) (Inheritance $_665132 $_665114) (Inheritance $_665132 $_665162)) 0.9974751607247224))

; (: ((((((((isurp-rule normalize) (((universal-count (((minsupport ((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep 
; (((minsupport (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) 
; CPUSubstituteVariables)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports 
; (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) 
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) 
; CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport 
; (((supports (((spec init-pat) ((shallow_abs (((((valuationNotTop init-pat) CPUIsNotTop) CPUGetMatches) CPUGetPatternVariables) CPUGetVals)) CPUGetVals)) CPUSubstituteVariables)) 
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) 
; CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)) msT) CPU)) dbsize) 
; CPUUNIVERSAL)) ((emp-prob-rule surpMode) CPUPROB)) (((est-prob-rule surpMode) (partitions-rule CPUPARTN)) CPUESTPROB)) ((dst-from-interval CPU) CPUDST)) MAXIMUMCPU) DIVIDECPU) 
; MINIMUMCPU) (Isurp (, (Inheritance $_663542 $_663548) (Inheritance $_663542 $_663572) (Inheritance $_663590 $_663548)) 0.9974751607247224))


(= (surp-mode2) isurp)
(pattern-miner &db &freq-kb &surp-kb $x (min-sup2) (num-of-conjuct) (conj_exp) (surp-mode2) (db-ratio)  (normalization))

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


(pattern-miner &db &freq-kb &surp-kb $x (min-sup3) (num-of-conjuct3) (conj_exp) (surp-mode3) (db-ratio)  (normalization))

;;expected output
; (: ((((jsd-tv (((minsupport (((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport 
; (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) 
; CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport 
; (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) 
; CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) 
; CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2))
; CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) 
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) 
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) 
; CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) CPUReplaceindex)) msT) CPU))
; ((emp-rule (((minsupport (((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (
; ((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) 
; CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (
; ((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) 
; CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) 
; CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) 
; CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) 
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) 
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU)
; CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) CPUReplaceindex)) msT) CPU)) 
; CPUEMP)) ((est-rule (((minsupport (((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep 
; (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) 
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) 
; ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) 
; CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) 
; CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) 
; CPUReplacevar) CPUConjunctionClean2)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) 
; CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables)
; CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) 
; CPUJoin) CPUReplaceindex)) msT) CPU)) CPUEST)) JSDCPU) 
; (jsd-surp (, (Inheritance $_3756 man) (Inheritance $_3756 ugly) (Inheritance $_3756 sodaDrinker)) 0.8507324751176))






