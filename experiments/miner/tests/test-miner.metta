!(register-module! ../../../experiments)
; !(register-module!  ../../../../chaining)

!(import! &self experiments:miner:freq-miner)
!(import! &self experiments:miner:main)
!(import! &self experiments:rules:conj-exp)
!(import! &self experiments:rules:freq-pat)
!(import! &self experiments:rules:use-python)
!(import! &self experiments:utils:variable-combinations)

! (import! &self experiments:utils:common-utils)
! (import! &self experiments:rules:build-specialization)
! (import! &self experiments:rules:conjunction-expansion)

; ! (import! &dbspace experiments:data:ugly_man_sodaDrinker)
! (import! &dbspace experiments:data:small-ugly)



;; config kb : load the chainer , rules , system-proofs ....
; !(import! &self  chaining:dtl:backward:curried)
!(import! &temp   experiments:miner:freq-miner-rules)
!(import! &self  experiments:miner:system-proofs)

;;create new space for kb
!(bind! &kb (new-space)) 
!(bind! &db (new-space)) 
!(bind! &surp-kb  (new-space)) 


!(let ($link $x $y) (get-atoms &dbspace) (add-atom &db ($link $x $y)))



;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-reduct &kb $atoms) )

; !(add-atom &kb (: candidate (candidatePattern (Inheritance Z ugly))))
; ; !(add-atom &kb (: candidate (candidatePattern ())))
; !(add-atom &kb (: candidate (candidatePattern (Inheritance Z sodaDrinker))))
(: -> (-> Atom Atom Type))

!(pattern-miner &db &kb &surp-kb )


