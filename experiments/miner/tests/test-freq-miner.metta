!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/variable-combinations)

!(import! &self ../../utils/index_to_var)
!(import! &self ../../utils/sort)
!(import! &self ../../utils/surp-utils/blk-abstractness)
!(import! &self ../../utils/surp-utils/partition-metta)
!(import! &self ../../utils/remove_useless_clauses)
!(import! &self ../../frequent-pattern-miner/conjunction-expansion)

; ! (import! &db ../../data/ugly_man_sodaDrinker)
!(import! &db ../../data/very-small-ugly)



;; config kb : load the chainer , rules , system-proofs ....
; !(import! &self  chaining:dtl:backward:curried)
!(import! &kb  ../freq-miner-rules)
!(import! &self  ../system-proofs)
!(import! &self ../freq-miner)

; (: -> (-> Atom Atom Type))

; ;; Initialize hyperparameters            
(= (init-params $kb $db $min-sup $db-ratio )
(superpose
((add-atom $kb (: msT (ms-threshold $min-sup)))
(add-atom $kb (: dbref (db-ref $db)))
(add-atom $kb (: dbr (db-ratio $db-ratio)))
(add-atom $kb (db-ratio $db-ratio))
(add-atom $kb (db-size (db_size $db)))
(add-atom $kb (db-ref $db))
(add-atom $kb (: dbsize (db-size (db_size $db))))
)))

;; define parameters 
(= (min-sup) 2)
(= (db-ratio) 0.5)
(= (num-of-conjuct) 2)


!(init-params &kb &db  (min-sup) (db-ratio) )
!(frequent-miner &db &kb (num-of-conjuct) True)

!(match &kb (: $prf (hasSupport $pattern $sup)) (: $prf (hasSupport $pattern $sup)))

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((((specializationx
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport
; (((supports (specializationabs ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar))) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) 
; CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport  (, (Inheritance Allen Z) (Inheritance Lily Z)) 3))

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((((specializationy
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport
; (((supports (specializationabs ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar))) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU)
; CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport (, (Inheritance Z man) (Inheritance Z ugly)) 2))

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((((specializationy
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport
; (((supports (specializationabs ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar))) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU)
; CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport  (, (Inheritance Z man) (Inheritance Z sodaDrinker)) 2))

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((((specializationy
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport
; (((supports (specializationabs ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar))) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU)
; CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport  (, (Inheritance Z sodaDrinker) (Inheritance Z ugly)) 2))

(= (num-of-conjuct2) 3)


; !(frequent-miner &db &kb (num-of-conjuct2) True)
; !(match &kb (: $prf (hasSupport $pattern $sup)) (: $prf (hasSupport $pattern $sup)))

; (: ((((((supportFormat (((((((((((((((((((conjunction-expand (((((((((((((((((((conjunction-expand ((candidatep (((minsupport (((supports (((((specializationy
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU))
; CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) 
; CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount)
; CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2))
; CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidatep (((minsupport (((supports (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex)
; CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables)
; CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUConjunctionClean1) CPUReplacevar) CPUConjunctionClean2)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport (, (Inheritance Z sodaDrinker) (Inheritance Z ugly) (Inheritance Z man)) 2))
