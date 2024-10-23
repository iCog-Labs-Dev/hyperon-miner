 ; ! (register-module! ../../../hyperon-miner)
 ; ! (import! &dbspace hyperon-miner:experiments:data:sample-data1)
 ; ! (bind! &bindspace (new-space))
(= (binding-set-helper ($link $x $y) $var1 $var2 $var3 $var4)
    (if (and (== (get-metatype $x) Symbol) (== (get-metatype $y) Expression))
        (superpose (
                (BindingOf $var1 $x)
                (let ($link1 $s $t) $y (
                        superpose (
                            (BindingOf $var2 $s)
                            (BindingOf $var3 $t)
                        )
                ))
    ))
(if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Symbol))
    (superpose (
            (let ($link1 $s $t) $x (
                    superpose (
                        (BindingOf $var1 $s)
                        (BindingOf $var2 $t)
                    )
            ))
    (BindingOf $var3 $y)
))
(if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Expression))

    (let* (
            ( ($link1 $s $t) $x)
            ( ($link2 $z $w) $y)
        )
    (superpose (
            (BindingOf $var1 $s)
            (BindingOf $var2 $t)
            (BindingOf $var3 $z)
            (BindingOf $var4 $w)
        )
)

)
(superpose (
        (BindingOf $var1 $x)
        (BindingOf $var2 $y)
    ))
))
)
)
 ;; Binding set Implementation
(= (binding-set $link $x $y $dbspace $bindspace $depth)
    (superpose (
            (println! ($depth))
            (match $dbspace ($link $x $y)
                (if (== $depth 0)
                    (superpose (
                            (superpose ( (remove-atom $bindspace (BindingOf z $x)) (add-atom $bindspace (BindingOf z $x))))
                            (superpose ( (remove-atom $bindspace (BindingOf (s z) $y)) (add-atom $bindspace (BindingOf (s z) $y))))
                        )
                )
            (if (== $depth 1)
                (let $binding (binding-set-helper ($link $x $y) z (s z) (s (s z)) (s (s (s z))))
                    (superpose ( (remove-atom $bindspace $binding) (add-atom $bindspace $binding)))
                     ; $binding
                )
            (if (== $depth 2)
                (if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Expression))
                    (let* (
                            ($bindingx (binding-set-helper $x z (s z) (s (s z)) (s (s (s z)))))
                            ($bindingy (binding-set-helper $y z (s z) (s (s z)) (s (s (s z)))))
                        )
                    (superpose (
                            (superpose ( (remove-atom $bindspace $bindingx) (add-atom $bindspace $bindingx)))
                            (superpose ( (remove-atom $bindspace $bindingy) (add-atom $bindspace $bindingy)))
                        ))
            )
        empty
    )
empty
)

)
)
)
))
)
 ; ! (binding-set Inheritance $X $Y &dbspace &bindspace 1)
 ; ! (match &bindspace $h $h)
