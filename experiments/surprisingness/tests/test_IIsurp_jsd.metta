
!(import! &self "../../utils/surp-utils/boost_petta.py")
!(import! &self ../../data/II_surp_kb/kb1)
!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/constants)
!(import! &self ../../utils/TruthValue)
!(import! &self ../../utils/surp-utils/partition-metta)
!(import! &self ../../utils/surp-utils/binomialMetta)
!(import! &self ../../utils/surp-utils/beta-dist)
!(import! &self ../../utils/surp-utils/surp-utils)
!(import! &self ../../utils/surp-utils/blk-abstractness)
!(import! &self ../../utils/surp-utils/eq-prob-petta)
!(import! &self ../../utils/surp-utils/bs-utils)
!(import! &self ../../truth-values/emp-tv)
!(import! &self ../../truth-values/est-tv)
!(import! &self ../utils/index_to_var)
!(import! &self ../../utils/surp-utils/jsd-helper)
!(import! &self ../../utils/surp-utils/IIsurp_utils)
!(import! &self ../../utils/surp-utils/IIsurp_avrg)
!(import! &self ../emp-prob)
!(import! &self ../jsd)
!(import! &self ../IIsurp_jsd)


!(let (Inheritance $x $y) (get-atoms &self) (eval (superpose (
       (add-atom &db (Inheritance $x $y)) (remove-atom &self (Inheritance $x $y) )
))))


(assertEqual (IIsurp-pln (, (Inheritance $x human)
   (Inheritance $x gamer)
) &db) 0.0075910448073)



; !(get_set_prob_intervals (, (Inheritance $x human)
;    (Inheritance $x gamer)
; ) &db 1000 )


; !(avrg_tv-iisurp ((STV 0 0.1) (STV 1 0.1)))
; !(emp-tv (, (Inheritance $x human)
;    (Inheritance $x gamer)
; ) &db )

; !(do-ji-tv-est  &db (, (Inheritance $x human)
;    (Inheritance $x gamer)
; ))
; !(do-jsd (EMPTV 0.8 0.5555555555555556) (STV 0.7968127490039841 0.5565410199556541))
