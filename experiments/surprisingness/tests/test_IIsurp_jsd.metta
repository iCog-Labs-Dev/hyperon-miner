!(import! &self ../../data/II_surp_kb/kb1)
!(import! &self ../../utils/surp-utils/IIsurp_utils)
!(import! &self ../../utils/surp-utils/IIsurp_avrg)
!(import! &self ../IIsurp_jsd)


!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &db (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))

;output ((TruthValue 0.0008229836899595981 0.3352354550674603) (TruthValue 0 0.34522720801070966))
!(IIsurp-pln (, (Inheritance $x human)
   (Inheritance $x gamer)
) &db)

