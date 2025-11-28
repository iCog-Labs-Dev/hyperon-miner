!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/partition-metta)
!(import! &self ../../utils/binomialMetta)
!(import! &self ../../utils/surp-utils)
!(import! &self ../../utils/beta-dist)
!(import! &self ../../utils/index_to_var)
!(import! &self ../../utils/blk-abstractness)
!(import! &self ../../utils/eq-prob-petta)
!(import! &self ../../utils/constants)
!(import! &self ../../utils/TruthValue)
!(import! &self ../../utils/bs-utils)
!(import! &self ../../utils/boost-pycall)
!(import! &self ../../utils/jsd-helper)
!(import! &self ../../truth-values/emp-tv)
!(import! &self ../../truth-values/est-tv)
!(import! &self ../../data/ugly_man_sodaDrinker)
!(import! &self ../emp-prob)
!(import! &self ../isurp)
!(import! &self ../jsd)



(migrateAtoms (-> %Undefined% %Undefined% Expression %Undefined%))
(= (migrateAtoms $FromSpace $ToSpace $Pattern)
   (collapse (match &self $Pattern  (collapse ((add-atom &kb $Pattern) 
                          (remove-atom &self $Pattern))))))

!(migrateAtoms &self &kb (Inheritance $a $b))
!(===================================)

; !(isurp-old  (,
;       (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker)
;    ) &kb False)

; !(total_counts (, (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker)
;    ) &kb)  ;34220


; !(db_size &kb)  ; 60



; !(n_conjuncts_new (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))) ;3

; !(prob $pattern &kb 34220) ;0.0017533606078316774

; !(partitions  (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))) ;((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker))))

; !(isurp-old_  ((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker)))) &kb 34220) ;(2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)
; !(min-atom (2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)) ;2.4955138491913995e-11
; !(max-atom (2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)) ;4.269824195966485e-08
; !(dst_from_interval 2.4955138491913995e-11 4.269824195966485e-08 0.0017533606078316774) ;0.0017533606078316774

; 
; !(isurp  (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb False 1)

; !(ji_prob_est_interval (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb 1) 

; !((emp-prob-pbs  (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb 7.716049382716049e-05 1))

; !(subsmp-size (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) 60 7.716049382716049e-05)


; !(do-ji-prob ((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker))))
;              (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) 
;              &kb 
;              1)



; !(ji-prob-est ((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker))))
;              (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) 
;              &kb 
;              1)

; !(pro-prob-wout-joint (((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) &kb 1 1)

; !(emp-prob (, (Inheritance $x man)) &kb)  ; 7.716049382716049e-05
; !(universe-count (, (Inheritance $x man)) &kb)
; !(db_size &kb) 
; !(n_conjuncts (, (Inheritance $x man)))
; !((collapse (get-atoms &kb)))
; !(eq-prob (((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb)
; !(emp-prob-pbs (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb 0.0004 1)

; !(subsmp-size (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) 60 86.4)

; !(emp_prob_bs (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb 10 100)
; !(emp_prob_subsmp (, (Inheritance $x human)) &kb 10)
; !(emp-prob (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb)
; !(get-atoms (subsample-py &kb 10))

; !(get-atoms &kb)

; !(generet-random-subsample &kb 3)

; !(index-atom (A B C D) 1)
; !(random-int 0 5)


; !(is-blk-more-abstract ((Inheritance $x man)) ((Inheritance $x ugly)) $x)
; !(partitions-with-pattern ((Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)))

; !(partitions ((Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)))






; !(eq-prob (((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb)



;  !(sort-by-abstraction (((Human $x $y) (Human $x $z)) ((Human $x Chala)) ) $x)


; (((Human $x $y) (Human Abebe $y))  ((Human $x Abeb)))

; (filter-less-abstract $rest $pivot $var)

; !(filter-more-abstract (((Human $x $y) (Human $x $z))) ((Human $x Chala)) $x)

; !(is-blk-more-abstract ((Human $y $x)) ((Human Abebe Chala))  $x)

; !(joint-variables (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) (((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))))
; !(get-var (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $y sodaDrinker)))
; !(get-var (Inheritance $x ugly) )
; !(get-variables-helper-loop ((Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)))

; !(joint-vars-helper  (((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) $x) 

; !(let* (
;    ($pattern (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)))
;    ($partition  (((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))))
;    ($invar (collapse (superpose ($x))))
;    ($_ (println! ("pattenr is " $pattern)))
;    ($_ (println! ("partition is " $partition)))
;    ($_ (println! ("invar is " $invar)))
;    )
;    ()
; )

; !(get-var ((Pattern $x $y) (Pattern $z $z)))
; !(get-variables-from-list ((Pattern $x $y) (Pattern $z Jon $m $z)))
; !(get-variables-helper (Pattern $x $y $z))

; !(union-atom ($x $y) ($y $z))
; !(unique-atom ($x $y $x $z $y))
; !(union-atom ($_5940 $_5946) ($_5958 $_5964 $_5958))

; !(process-pattern ((Pattern $x $y) (Pattern $z $z)) $x)
; !(checkPat ((Pattern $x $y) (Pattern $z $z)))



; !(process-blocks (((Inheritance $x ugly) (Inheritance $x sodaDrinker)) ((Inheritance $x man))) $x &kb 1 1)

; !(find-most-specialized-abstract (((Inheritance $x ugly) (Inheritance $x sodaDrinker)) ((Inheritance $x man))) ((Inheritance $x man)) $x  1)

; !(eq-prob (((Inheritance $x ugly) (Inheritance $x sodaDrinker)) ((Inheritance $x man))) (, (Inheritance $x sodaDrinker) (Inheritance $x man)) &kb)

; !(calculate-prob-for-vars ($x) (((Inheritance $x ugly) (Inheritance $x sodaDrinker)) ((Inheritance $x man))) &kb 1.0)
; !(connected-subpatterns-with-var (((Inheritance $x ugly) (Inheritance $x sodaDrinker)) ((Inheritance $x man))) $x)
; !(sort-by-abstraction (((Inheritance $x ugly) (Inheritance $x sodaDrinker)) ((Inheritance $x man))) $x)

;  !(do-jsd (STV 0.8 0.5555555555555556) (STV 0.7968127490039841 0.5565410199556541) )
!(do-jsd (STV 0.33333333 0.0037359900373599) (STV 0.6666666666666667 0.0074441687344913) )  ;;  0.0.477956919282604
 
; !(boost-math-cdf 801.0000000000001 201.0 0.7)  ;4.354610307986206e-13

; !(boost-math-cdf 801.0 204.9999999999999 0.9)

; !(boost-math-cdf 801.0 204.9999999999999 0.6)
; !(boost-math-cdf 801.0000000000001 201.0 0.8) ;0.5126063633241287




;  !(is-blk-more-abstract ((Human $x $y)) ((Human $x Abebe)) $x)

; !(is-blk-syntax-more-abstract ((Human $x Abebe)) ((Human $x $y)) $x)


; !(validate-unification ((Human @eyob $_6610)) ((Human @eyob Abebe)))

; !(replace ((Human @eyob $_6610)) )