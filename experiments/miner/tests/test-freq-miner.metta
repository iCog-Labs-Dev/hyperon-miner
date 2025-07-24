!(register-module! ../../../experiments)
; !(register-module!  ../../../../chaining)

!(import! &self experiments:miner:freq-miner)
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

!(let ($link $x $y) (get-atoms &dbspace) (add-atom &db ($link $x $y)))



;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-reduct &kb $atoms) )

; !(add-atom &kb (: candidate (candidatePattern (Inheritance Z ugly))))
; ; !(add-atom &kb (: candidate (candidatePattern ())))
; !(add-atom &kb (: candidate (candidatePattern (Inheritance Z sodaDrinker))))
(: -> (-> Atom Atom Type))


;; define parameters 
(=(min-sup) 2)
(=(surp-mode ) nisurp-old)
(=(db-ratio) 0.5)
; !(add-atom &kb (: msT (ms-threshold 2)))
; !(add-atom &kb (: SUP (supportOf $ptrn 5)))

; !(init-miner &db &kb (min-sup) (surp-mode) (db-ratio))

;; test the cog-miner
;; without sorting 
; ! (cog-mine &db &kb (min-sup) (surp-mode) (db-ratio) )
! (cog-mine &db &kb (min-sup) (surp-mode) (db-ratio) 1 1)
; !(union-atom () (1 2 3 4 5 6 7 8 9 10))


; !(syn &kb (fromNumber 0) (: $prf (uniqueLink $pattern $cnt))) 
; !(syn &kb (fromNumber 0) (: $prf (valuation X (Inheritance $x $y) $val))) 
; !(syn &kb (fromNumber 0) (: $prf (valuation Y (Inheritance $x $y) $val))) 
; !(abstract (fromNumber 5) &kb)
; !(specialization (fromNumber 3) &kb)
; !(support (fromNumber 4) &kb)
; !(let $atom  (: candidate (-> (minsup $ptrn) (-> (replace_variables $ptrn) (candidatePattern $ptrn)))) (add-atom &kb $atom) )
; !(candidate (fromNumber 5) &kb)
; !(let $atom  (: candidate (-> (minsup $ptrn) (-> (replace_variables $ptrn) (candidatePattern $ptrn)))) (remove-atom &kb $atom) )
; !(conjunction (fromNumber 11) &kb 1 2)
; 

; !(match &kb $x $x)
;!(get-metatype (@doc random-int (@desc "Returns random int number from range defined by two numbers (first and second argument)")))

;;add the rb ref to the kb 
;;!(add-atom &kb (rb-ref &rb))



(: Grounded Type)
(: check Grounded)
(=(check $v) (> $v 3))



