!(import! &self ../../utils/metta_log/common-util)
!(import! &self ../../utils/metta_log/partition-metta)
!(import! &self ../../utils/metta_log/binomialMetta)
!(import! &self ../../utils/metta_log/surp-utils)
!(import! &self ../../utils/metta_log/beta-dist)
!(import! &self ../../utils/metta_log/index_to_var)
!(import! &self ../../utils/metta_log/blk-abstractness)
!(import! &self ../../utils/metta_log/eq-prob)
!(import! &self ../../utils/metta_log/constants)
!(import! &self ../../utils/metta_log/TruthValue)
!(import! &kb ../../data/ugly_man_sodaDrinker)
!(import! &self ./est-tv)


; !(do-ji-tv-est &kb  (, (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker)
;    )) ; (STV 0 0.00038350859426784393)


; !(ji-est-tv &kb 60  (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) 
;                     ((((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x ugly) (Inheritance $x sodaDrinker))))
; )


; !((emp-tv (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb))

; !(pro_prob_without_joint &kb (((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker)))) ;(0.16666666666666657 0.0069767441860465055)

; !(emp_tv_mem  (((Inheritance $x man)) ((Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) &kb) ;  ((EMPTV 0.16666666666666666 0.0069767441860465115) (EMPTV 0.16666666666666666 0.0069767441860465115) (EMPTV 0.16666666666666666 0.0069767441860465115))

; !(avrg_tv ((EMPTV 0.16666666666666666 0.0069767441860465115) (EMPTV 0.16666666666666666 0.0069767441860465115) (EMPTV 0.16666666666666666 0.0069767441860465115))) ;(0.16666666666666657 0.0069767441860465055)


!(isurp  (, (Inheritance $x man)  (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &kb False 0)