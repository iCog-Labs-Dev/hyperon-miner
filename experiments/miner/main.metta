(=(min-sup) 2)
(=(surp-mode ) nisurp-old)
(=(db-ratio) 0.5)


(= (cleaner $space $atom)
   (case (match $space $atom $atom)
     (($atom ())
      (Empty (add-atom $space $atom)))))

(= (pattern-miner $db $kb $surp-kb ) (
    let* (
        (() (cog-mine $db $kb (min-sup) (surp-mode) (db-ratio) 1 1))
        ($dummy (collapse (match $kb (: $prf (hasSupport $nptrn $count))  (add-atom $surp-kb (: $prf (hasSupport $nptrn $count))))))
        (() (println! (dummy is $dummy)))
    )    
        (match $surp-kb $x $x)
))
