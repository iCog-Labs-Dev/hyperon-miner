!(import! &self ../../utils/metta_log/common-util)
; !(import! &self ../../utils/metta_log/partition-metta)
; !(import! &self ../../utils/metta_log/binomialMetta)
; !(import! &self ../../utils/metta_log/surp-utils)
!(import! &self ../../utils/metta_log/beta-dist)
; !(import! &self ../../utils/metta_log/index_to_var)
; !(import! &self ../../utils/metta_log/blk-abstractness)
; !(import! &self ../../utils/metta_log/eq-prob)
!(import! &self ../../utils/metta_log/constants)
!(import! &self ../../utils/metta_log/TruthValue)
; !(import! &self ../../truth-values/metta_log/est-tv)
; !(import! &self ../../utils/metta_log/bs-utils)
!(import! &self ../../utils/metta_log/jsd-helper)
; !(import! &self ../../truth-values/metta_log/emp-tv)
; !(import! &kb ../../data/ugly_man_sodaDrinker)
; !(import! &self ./emp-prob)
; !(import! &self ./isurp)
!(import! &self ./jsd)


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

; !(generet-partition-without-pattern  (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker))) ;((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker))))

; !(isurp-old_  ((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker)))) &kb 34220) ;(2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)
; !(min-atom (2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)) ;2.4955138491913995e-11
; !(max-atom (2.4955138491913995e-11 4.269824195966485e-08 4.269824195966485e-08 4.269824195966485e-08)) ;4.269824195966485e-08
; !(dst_from_interval 2.4955138491913995e-11 4.269824195966485e-08 0.0017533606078316774) ;0.0017533606078316774


; !(isurp  (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb False 1)

; !(ji_prob_est_interval (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb 0) 

; !((emp-prob-pbs  (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb 7.716049382716049e-05 1))

; !(subsmp-size (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) 60 7.716049382716049e-05)

!(do-jsd  (STV 0.8 0.111111) (STV 0.1 0.5555555555555556))