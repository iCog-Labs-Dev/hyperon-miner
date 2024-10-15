;!(register-module! ../../../hyperon-miner)
;!(import! &dbspace hyperon-miner:experiments:data:sample-data1)
;!(import! &self hyperon-miner:experiments:rules:binding-set)
;!(bind! &shabspace (new-space))
;!(bind! &bindspace (new-space))

;; Function to retrive shallow abstraction over all variables of a pattern from a valuation space
(= (shallow-abstraction $link $x $y $dbspace $bindspace $shabspace $depth)
  (match $dbspace ($link $x $y)
    (if (== $depth 0)
      (superpose(
            (superpose((remove-atom $shabspace ($link $x z))(add-atom $shabspace ($link $x z))))
            (superpose((remove-atom $shabspace ($link $y (s z)))(add-atom $shabspace ($link $y (s z)))))
          )
      )
      (if (and (== (get-metatype $x) Symbol) (== (get-metatype $y) Expression))
          (superpose(
            (superpose((remove-atom $shabspace ($link $x z))(add-atom $shabspace ($link $x z))))
            (let ($link1 $s $t) $y (
                superpose(
                    (superpose((remove-atom $shabspace ($link ($link1 $s) (s z)))(add-atom $shabspace ($link ($link1 $s) (s z)))))
                    (superpose((remove-atom $shabspace ($link ($link1 $t) (s (s z))))(add-atom $shabspace ($link ($link1 $t) (s (s z))))))
                  )
                )
            )
          ))
          (if (and (== (get-metatype $x) Expression)(== (get-metatype $y) Symbol))
              (superpose(
                (let ($link1 $s $t) $x (superpose(
                      (superpose((remove-atom $shabspace ($link ($link1 $s) z))(add-atom $shabspace ($link ($link1 $s) z))))
                      (superpose((remove-atom $shabspace ($link ($link1 $t) (s z)))(add-atom $shabspace ($link ($link1 $t) (s z)))))
                    )
                  )
                )
                (superpose((remove-atom $shabspace ($link $y (s (s z))))(add-atom $shabspace ($link $y (s (s z))))))
              ))
            (if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Expression))
                (superpose (
                   (let ($link1 $s $t) $x (superpose (
                          (superpose ((remove-atom $shabspace ($link ($link1 $s) z)) (add-atom $shabspace ($link ($link1 $s) z))))
                          (superpose ( (remove-atom $shabspace ($link ($link1 $t) (s z))) (add-atom $shabspace ($link ($link1 $t) (s z)))))
                        )
                     )
                    )
                    (let ($link1 $s $t) $y (superpose (
                           (superpose ( (remove-atom $shabspace ($link ($link1 $s) (s (s z)))) (add-atom $shabspace ($link ($link1 $s) (s (s z))))))
                           (superpose ( (remove-atom $shabspace ($link ($link1 $t) (s (s (s z))))) (add-atom $shabspace ($link ($link1 $t) (s (s (s z)))))))
                        )
                      )
                    )
                ))
                empty
                )
          )
      )  
    )
  )
)


 ;!(shallow-abstraction Inheritance $X $Y &dbspace &bindspace &shabspace 0)
 ;!(match &shabspace $h $h)
