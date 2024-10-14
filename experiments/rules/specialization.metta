 ;; Rule to specialization a pattern
 ;! (register-module! ../../../hyperon-miner)
 ;! (import! &dbspace hyperon-miner:experiments:data:sample-data1)
 ;! (import! &self hyperon-miner:experiments:rules:binding-set)
 ;! (import! &self hyperon-miner:experiments:rules:shallow-abstraction)
 ;! (bind! &shabspace (new-space))
 ;! (bind! &bindspace (new-space))
 ;! (bind! &spezspace (new-space))

(= (specialize-pattern $link $x $y $dbspace $bindspace $shabspace $spezspace $depth) (
        if (== $depth 0)
        (superpose(
                (match $bindspace (BindingOf z $s) (match $shabspace ($link $s z) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $s (s z))))))
                (match $bindspace (BindingOf (s z) $t) (match $shabspace ($link $t (s z)) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link z $t )))))
            )
        )
        (match $dbspace ($link $x $y)
            (if (and (== (get-metatype $x) Symbol) (== (get-metatype $y) Expression))
                (let ($link1 $s $t) $y (
                    superpose(
                        (match $bindspace (BindingOf (s z) $s)(match $shabspace ($link ($link1 $s) (s z))(add-atom $spezspace (SpecializationOf ($link $x $y) ($link z ($link1 $s (s z)))))))
                        (match $bindspace (BindingOf (s (s z)) $t)(match $shabspace ($link ($link1 $t) (s (s z)))(add-atom $spezspace (SpecializationOf ($link $x $y) ($link z ($link1 (s z) $t))))))
                        (match $bindspace (BindingOf (s z) $s)(match $shabspace ($link ($link1 $s) (s z))(add-atom $spezspace (SpecializationOf ($link $x $y) ($link $x ($link1 $s z))))))
                        (match $bindspace (BindingOf (s (s z)) $t)(match $shabspace ($link ($link1 $t) (s (s z)))(add-atom $spezspace (SpecializationOf ($link $x $y) ($link $x ($link1 z $t))))))
                        (add-atom $spezspace (SpecializationOf ($link $x $y)($link z ($link1 (s z) (s (s z))))))
                        (add-atom $spezspace (SpecializationOf ($link $x $y)($link $x ($link1 z (s z)))))
                        )                                        
                    )
                )
                (if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Symbol))
                    (let ($link1 $s $t) $x (
                        superpose(
                            (match $bindspace (BindingOf z $s)(match $shabspace ($link ($link1 $s) z)(add-atom $spezspace (SpecializationOf ($link $x $y) ($link ($link1 $s z) (s z))))))
                            (match $bindspace (BindingOf (s z) $t)(match $shabspace ($link ($link1 $t) (s z))(add-atom $spezspace (SpecializationOf ($link $x $y) ($link ($link1 z $t) (s z))))))
                            (match $bindspace (BindingOf z $s)(match $shabspace ($link ($link1 $s) z)(add-atom $spezspace (SpecializationOf ($link $x $y) ($link ($link1 $s z) $y)))))
                            (match $bindspace (BindingOf (s z) $t)(match $shabspace ($link ($link1 $t) (s z))(add-atom $spezspace (SpecializationOf ($link $x $y) ($link ($link1 $s z) $y)))))
                            (add-atom $spezspace (SpecializationOf ($link $x $y) ($link ($link1 z (s z)) (s (s z)))))
                            (add-atom $spezspace (SpecializationOf ($link $x $y) ($link ($link1 z (s z)) $y)))                                    )                                        
                        )
                    )
                    Empty
                )
            )
        )
    )
)

 ;; First, let's run the valuation-set function to populate the &valspace with the valuation sets
;!(binding-set Inheritance (And A B) $Y &dbspace &bindspace 1)

 ;; Check if valuation sets are inserted correctly
;!(match &bindspace (BindingOf $c $d) (BindingOf $c $d))

 ;; let's run the shallow-abstraction function to calculate the shallow abstraction over both variable X and Y
;!(shallow-abstraction Inheritance (And A B) $Y &dbspace &bindspace &shabspace 1)

 ;; Check if shallow abstractions are inserted correctly
;!(match &shabspace $h $h)

 ;; Let's now run the specialization rule
;!(specialize-pattern Inheritance (And A B) $Y &dbspace &bindspace &shabspace &spezspace 1)

 ;; Check if the specializations are inserted correctly
;!(match &spezspace (SpecializationOf $x $y) (SpecializationOf $x $y))
