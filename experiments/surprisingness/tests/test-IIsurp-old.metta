!(import! &self IIsurp_kb)
!(import! &self IIsurp)
; !(import! &self partition)
; !(import!  &self old_surp)
; !(import! &self sub_conc)

!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &db (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))

; !(blk-prob ((Inheritance $x child)) &db 150)

; !(IIsurp-old (, (Inheritance $x human) (Inheritance $x gamer) (Inheritance $x child)  ) &db False)

!(IIsurp-old (,  (Inheritance $x gamer) (Inheritance $x child)  ) &db False)

; !(getConceptProbCall (Inheritance $x child) ((Inheritance $x child) (Inheritance $x gamer) ) &db 150)

; !(get_set_prob_intervals  (,(Inheritance $x gamer) (Inheritance $x child)) &db 190)

; !(IIsurp-old (, (Inheritance $x human) (Inheritance $x writer)  ) &db False)

; !(let $a  (partitions ( (Inheritance $x child) (Inheritance $x writer)  ) ) (isurp-old_ $a &db 150))
; !(// 10 5)
; !(prob (Inheritance $x child) &db 150)

; !(sup-num &db (Inheritance $x child) )

; !(get-prob-func teacher &db (Inheritance $x writer) ( (Inheritance $x human) (Inheritance $x writer)  ) 190)

; !(max-atom (cons-atom () (1 2)))

; !(union-atom (1.0) (1.0 2.0 3.0) )

;!(sub-prob-main (, (Inheritance $x human) (Inheritance $x writer)  ) &db 150 )

; !()

; !(sub-prob-main (, (Inheritance $x teacher) (Inheritance $x writer)  ) &db 150 )

; !(let $sups (collapse (match &db (,(Inheritance $x child) (Inheritance $y human)) (,(Inheritance $x child) (Inheritance $y human)) )) (filter-conjuncts $sups)) 

; !(get-comb-prob (superpose (((Inheritance $x child) (Inheritance $x teacher) (Inheritance $x catOwner)) ((Inheritance $x child) (Inheritance $x teacher) (Inheritance $x dogOwner)))) &db 150)

; !(get-conc-prob-for-sub (Inheritance $x child) &db 150)

; !(collapse (filter-subpatterns-w-subs  (superpose ((Inheritance $x child) (Inheritance $x human))) &db))

;!(collapse (filter-subpatterns-w-subs (superpose ((Inheritance $x human) (Inheritance $x child) (Inheritance $x petOwner))) &db) )

; !(cart-helper (((Inheritance $_98528 human) (child gamer teaDrinker sodaDrinker student petOwner catOwner dogOwner man runner athlete programmer techWorker coffeeDrinker teacher writer artist musician cyclist woman vegetarian adult vegan nonbinaryPerson)) ((Inheritance $_98708 petOwner) (catOwner dogOwner))) () &db)

; !(collapse (filter-subpatterns-wout-subs (superpose ((Inheritance $x human) (Inheritance $x child) (Inheritance $x petOwner))) (((Inheritance $_98654 human) (child gamer teaDrinker sodaDrinker student petOwner catOwner dogOwner man runner athlete programmer techWorker coffeeDrinker teacher writer artist musician cyclist woman vegetarian adult vegan nonbinaryPerson)) ((Inheritance $_98834 petOwner) (catOwner dogOwner))) &db))

; !(map-atom
;                          (1 2 3 4 5)
;                          $s
;                          (+  1 $s))



; !(unique-atom (a a b c d))

; !(let* (
;        ($orInst (collapse (match &db (Inheritance $any child) $any)))
;        ($concepts-raw (collapse (match &db (Inheritance $anyI $anyC) $anyC)))
;        ($concepts (unique-atom $concepts-raw))
;        ($supercons  (SubSuperConcepts $orInst $concepts child super &db ))

       
;        )
;        $supercons

       
;        )


; !(cart-helper ())

;!(let $orInst (collapse (match &db (Inheritance $any human) $any)) $orInst)
; !(SubSuperConcepts  )

;!(coherence human &db Inheritance)=b'