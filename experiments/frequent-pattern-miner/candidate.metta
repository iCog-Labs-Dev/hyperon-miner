; ! (register-module! ../../experiments)
; !(import! &self experiments:utils:common-utils)
; !(import! &self experiments:frequent-pattern-miner:valuation)
; !(import! &self experiments:frequent-pattern-miner:shallow-abstractions)
; !(import! &self experiments:frequent-pattern-miner:specialization)
; !(import! &db experiments:data:small-ugly)
; ! (import! &self freq-pat)
; ! (bind! &dbspace (new-space))
; ! (bind! &cndpspace (new-space))
; ! (bind! &testspace (new-space))

! (import! &self freq-pat)
; ; ; ! (import! &self conj-exp)

; !(let $x (get-atoms &db) (add-atom &dbspace $x))

(= (candidatePattern $specializations $minsup $dbspace)
        (let* ( 
                (() (println! "==== Candidate Pattern started ====="))
                ( $specializedvar (replacev $specializations))
                (() (println! (here in candidatePattern $specializedvar)))
                ($result (sup-num $dbspace $specializedvar))
                (() (println! (here in candidatePattern $result)))
                ; ($rem (if  (>= $result $minsup) (remove-atom $cndpspace (CandidatePattern $specialized $result)) ())  )             
                ($add (if (>= $result $minsup) $specializedvar ()))
            ) 
        ; ($add $rem)
        $add
))

(= (miner () $dbspace $minsup)
        ()
)

(= (miner $pattern $dbspace $minsup)
        (let*(
                ($vals (collapse (valuation $pattern $dbspace)))
                (() (println! (here in miner $vals)))
                ; ($shallow_abstractions (shallow_abstractions $vals))
                ($shallow_abstractions (unique (shallow_abstractions $vals () 0)))
                (() (println! (here in miner $shallow_abstractions)))
                ($specialized (specialization $pattern $shallow_abstractions))
                ; (() (println! (here in miner $specialized)))
                ($candidates (candidatePattern $specialized $minsup $dbspace))
                ; (() (println! (here in miner $candidates)))
                (() (println! "==== Candidate Pattern ended ====="))
        )
        ; $specialized
        $candidates
        )
)

; !(miner (Inheritance $x $y) &dbspace 4)


