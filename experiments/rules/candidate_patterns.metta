! (register-module! ../../../hyperon-miner)
! (import! &dbspace hyperon-miner:experiments:data:sample-data)
! (import! &dbspac hyperon-miner:experiments:data:samplet)
! (import! &self hyperon-miner:experiments:rules:valuation-set)
! (import! &self hyperon-miner:experiments:rules:shallow-abstraction)
! (import! &self hyperon-miner:experiments:rules:specialization)
! (import! &self hyperon-miner:experiments:utils:common-utils)
! (bind! &shabspace (new-space))
! (bind! &valspace (new-space))
! (bind! &spezxspace (new-space))
! (bind! &spezyspace (new-space))
! (bind! &cndpspacey (new-space))
! (bind! &cndpspacex (new-space))

(= (candidatePattern $dbspace $spezspace $minsup $cndpspace)
    (match $spezspace (SpecializationOf $pattern $specialized)
        (let $result (sup-eval $dbspace $specialized $minsup)
            (if (and (== $result True) (== (already-exists $cndpspace $specialized) False))
                (add-atom $cndpspace $specialized)
                $result
            )))

)
(= (already-exists $space $pattern)
    (let $result (collapse (match $space $pattern $pattern))
        (> (count-atom-element $result) 0)
    ))

 ;; First, let's run the valuation-set function to populate the &valspace with the valuation sets
! (valuation-set Inheritance $x $y &dbspace &valspace)

 ;; Check if valuation sets are inserted correctly
! (match &valspace (ValuationOf $c $d) (ValuationOf $c $d))

 ;; let's run the shallow-abstraction function to calculate the shallow abstraction over both variable X and Y
! (shallow-abstraction X Y &valspace &shabspace)

 ;; Check if shallow abstractions are inserted correctly
! (match &shabspace (ShallowAbstractionOf $c $d) (ShallowAbstractionOf $c $d))

 ;; Let's now run the specialization rule
! (specialize-pattern Inheritance $x $y &shabspace &spezxspace &spezyspace)

 ;; Check if the specializations are inserted correctly
! (match &spezyspace (SpecializationOf $x $y) (SpecializationOf $x $y))
! (match &spezxspace (SpecializationOf $x $y) (SpecializationOf $x $y))

! (candidatePattern &dbspace &spezyspace 2 &cndpspacey)
! (candidatePattern &dbspace &spezxspace 2 &cndpspacex)

! (match &cndpspacey $h $h)
! (match &cndpspacex $h $h)