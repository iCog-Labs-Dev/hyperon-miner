 ;; Rule to add candidate patterns to the candidate space
;!(register-module! ../../../hyperon-miner)
;!(import! &dbspace hyperon-miner:experiments:data:sample-data1)
;!(import! &self hyperon-miner:experiments:rules:binding-set)
;!(import! &self hyperon-miner:experiments:rules:shallow-abstraction)
;!(import! &self hyperon-miner:experiments:rules:specialization)
;!(import! &self hyperon-miner:experiments:utils:DeBruijnIndex)
;!(import! &self hyperon-miner:experiments:utils:common-utils)

;!(bind! &shabspace (new-space))
;!(bind! &bindspace (new-space))
;!(bind! &spezspace (new-space))
;!(bind! &cndpspace (new-space))

(= (candidate-pattern $dbspace $spezspace $minsup $cndpspace)
    (match $spezspace (SpecializationOf $pattern ($link $x $y))
        (let $result (sup-eval $dbspace ($link $x $y) $minsup)
            (superpose ( (remove-atom $cndpspace $result) (add-atom $cndpspace $result)))
        )
)
)
 ;; First, let's run the valuation-set function to populate the &bindspace with the binding sets
;!(binding-set Inheritance (And A B) $Y &dbspace &bindspace 1)

 ;; Check if binding sets are inserted correctly
;!(match &bindspace (BindingOf $c $d) (BindingOf $c $d))

 ;; let's run the shallow-abstraction function to calculate the shallow abstraction over both variable X and Y
;!(shallow-abstraction Inheritance (And A B) $Y &dbspace &bindspace &shabspace 1)

 ;; Check if shallow abstractions are inserted correctly
;!(match &shabspace $h $h)

 ;; Let's now run the specialization rule
;!(specialize-pattern Inheritance (And A B) $Y &dbspace &bindspace &shabspace &spezspace 1)

 ;; Check if the specializations are inserted correctly
;!(match &spezspace (SpecializationOf $x $y) (SpecializationOf $x $y))

;!(candidate-pattern &dbspace &spezspace 2 &cndpspace)

;!(match &cndpspace $h $h)
