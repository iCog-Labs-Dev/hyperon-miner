!(register-module! ../../../hyperon-miner)
!(import! &dbspace hyperon-miner:experiments:data:sample-data)
!(import! &self hyperon-miner:experiments:rules:valuation-set)
!(bind! &shabspace (new-space))
!(bind! &valspace (new-space))

;; Function to construct shallow abstraction over variable X
(= (shabsX $db $x) (collapse(match $db (ValuationOf $x $z) (add-atom &shabspace (ShallowAbstractionOf $x $z)))))

;; Function to construct shallow abstraction over variable Y
(= (shabsY $db $y) (collapse(match $db (ValuationOf $y $t) (add-atom &shabspace (ShallowAbstractionOf $y $t)))))

;; Function to retrive shallow abstraction over all variables of a pattern from a valuation space
(= (shallow-abstraction $rel $x $y $db)
(superpose ((collapse(match $db (ValuationOf $x $z) (add-atom &shabspace (ShallowAbstractionOf $x $z))))
    (collapse(match $db (ValuationOf $y $t) (add-atom &shabspace (ShallowAbstractionOf $y $t))))
    (let $t (match $db (, (ValuationOf $x $c) (ValuationOf $y $c)) True) (if (== $t True) (add-atom &shabspace (ShallowAbstractionOf $x $y)) Empty))
    )
)
)

;; Testing shallow abstraction

;; First, let's run the valuation-set function to populate the &valspace with the valuation sets
! (valuation-set Inheritance $x $y &dbspace &valspace)

;; Check if valuation sets are inserted correctly
!(match &valspace (ValuationOf $c $d) (ValuationOf $c $d))

;; test shallow-abstraction function now
!(shallow-abstraction Inheritance X Y &valspace)

;; Check if shallow abstractions are inserted correctly
!(match &shabspace (ShallowAbstractionOf $c $d) (ShallowAbstractionOf $c $d))

