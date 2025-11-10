!(register-module! ../../experiments)

!(import! &self experiments:rules:conj-exp)
!(import! &self experiments:rules:freq-pat)
!(import! &self experiments:rules:use-python)
!(import! &self experiments:utils:variable-combinations)

! (import! &self experiments:utils:common-utils)
! (import! &self experiments:rules:build-specialization)
! (import! &self experiments:rules:conjunction-expansion)
! (import! &self experiments:miner:freq-miner)

! (import! &dbspace experiments:data:ugly_man_sodaDrinker)

!(import! &temp   experiments:miner:freq-miner-rules)
!(import! &self  experiments:miner:system-proofs)

;;create new space for kb
!(bind! &kb (new-space)) 
!(bind! &db (new-space)) 


;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-reduct &kb $atoms) )

(: -> (-> Atom Atom Type))


(= (init-miner $db $kb $ms)
    (         let* (  
                 (() (add-atom $kb (: msT (ms-threshold $ms))))
                 (() (add-atom $kb (: dbref (db-ref $db))))
                 (() (add-atom $kb (: dbr (db-ratio $db-ratio))))
                 (() (add-atom &self (kb-ref $kb)))
                 (() (add-atom $kb (db-ref $db)))
                )()))



; define parameters 



(= (test_AB_AC $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms)) 
        ($dbadd1 (add-atom $db (Inheritance A B)))
        ($dbadd2 (add-atom $db (Inheritance A C)))
        ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem1 (remove-atom $db (Inheritance A B)))
        ($dbrem2 (remove-atom $db (Inheritance A C)))
        ($cnd (match $kb (: $prf (candidatePattern $ptrn $cnt)) $ptrn))
    )$cnd)
)
; !(assertEqual (subtraction (test_AB_AC &db &kb 2 2 False) (superpose ((Inheritance Z (S Z)) (Inheritance A Z)))) (superpose ())) 
; !(test_AB_AC &db &kb 2 2 False)

(= (test_AB_AC_BC $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms)) 
        ($dbadd1 (add-atom $db (Inheritance A B)))
        ($dbadd2 (add-atom $db (Inheritance A C)))
        ($dbadd3 (add-atom $db (Inheritance B C)))
        ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem1 (remove-atom $db (Inheritance A B)))
        ($dbrem2 (remove-atom $db (Inheritance A C)))
        ($dbrem3 (remove-atom $db (Inheritance B C)))
        ($cnd (match $kb (: $prf (candidatePattern $ptrn $cnt)) $ptrn))
    )$cnd)
)

; !(assertEqual (subtraction (test_AB_AC_BC &db &kb 2 2 False) (superpose ((Inheritance Z (S Z)) (Inheritance Z C) (Inheritance A Z)))) (superpose ()))
; !(subtraction (test_AB_AC_BC) (superpose ((Inheritance Z C) (Inheritance A Z))))
; !(test_AB_AC_BC &db &kb 2 2 False)

(= (test_AB_ABC $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms)) 
        ($dbadd1 (add-atom $db (Inheritance A B)))
        ($dbadd2 (add-atom $db (Inheritance A (And B C))))
        ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem1 (remove-atom $db (Inheritance A B)))
        ($dbrem2 (remove-atom $db (Inheritance A (And B C))))
        ($cnd (match $kb (: $prf (candidatePattern $ptrn $cnt)) $ptrn))
    )$cnd)
)

; !(assertEqual (subtraction (unique (test_AB_ABC &db &kb 2 2 False)) (superpose ((Inheritance A Z) (Inheritance Z (S Z))))) (superpose ()))

; !(test_AB_ABC &db &kb 2 2 False)

(= (test_ABCD $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms))
        ($dbadd1 (add-atom $db (Inheritance A B)))
        ($dbadd2 (add-atom $db (Inheritance C D)))
        ($dbadd3 (add-atom $db (Inheritance E F)))
        ($dbadd4 (add-atom $db (Inheritance G H)))
        ($dbadd5 (add-atom $db (Implication (Inheritance A B) (Inheritance C D))))
        ($dbadd6 (add-atom $db (Implication (Inheritance E F) (Inheritance G H))))
        ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem1 (remove-atom $db (Inheritance A B)))
        ($dbrem2 (remove-atom $db (Inheritance C D)))
        ($dbrem3 (remove-atom $db (Inheritance E F)))
        ($dbrem4 (remove-atom $db (Inheritance G H)))
        ($dbrem5 (remove-atom $db (Implication (Inheritance A B) (Inheritance C D))))
        ($dbrem6 (remove-atom $db (Implication (Inheritance E F) (Inheritance G H))))
        ($cnd (match $kb (: $prf (candidatePattern $ptrn $cnt)) $ptrn))
    )
$cnd
    )
)

; !(assertEqual (subtraction (test_ABCD &db &kb 2 2 False) (superpose ((Implication Z (S Z)) (Implication Z (Inheritance (S Z) (S (S Z)))) (Implication (Inheritance Z (S Z)) (S (S Z))) (Implication (Inheritance Z (S Z)) (Inheritance (S (S Z)) (S (S (S Z))))) (Inheritance Z (S Z))))) (superpose ()))
; !(test_ABCD &db &kb 2 2 False)

(= (test_ABAB $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms))
        ($dbadd1 (add-atom $db (Inheritance A B)))
        ($dbadd2 (add-atom $db (Inheritance B C)))
        ($dbadd5 (add-atom $db (Implication (Inheritance A B) (Inheritance A B))))
        ($dbadd6 (add-atom $db (Implication (Inheritance B C) (Inheritance B C))))
         ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem1 (remove-atom $db (Inheritance A B)))
        ($dbrem2 (remove-atom $db (Inheritance B C)))
        ($dbrem5 (remove-atom $db (Implication (Inheritance A B) (Inheritance A B))))
        ($dbrem6 (remove-atom $db (Implication (Inheritance B C) (Inheritance B C))))
        ($cnd (match $kb (: $prf (candidatePattern $ptrn $cnt)) $ptrn))
    )
$cnd
    )
)

; !(assertEqual (intersection (test_ABAB &db &kb 2 2 False) (superpose ((Implication (Inheritance Z (S Z)) (Inheritance Z (S Z)))))) (superpose ((Implication (Inheritance Z (S Z)) (Inheritance Z (S Z))))))
; !(test_ABAB &db &kb 2 2 False)

(= (test_AAAA $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms))
        ($dbadd5 (add-atom $db (Implication (Inheritance A A) (Inheritance A A))))
        ($dbadd6 (add-atom $db (Implication (Inheritance B B) (Inheritance B B))))
         ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem5 (remove-atom $db (Implication (Inheritance A A) (Inheritance A A))))
        ($dbrem6 (remove-atom $db (Implication (Inheritance B B) (Inheritance B B))))
       ($cnd (match $kb (: $prf (candidatePattern $ptrn $cnt)) $ptrn))
    )
$cnd
    )
)

; !(test_AAAA &db &kb 2 2 False)
; !(assertEqual (intersection (test_AAAA) (superpose ((Implication (Inheritance Z Z) (Inheritance Z Z))))) (superpose ((Implication (Inheritance Z Z) (Inheritance Z Z)))))


(= (test_transitivity $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms))
        ($dbadd1 (add-atom $db (Inheritance A B)))
        ($dbadd2 (add-atom $db (Inheritance B C)))
         ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem1 (remove-atom $db (Inheritance A B)))
        ($dbrem2 (remove-atom $db (Inheritance B C)))
        ($cnd (match $kb (: $prf (hasSupport $ptrn $cnt)) $ptrn))
    )$cnd)
)

; !(test_transitivity &db &kb 2 2 True)
; !(assertEqual (intersection (test_transitivity &db &kb 2 2 True) (superpose ((, (Inheritance Z (S Z)) (Inheritance (S Z) (S (S Z))))))) (superpose ((, (Inheritance Z (S Z)) (Inheritance (S Z) (S (S Z)))))))



(= (test_long_transitivity $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms))
        ($dbadd1 (add-atom $db (Inheritance A B)))
        ($dbadd2 (add-atom $db (Inheritance B C)))
        ($dbadd2 (add-atom $db (Inheritance C D)))
         ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem1 (remove-atom $db (Inheritance A B)))
        ($dbrem2 (remove-atom $db (Inheritance B C)))
        ($dbrem2 (remove-atom $db (Inheritance C D)))
        ($cnd (match $kb (: $prf (hasSupport $ptrn $cnt)) $ptrn))
    )$cnd)
)

; !(test_long_transitivity &db &kb 2 3 True)
; !(assertEqual (intersection (test_long_transitivity &db &kb 2 3 True) (superpose ((, (, (Inheritance Z (S Z)) (Inheritance (S Z) (S (S Z)))) (Inheritance (S (S Z)) (S (S (S Z)))))))) (superpose ((, (, (Inheritance Z (S Z)) (Inheritance (S Z) (S (S Z)))) (Inheritance (S (S Z)) (S (S (S Z))))))))


(= (test_SodaDrinker_incremental)
    (let* (
        (($link $x $y) (get-atoms &dbspace))
        ($add (add-atom &testspace ($link $x $y)))
        ($res (collapse (frequency-pattern-miner &testspace &specspace &cndpspace &aptrnspace &conjspace 5 1 False)))
        ($cnd (match &cndpspace (CandidatePattern $pattern $cnt) $pattern))
    )$cnd)
)

; !(assertEqual (intersection (test_SodaDrinker_incremental) (superpose ((, (, (Inheritance Z man) (Inheritance Z sodaDrinker)) (Inheritance Z ugly))))) (superpose ((, (, (Inheritance Z man) (Inheritance Z sodaDrinker)) (Inheritance Z ugly)))))




