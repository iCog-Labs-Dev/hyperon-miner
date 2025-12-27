; !(import! &self ../../data/II_surp_kb/kb1)
!(import! &self ../../data/II_surp_kb/state_count)
!(import! &self ../IIsurp-old)


!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &db (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))

; !(total_counts (, (Inheritance $x child)
;    (Inheritance $x gamer)
; ) &db)

; (assertEqual (IIsurp-old (, (Inheritance $x human)
;    (Inheritance $x gamer)
; ) &db False) 0.0007483996898389545)

; (assertEqual (IIsurp-old (, (Inheritance $x California)
;    (Inheritance $x surfer)
; ) &db True ) 0.0002716356728628236)

!(IIsurp-old (, (Inheritance $x California)
   (Inheritance $x surfer)
) &db True )


; ;Isurp-estimate using partitons 
; ; (4.390335948606563e-07)
; ; 0.00013976579271964888 (IIsurp)
; ; 0.00019934120813923175 (Isurp)

!(IIsurp-old (, (Inheritance $x California)
   (Inheritance $x coffeeDrinker)
) &db True )

; ;Isurp-estimate using partitons 
; ; (4.390335948606563e-07)
; ; 5.961256654336456e-05 (IIsurp distnace)
; ; 0.00029923132900627796 (Isurp distance)

;;================================


   ; (( $pattern_prob ) ($subset-results) ($results-inter ) ($dst) ((- $pattern_prob(car-atom $results-inter))))


;mods in match in IIsurp-old method (true answer)
; surfer
; ((0.00016125131016689502) ((4.844026840954559e-05 1.374733687944652e-05)) ((2.8602183533594195e-07)) (0.00011281104175734944) (0.00016096528833155907))
;coffe drinker

; ((0.00024187696525034252) ((0.00019376107363818236 5.498934751778608e-05)) ((2.8602183533594195e-07)) (4.811589161216016e-05) (0.00024159094341500657))




;;==============

; !(get_set_prob_intervals (, (Inheritance $x California)
;    (Inheritance $x surfer)
; ) &db 5050)








;;=============================

; !(getConceptProb (Inheritance $x California) ( (Inheritance $x California)
;    (Inheritance $x coffeeDrinker)
; )  &db 12403 )

; !(getConceptProb (Inheritance $x California) ( (Inheritance $x California)
;    (Inheritance $x coffeeDrinker)
; )  &db 5050 )

; (0.0001189712176403157 3.376400382490599e-05)
; (0.0004758848705612628 0.00013505601529962397)




;;==============

; !(get-prob-func USA &db (Inheritance $x California) ((Inheritance $x California) 
;    (Inheritance $x surfer) 
; ) 5050)

; !(get-prob-func USA &db (Inheritance $x California) ((Inheritance $x California) 
;    (Inheritance $x coffeeDrinker) 
; ) 5050)


; (0.00014401440144014402 0.484199134199134)
; (0.0005760576057605761 0.484199134199134)

;;================


; !(sup-num &db (, (Inheritance $x USA) 
;    (Inheritance $x surfer) 
; ))

; !(sup-num &db (, (Inheritance $x California) 
  
; ))
; !(sup-num &db (, (Inheritance $x USA) 
  
; ))

; !(get-prob-func USA &db (Inheritance $x Texas) ((Inheritance $x coffeeDrinker) 
;    (Inheritance $x Texas) 
; ) 5050)

; !(sup-num &db (, (Inheritance $x bbqLover ) (Inheritance $x USA )) )

; !(sup-num &db (, (Inheritance $x coffeeDrinker ) (Inheritance $x USA )) )


; !(getConceptProb (Inheritance $x surfer) ((Inheritance $x California)
;    (Inheritance $x surfer) 
; ) &db 5050)