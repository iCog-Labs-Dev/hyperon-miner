; !(import! &self ../../data/II_surp_kb/kb1)
!(import! &self ../../data/II_surp_kb/state_count)
!(import! &self ../../utils/surp-utils/IIsurp_utils)
!(import! &self ../IIsurp-old)


!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &db (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))




!(assertEqual (IIsurp-old (, (Inheritance $x California)
   (Inheritance $x coffeeDrinker)
) &db True ) 4.811589161216016e-05)


!(assertEqual (IIsurp-old (, (Inheritance $x California)
   (Inheritance $x surfer)
) &db True ) 0.00011281104175734944)



