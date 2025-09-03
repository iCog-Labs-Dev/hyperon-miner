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

;! (cog-mine &db &kb (min-sup) (surp-mode) (db-ratio) 1 1)
!(init-params  &kb &db  (min-sup) (db-ratio) )
!(frequent-miner &db &kb (num-of-conjuct))
;!(syn $kb (S Z) (: $prf (equals 4 4)))

!(remove-ashtag (match &kb $x $x))






