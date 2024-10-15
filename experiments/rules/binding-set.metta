 ;!(register-module! ../../../hyperon-miner)
 ;!(import! &dbspace hyperon-miner:experiments:data:sample-data1)
 ;!(bind! &bindspace (new-space))

 ;; Binding set Implementation
(= (binding-set $link $x $y $dbspace $bindspace $depth) (
        match $dbspace ($link $x $y) (
            if (== $depth 0)
            (superpose (
                    (superpose ( (remove-atom $bindspace (BindingOf z $x)) (add-atom $bindspace (BindingOf z $x))))
                    (superpose ( (remove-atom $bindspace (BindingOf (s z) $y)) (add-atom $bindspace (BindingOf (s z) $y))))
                )
        )
    (if (and (== (get-metatype $x) Symbol) (== (get-metatype $y) Expression))
        (superpose (
                (superpose ( (remove-atom $bindspace (BindingOf z $x)) (add-atom $bindspace (BindingOf z $x))))
                (let ($link1 $s $t) $y (
                        superpose (
                            (superpose ( (remove-atom $bindspace (BindingOf (s z) $s)) (add-atom $bindspace (BindingOf (s z) $s))))
                            (superpose ( (remove-atom $bindspace (BindingOf (s (s z)) $t)) (add-atom $bindspace (BindingOf (s (s z)) $t))))
                        )
                ))
    ))
(if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Symbol))
    (superpose (
            (let ($link1 $s $t) $x (
                    superpose (
                        (superpose ( (remove-atom $bindspace (BindingOf z $s)) (add-atom $bindspace (BindingOf z $s))))
                        (superpose ( (remove-atom $bindspace (BindingOf (s z) $t)) (add-atom $bindspace (BindingOf (s z) $t))))
                    )
            ))
    (superpose ( (remove-atom $bindspace (BindingOf (s (s z)) $y)) (add-atom $bindspace (BindingOf (s (s z)) $y))))
))
(if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Expression))
    (superpose (
            (let ($link1 $s $t) $x (
                    superpose (
                        (superpose ( (remove-atom $bindspace (BindingOf z $s)) (add-atom $bindspace (BindingOf z $s))))
                        (superpose ( (remove-atom $bindspace (BindingOf (s z) $t)) (add-atom $bindspace (BindingOf (s z) $t))))
                    )
            ))
    (let ($link1 $s $t) $y (
            superpose (
                (superpose ( (remove-atom $bindspace (BindingOf (s (s z)) $s)) (add-atom $bindspace (BindingOf (s (s z)) $s))))
                (superpose ( (remove-atom $bindspace (BindingOf (s (s (s z))) $t)) (add-atom $bindspace (BindingOf (s (s (s z))) $t))))
            )
    ))
))
empty
)
)
)

)
)
)

 ;!(binding-set Inheritance $X $Y &dbspace &bindspace 0)
 ;!(match &bindspace $h $h)
