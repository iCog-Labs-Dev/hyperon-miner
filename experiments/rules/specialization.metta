 ;; Rule to specialization a pattern
 ; ! (register-module! ../../../hyperon-miner)
 ; ! (import! &dbspace hyperon-miner:experiments:data:sample-data)
 ; ! (import! &self hyperon-miner:experiments:rules:valuation-set)
 ; ! (import! &self hyperon-miner:experiments:rules:shallow-abstraction)
 ; ! (bind! &shabspace (new-space))
 ; ! (bind! &valspace (new-space))
 ; ! (bind! &spezspace (new-space))

(= (specialize-pattern $link $x $y $shabspace $spezxspace $spezyspace) (
        superpose (
            (collapse (match $shabspace (ShallowAbstractionOf X $t) (add-atom $spezxspace (SpecializationOf ($link $x $y) ($link $t $y)))))
            (collapse (match $shabspace (ShallowAbstractionOf Y $t) (add-atom $spezyspace (SpecializationOf ($link $x $y) ($link $x $t)))))
        )
)
)

 ;; First, let's run the valuation-set function to populate the &valspace with the valuation sets
 ; !(valuation-set Inheritance $x $y &dbspace &valspace)

 ; ;; Check if valuation sets are inserted correctly
 ; !(match &valspace (ValuationOf $c $d) (ValuationOf $c $d))

 ; ;; let's run the shallow-abstraction function to calculate the shallow abstraction over both variable X and Y
 ; !(shallow-abstraction X Y &valspace &shabspace)

 ; ;; Check if shallow abstractions are inserted correctly
 ; !(match &shabspace (ShallowAbstractionOf $c $d) (ShallowAbstractionOf $c $d))

 ; ;; Let's now run the specialization rule
 ; !(specialize-pattern Inheritance $x $y &shabspace &spezspace)

 ; ;; Check if the specializations are inserted correctly
 ; !(match &spezspace (SpecializationOf $x $y) (SpecializationOf $x $y))