 ;; Rule to specialization a pattern
 ;! (register-module! ../../../hyperon-miner)
 ;! (import! &dbspace hyperon-miner:experiments:data:sample-data1)
 ;! (import! &self hyperon-miner:experiments:rules:binding-set)
 ;! (import! &self hyperon-miner:experiments:rules:shallow-abstraction)
 ;! (bind! &shabspace (new-space))
 ;! (bind! &bindspace (new-space))
 ;! (bind! &spezspace (new-space))

(= (specialize-pattern-helper ($link $x $y) $bindspace $shabspace $var1 $var2 $var3 $var4)
    (if (and (== (get-metatype $x) Symbol) (== (get-metatype $y) Expression))
        (let ($link1 $s $t) $y (
                superpose (
                    (match $bindspace (BindingOf (s z) $s) (match $shabspace ($link ($link1 $s) (s z))
                            ($link $var1 ($link1 $s $var2))))
                    (match $bindspace (BindingOf (s (s z)) $t) (match $shabspace ($link ($link1 $t) (s (s z)))
                            ($link $var1 ($link1 $var2 $t))))
                    (match $bindspace (BindingOf (s z) $s) (match $shabspace ($link ($link1 $s) (s z))
                            ($link $x ($link1 $s $var1))))
                    (match $bindspace (BindingOf (s (s z)) $t) (match $shabspace ($link ($link1 $t) (s (s z)))
                            ($link $x ($link1 $var1 $t))))
                    ($link $var1 ($link1 $var2 $var3))
                    ($link $x ($link1 $var1 $var2))
                )
        )
)
(if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Symbol))
    (let ($link1 $s $t) $x (
            superpose (
                (match $bindspace (BindingOf z $s) (match $shabspace ($link ($link1 $s) z)
                        ($link ($link1 $s $var1) $var2)))
                (match $bindspace (BindingOf (s z) $t) (match $shabspace ($link ($link1 $t) (s z))
                        ($link ($link1 $var1 $t) $var2)))
                (match $bindspace (BindingOf z $s) (match $shabspace ($link ($link1 $s) z)
                        ($link ($link1 $s $var1) $y)))
                (match $bindspace (BindingOf (s z) $t) (match $shabspace ($link ($link1 $t) (s z))
                        ($link ($link1 $s $var1) $y)))
                ($link ($link1 $var1 $var2) $var3)
                ($link ($link1 $var1 $var2) $y)
            )
    )
)
(if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Expression))
    (let* (
            ( ($link1 $s $t) $x)
            ( ($link2 $z $w) $y)
        )
    (superpose (
            (match $bindspace (BindingOf z $s) (match $shabspace ($link ($link1 $s) z)
                    ($link ($link1 $s $var1) ($link2 $var2 $var3))))
            (match $bindspace (BindingOf z $s) (match $shabspace ($link ($link1 $s) z)
                    ($link ($link1 $s $var1) $var2 )))
            (match $bindspace (BindingOf (s z) $t) (match $shabspace ($link ($link1 $t) (s z))
                    ($link ($link1 $var1 $t) ($link2 $var2 $var3))))
            (match $bindspace (BindingOf (s z) $t) (match $shabspace ($link ($link1 $t) (s z))
                    ($link ($link1 $var1 $t) $var2)))
            (match $bindspace (BindingOf z $s) (match $shabspace ($link ($link1 $s) z)
                    ($link ($link1 $s $var1) $y)))
            (match $bindspace (BindingOf (s z) $t) (match $shabspace ($link ($link1 $t) (s z))
                    ($link ($link1 $var1 $t) $y)))
            (match $bindspace (BindingOf (s (s z)) $z) (match $shabspace ($link ($link2 $z) (s (s z)))
                    ($link ($link1 $var1 $var2) ($link2 $z $var3))))
            (match $bindspace (BindingOf (s (s z)) $z) (match $shabspace ($link ($link2 $z) (s (s z)))
                    ($link $var1 ($link2 $z $var2))))
            (match $bindspace (BindingOf (s (s (s z))) $w) (match $shabspace ($link ($link2 $w) (s (s (s z))))
                    ($link ($link1 $var1 $var2) ($link2 $var3 $w))))
            (match $bindspace (BindingOf (s (s (s z))) $w) (match $shabspace ($link ($link2 $w) (s (s (s z))))
                    ($link $var1 ($link2 $var2 $w))))
            (match $bindspace (BindingOf (s (s z)) $z) (match $shabspace ($link ($link2 $z) (s (s z)))
                    ($link $x ($link2 $z $var1))))
            (match $bindspace (BindingOf (s (s (s z))) $w) (match $shabspace ($link ($link2 $w) (s (s (s z))))
                    ($link $x ($link2 $var1 $w))))
            ($link $var1 ($link2 $var2 $var3))
            ($link ($link1 $var1 $var2) $var3)
            ($link ($link1 $var1 $var2) ($link2 $var3 $var4))
            ($link $x ($link2 $var1 $var2))
            ($link ($link1 $var1 $var2) $y)
        )
)
)
(superpose (
        (match $bindspace (BindingOf z $s) (match $shabspace ($link $s z) (SpecializationOf ($link $x $y) ($link $s (s z)))))
        (match $bindspace (BindingOf (s z) $t) (match $shabspace ($link $t (s z)) (SpecializationOf ($link $x $y) ($link z $t ))))
    )
)
)
)
)
)

(= (specialize-pattern $link $x $y $dbspace $bindspace $shabspace $spezspace $depth) (
        if (== $depth 0)
        (superpose (
                (match $bindspace (BindingOf z $s) (match $shabspace ($link $s z) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $s (s z))))))
                (match $bindspace (BindingOf (s z) $t) (match $shabspace ($link $t (s z)) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link z $t )))))
            )
    )
(if (== $depth 1)
    (match $dbspace ($link $x $y)
        (let $spec (specialize-pattern-helper ($link $x $y) $bindspace $shabspace z (s z) (s (s z)) (s (s (s z))))
            (add-atom $spezspace (SpecializationOf ($link $x $y) $spec))
        )
)
(if (== $depth 2)
    ( (match $dbspace ($link $x $y)
            (if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Expression))
                (let* (
                        ($specx (specialize-pattern-helper $x $bindspace $shabspace z (s z) (s (s z)) (s (s (s z)))))
                        ($specy (specialize-pattern-helper $y $bindspace $shabspace (s (s (s (s z)))) (s (s (s (s (s z))))) (s (s (s (s (s (s z)))))) (s (s (s (s (s (s (s z)))))))))
                    )
                (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $specx $specy)))
            )
        empty
    )
)
)
empty
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
