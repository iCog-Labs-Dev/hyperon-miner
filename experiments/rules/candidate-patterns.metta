 ;; Rule to specialization a pattern
 ; ! (register-module! ../../../hyperon-miner)
 ; ! (import! &dbspace hyperon-miner:experiments:data:sample-data)
 ; ! (import! &self hyperon-miner:experiments:rules:build-specialization)
 ; ! (import! &self hyperon-miner:experiments:utils:common-utils)
 ; ! (bind! &specspace (new-space))
 ; ! (bind! &cndpspace (new-space))
! (import! &self freq-pat)

;steps
; 1. get the specialized pattern
; 2. calculate the support of the pattern
; 3. store as a candidate if the support is greater than the minimum support


;get candidate patterns based on theri support
(= (candidatePattern $dbspace $spezspace $minsup $cndpspace)
    (match $spezspace (SpecializationOf $specialized $pattern)
        (let* (
                ( $specializedvar (replacev $specialized))
                ($result (sup-eval $dbspace $specializedvar $minsup))
            )
        (if (== $result True)
            (add-atom $cndpspace (CandidatePattern $specialized))
            $result
        )

)
)

)

 ; ! (build-specialization (Inheritance Z (S Z)) &dbspace &specspace)

 ; ! (match &specspace (SpecializationOf $x $y) ( $x))

 ; ! (candidatePattern &dbspace &specspace 2 &cndpspace)

 ; ! (match &cndpspace $h $h)