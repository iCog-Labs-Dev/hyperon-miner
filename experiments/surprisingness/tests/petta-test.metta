!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/partition-metta)
!(import! &self ../../utils/binomialMetta)
!(import! &self ../../utils/surp-utils)
!(import! &self ../../utils/beta-dist)
!(import! &self ../../utils/index_to_var)
!(import! &self ../../utils/blk-abstractness)
!(import! &self ../../utils/eq-prob)
!(import! &self ../../utils/constants)
!(import! &self ../../utils/TruthValue)
!(import! &self ../../truth-values/est-tv)
!(import! &self ../../utils/bs-utils)
; !(import! &self ../../utils/jsd-helper)
!(import! &self ../../truth-values/emp-tv)
!(import! &self ../../data/ugly_man_sodaDrinker)
!(import! &self ../emp-prob)
!(import! &self ../isurp)
; !(import! &self ./jsd)


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

; !(do-jsd  (STV 0.8 0.111111) (STV 0.1 0.5555555555555556))

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
!(partitions-with-pattern ((Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)))
!(===============>>>>========================)
; !(partitions ((Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)))





