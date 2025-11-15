; ! (register-module! ../../../hyperon-miner)
; ; ! (import! &db hyperon-miner:experiments:data/sample-data)
; ! (import! &db hyperon-miner:experiments:data/ugly_man_sodaDrinker)
; ! (import! &self hyperon-miner:metta-log:frequent-pattern-miner/build-specialization)
; ! (import! &self hyperon-miner:experiments:utils/index_to_var)
; ! (import! &self hyperon-miner:experiments:utils/common-utils)
; !()

; ! (bind! &kb (new-space))
; ! (bind! &dbspace (new-space))
; ; ! (bind! &testspace (new-space))
; ! (bind! &specspace (new-space))
; ! (bind! &cndpspace (new-space))
; ; ! (bind! &aptrnspace (new-space))
; ; ! (bind! &conjspace (new-space))

; !(let ($link $x $y) (get-atoms &db) (add-atom &dbspace ($link $x $y)))
---------------------------------
;; candidatePattern
---------------------------------
;get candidate patterns based on theri support
;; 1. get the specialized pattern
;; 2. calculate the support of the pattern
;; 3. store as a candidate if the support is greater than the minimum support
;(: (candidatePattern (-> space space Number space Atom)))
; (= (candidatePattern  $dbspace $spezspace $minsup $cndpspace)
;     (match $spezspace (SpecializationOf $specialized $pattern)
;         (let* ( 
;                 ( $specializedvar (replacev $specialized))
;                 ($result (sup-eval $dbspace $specializedvar $minsup))
;             )
;         (if  $result
;             (add-atom $cndpspace (CandidatePattern $specialized))
;             ()
;         )
; )))

; (= (candidatePattern  $dbspace $spezspace $minsup $cndpspace)
;     (match $spezspace (SpecializationOf $specialized $pattern)
;         (let* ( 
;                 ( $specializedvar (replacev $specialized))
;                 ($result (sup-num $dbspace $specializedvar))
;             )
;         (if  (>= $result $minsup)
;             (add-atom $cndpspace (CandidatePattern $specialized $result))
;             ()
;         )
; )))

(= (candidatePattern  $dbspace $spezspace $minsup $cndpspace)
    ; (match $spezspace (SpecializationOf $specialized $pattern))
        (let* ( 
                (() (println! "==== Candidate Pattern started ====="))
                ($specialized (match $spezspace (SpecializationOf $specialized $pattern) $specialized)) ; to avoid the variable capture issue
                (() (println! (here in candidatePattern $specialized)))
                ( $specializedvar (replacev $specialized))
                (() (println! (here in candidatePattern $specializedvar)))
                ($result (sup-num $dbspace $specializedvar))
                ; (() (println! (here in candidatePattern $minsup)))
                ; (() (println! (here in candidatePattern $result)))
                ; ($rem (if  (>= $result $minsup) (remove-atom $cndpspace (CandidatePattern $specialized $result)) ())  )             
                ($add (if (=> $result $minsup) (add-atom $cndpspace (CandidatePattern $specialized $result)) ()))
            ) 
        ; ($add $rem)
         $add
))

; !(build-specialization (Inheritance Z (S Z)) &dbspace &specspace)
; ; !(match &specspace (SpecializationOf $p $q) ($p $q))

; !(candidatePattern &dbspace &specspace 5 &cndpspace)
; !(match &cndpspace (CandidatePattern $p $s) (CandidatePattern $p $s))