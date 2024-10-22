 ;!(register-module! ../../../hyperon-miner)
 ;!(import! &dbspace hyperon-miner:experiments:data:sample-data1)
 ;!(import! &self hyperon-miner:experiments:rules:binding-set)
 ;!(bind! &shabspace (new-space))
 ;!(bind! &bindspace (new-space))
(= (shallow-abstraction-helper ($link $x $y))
    (if (and (== (get-metatype $x) Symbol) (== (get-metatype $y) Expression))
        (superpose (
                ($link $x z)
                (let ($link1 $s $t) $y (
                        superpose (
                            ($link ($link1 $s) (s z))
                            ($link ($link1 $t) (s (s z)))
                        )
                )
        )
))
(if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Symbol))
    (superpose (
            (let ($link1 $s $t) $x (superpose (
                        ($link ($link1 $s) z)
                        ($link ($link1 $t) (s z))
                    )
            )
    )
($link $y (s (s z)))
))
(if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Expression))
    (superpose (
            (let* (
                    ( ($link1 $s $t) $x)
                    ( ($link2 $z $w) $y)
                ) (superpose (
                    ($link ($link1 $s) z)
                    ($link ($link1 $t) (s z))
                    ($link ($link2 $z) (s (s z)))
                    ($link ($link2 $z) (s (s (s z))))
                )
        )
)

))
(superpose (
        ($link $x z)
        ($link $y (s z))
    ))
)
)
)
)
 ;; Function to retrive shallow abstraction over all variables of a pattern from a valuation space
(= (shallow-abstraction $link $x $y $dbspace $bindspace $shabspace $depth)
    (match $dbspace ($link $x $y)
        (if (== $depth 0)
            (superpose (
                    (superpose ( (remove-atom $shabspace ($link $x z)) (add-atom $shabspace ($link $x z))))
                    (superpose ( (remove-atom $shabspace ($link $y (s z))) (add-atom $shabspace ($link $y (s z)))))
                )
        )
    (if (== $depth 1)
        (let $shab (shallow-abstraction-helper ($link $x $y) )
            (superpose ( (remove-atom $shabspace $shab) (add-atom $shabspace $shab)))
             ; $binding
        )
    (if (== $depth 2)
        (let* (
                ($shabx (shallow-abstraction-helper $x ))
                ($shaby (shallow-abstraction-helper $y ))
            )
        (superpose (
                (superpose ( (remove-atom $shabspace $shabx) (add-atom $shabspace $shabx)))
                (superpose ( (remove-atom $shabspace $shaby) (add-atom $shabspace $shaby)))
            ))
)
empty
)

)
)
)
)

 ;!(shallow-abstraction Inheritance $X $Y &dbspace &bindspace &shabspace 0)
 ;!(match &shabspace $h $h)
