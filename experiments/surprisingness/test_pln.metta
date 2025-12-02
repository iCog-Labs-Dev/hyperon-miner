; !(import! &self IIsurp_kb )

; !(import! &self IIsurp_kb )

; !(import! &self avrg_tv)
; !(import! &self disease)
; !(import! &self pln_iisurp)
!(import! &self comp_pln)

!(import! &self test_kb)

; !(import! &self ffs_iisurp)


!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &db (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))




!(IIsurp-pln (, (Inheritance $x child)
   (Inheritance $x gamer)
) &db)

; !(IIsurp-old (, (Inheritance $x BreastCancer)
;    (Inheritance $x BRCA1)
;    (Inheritance $x PIK3CA)) &db False)

; !(get_set_prob_intervals (, (Inheritance $x human ) (Inheritance $x gamer )) &db 190 )


; !(get_set_prob_intervals (, (Inheritance $x BreastCancer)
;    (Inheritance $x BRCA1)
;    (Inheritance $x PIK3CA)) &db 190 )

; !(coherence human &db Inheritance )

; !(getConceptProb (Inheritance $x child ) ( (Inheritance $x child ) (Inheritance $x gamer )) &db 190)