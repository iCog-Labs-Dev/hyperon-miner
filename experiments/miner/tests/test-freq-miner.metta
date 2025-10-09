!(register-module! ../../../experiments)
; !(register-module!  ../../../../chaining)

!(import! &self experiments:miner:freq-miner)
!(import! &self experiments:frequent-pattern-miner:conj-exp)
!(import! &self experiments:frequent-pattern-miner:freq-pat)
!(import! &self experiments:frequent-pattern-miner:use-python)
!(import! &self experiments:utils:variable-combinations)

! (import! &self experiments:utils:common-utils)
! (import! &self experiments:frequent-pattern-miner:build-specialization)
! (import! &self experiments:frequent-pattern-miner:conjunction-expansion)

; ! (import! &dbspace experiments:data:ugly_man_sodaDrinker)
! (import! &dbspace experiments:data:very-small-ugly)



;; config kb : load the chainer , rules , system-proofs ....
; !(import! &self  chaining:dtl:backward:curried)
!(import! &temp   experiments:miner:freq-miner-rules)
!(import! &self  experiments:miner:system-proofs)

;;create new space for kb
!(bind! &kb (new-space)) 
!(bind! &db (new-space)) 

!(let ($link $x $y) (get-atoms &dbspace) (add-atom &db ($link $x $y)))



;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-reduct &kb $atoms) )

(: -> (-> Atom Atom Type))

;; Initialize hyperparameters            
(= (init-params $kb $db $min-sup $db-ratio )
(superpose
((add-atom $kb (: msT (ms-threshold $min-sup)))
(add-atom $kb (: dbref (db-ref $db)))
(add-atom $kb (: dbr (db-ratio $db-ratio)))
(add-atom $kb (db-ratio $db-ratio))
(add-atom $kb (db-size (db_size $db)))
(add-atom $kb (db-ref $db))
(add-reduct $kb (: dbsize (db-size (db_size $db))))
)))

;; define parameters 
(= (min-sup) 2)
(= (db-ratio) 0.5)
(= (num-of-conjuct) 2)


!(init-params &kb &db  (min-sup) (db-ratio) )
(frequent-miner &db &kb (num-of-conjuct))
(match &kb (: $prf (hasSupport $pattern $sup)) (: $prf (hasSupport $pattern $sup)))

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationx
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport 
; (((support (((((specializationx ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation)
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT)
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar)
; CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)
; (hasSupport (, (Inheritance Allen Z) (Inheritance Lily Z)) 3))

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationy
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport
; (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation)
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT)
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar)
; CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)
; (hasSupport (, (Inheritance Z man) (Inheritance Z ugly)) 2))

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationy 
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport
; (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation)
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT)
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar)
; CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)
; (hasSupport (, (Inheritance Z man) (Inheritance Z sodaDrinker)) 2))

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((candidate (((minsupport (((support (((((specializationy
; ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar))
; CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport
; (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation)
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT)
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar)
; CPUConjunctionClean)) CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin)
; (hasSupport (, (Inheritance Z sodaDrinker) (Inheritance Z ugly)) 2))

(= (num-of-conjuct2) 3)


!(frequent-miner &db &kb (num-of-conjuct2))
!(match &kb (: $prf (hasSupport $pattern $sup)) (: $prf (hasSupport $pattern $sup)))

; (: ((((((supportFormat ((((((((((((((((((conjunction-expand ((((((((((((((((((conjunction-expand ((candidate (((minsupport
; (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation)
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) maxClauses)
; CPUequals) ((candidate (((minsupport (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar))
; CPUReplaceindex) CPUHandleValuation) CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar))
; CPUReplaceindex) CPUCount) CPUequals) msT) CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables)
; CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean)) CPUReplaceindex) CPUCount) maxClauses) CPUequals) ((candidate (((minsupport
; (((support (((((specializationy ((((abstract-pattern CPUUnique) msT) CPU) CPUReplacevar)) CPUReplaceindex) CPUHandleValuation)
; CPUHandleNestedExp) CPUReplacevar)) CPUReplaceindex) CPUCounter)) msT) CPU)) CPUReplacevar)) CPUReplaceindex) CPUCount) CPUequals) msT)
; CPUGetPatternVariables) CPUGetPatternVariables) CPUCombineVariables) CPUSubstituteVariables) CPUCounter) CPU) CPUReplacevar) CPUConjunctionClean))
; CPUCount) maxClauses) CPU) CPUSortConjunctions) CPUJoin) 
; (hasSupport (, (Inheritance Z man) (Inheritance Z sodaDrinker) (Inheritance Z ugly)) 2))