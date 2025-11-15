! (register-module! ../../experiments)
!(import! &self experiments:utils:common-utils)
!(import! &self experiments:frequent-pattern-miner:valuation)
!(import! &self experiments:frequent-pattern-miner:shallow-abstractions)
!(import! &self experiments:frequent-pattern-miner:specialization)
!(import! &db experiments:data:small-ugly)
! (bind! &dbspace (new-space))

; ! (import! &self freq-pat)
; ; ! (import! &self conj-exp)

!(let $x (get-atoms &db) (add-atom &dbspace $x))

(= (candidatePattern $specializations $minsup)
        (let* ( 
                (() (println! "==== Candidate Pattern started ====="))
                ; ( $specializedvar (replacev $specialized))
                ($result (sup-num $dbspace $specializations))
                (() (println! (here in candidatePattern $result)))
                ; ($rem (if  (>= $result $minsup) (remove-atom $cndpspace (CandidatePattern $specialized $result)) ())  )             
                ($add (if (>= $result $minsup) $result ()))
            ) 
        ; ($add $rem)
        $add
))


