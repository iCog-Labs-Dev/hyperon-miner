!(import! &self ../../data/II_surp_kb/kb1)
!(import! &self ../IIsurp-old)


!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &db (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))

; !(total_counts (, (Inheritance $x child)
;    (Inheritance $x gamer)
; ) &db)

!(IIsurp-old (, (Inheritance $x human)
   (Inheritance $x gamer)
) &db False)