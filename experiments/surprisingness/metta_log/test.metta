!(import! &self ../../utils/metta_log/common-util)
!(import! &self ../../utils/metta_log/partition-metta)
!(import! &self ../../utils/metta_log/binomialMetta)
!(import! &self ../../utils/metta_log/surp-utils)
!(import! &kb ../../data/ugly_man_sodaDrinker)
!(import! &self ./isurp-old)


!(isurp-old  (,
      (Inheritance $x man)
      (Inheritance $x ugly)
      (Inheritance $x sodaDrinker)
   ) &kb False)

; !(total_counts (, (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker)
;    ) &kb)  ;34220


; !(db_size &kb)  ; 60



; !(n_conjuncts_new (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))) ;3

; !(prob $pattern &kb 34220) ;0.0017533606078316774

; !(generet-partition-without-pattern  (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))) ;((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker))))

; !(isurp-old_  ((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker)))) &kb 34220) ;(2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)
; !(min-atom (2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)) ;2.4955138491913995e-11
; !(max-atom (2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)) ;4.269824195966485e-08
; !(dst_from_interval 2.4955138491913995e-11 4.269824195966485e-08 0.0017533606078316774) ;0.0017533606078316774