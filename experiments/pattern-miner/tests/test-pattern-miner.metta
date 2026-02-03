;; import order matters here
!(import! &self "../../utils/surp-utils/boost_petta.py")
!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/index_to_var)
!(import! &self  ../../utils/constants)
!(import! &self  ../../utils/TruthValue)
!(import! &self ../../utils/surp-utils/partition-metta)


;;import surp components 
!(import! &self  ../../utils/surp-utils/binomialMetta)
!(import! &self ../../utils/surp-utils/beta-dist)
!(import! &self  ../../utils/surp-utils/surp-utils)


!(import! &self ../../utils/sort)
!(import! &self ../../utils/variable-combinations)
!(import! &self ../../utils/surp-utils/blk-abstractness)
!(import! &self ../../utils/remove_useless_clauses)
!(import! &self ../../utils/surp-utils/eq-prob-petta)
!(import! &self ../../utils/surp-utils/bs-utils)
!(import! &self ../../utils/surp-utils/jsd-helper)

!(import! &self ../../truth-values/est-tv)
!(import! &self ../../truth-values/emp-tv)
!(import! &self ../../surprisingness/emp-prob)
!(import! &self ../../surprisingness/isurp)
!(import! &self ../../surprisingness/isurp-old)
!(import! &self ../../surprisingness/jsd)

!(import! &self ../../frequent-pattern-miner/build-specialization)
!(import! &self ../../frequent-pattern-miner/candidate-patterns)
!(import! &self ../../frequent-pattern-miner/conjunction-expansion)
!(import! &self ../../frequent-pattern-miner/frequent-pattern-miner)
!(import! &self ../pattern-miner)


;; import kb
!(import! &db ../../data/ugly_man_sodaDrinker)






;---------------------------------------------------
;; mine frequent patterns without surprissingness 
;---------------------------------------------------
;; number of conjucts 2 , so the depth will be 0
;; surprissingness mode none
;; minimum support 10
;;(pattern-miner $kb $db $minsup $depth $surp-mode $normalization $db-ratio $conj_exp)

(pattern-miner &res1 &db 10 0 none none none True) 
(assertEqual (collapse (get-atoms &res1))
;;Expected result 
        ((supportOf (, (Inheritance $_493388 $_493394) (Inheritance $_493388 $_493418)) 190) 
        (supportOf (, (Inheritance $_493466 $_493472) (Inheritance $_493490 $_493472)) 800) 
        (supportOf (, (Inheritance $_493544 $_493550) (Inheritance $_493544 human)) 60) 
        (supportOf (, (Inheritance $_493622 $_493628) (Inheritance $_493622 man)) 30)
        (supportOf (, (Inheritance $_493700 $_493706) (Inheritance $_493700 woman)) 30) 
        (supportOf (, (Inheritance $_493778 $_493784) (Inheritance $_493778 ugly)) 35) 
        (supportOf (, (Inheritance $_493856 $_493862) (Inheritance $_493856 sodaDrinker)) 35) 
        (supportOf (, (Inheritance $_493934 human) (Inheritance $_493934 man)) 10) 
        (supportOf (, (Inheritance $_494012 human) (Inheritance $_494012 woman)) 10) 
        (supportOf (, (Inheritance $_494090 human) (Inheritance $_494090 ugly)) 10) 
        (supportOf (, (Inheritance $_494168 human) (Inheritance $_494168 sodaDrinker)) 10)) )



;----------------------------------------------------------------
;; mine frequent patterns without surprissingness (3 - conjunct)
;----------------------------------------------------------------
;; number of conjucts 3 , so the depth will be 1
;; surprissingness mode none
;; minimum support 10
;;(pattern-miner $kb $db $minsup $depth $surp-mode $normalization $db-ratio $conj_exp)

(pattern-miner &res2 &db 10 1 none none none  True) 
(assertEqual (collapse (get-atoms &res2)) 
((supportOf (, (Inheritance $_503984 $_503990) (Inheritance $_503984 $_504014) (Inheritance $_503984 $_504038)) 630)
(supportOf (, (Inheritance $_503882 $_503888) (Inheritance $_503882 human) (Inheritance $_503882 $_503936)) 190)
(supportOf (, (Inheritance $_503780 $_503786) (Inheritance $_503780 $_503810) (Inheritance $_503780 man)) 100)
(supportOf (, (Inheritance $_503678 $_503684) (Inheritance $_503678 $_503708) (Inheritance $_503678 woman)) 90)
(supportOf (, (Inheritance $_503576 $_503582) (Inheritance $_503576 $_503606) (Inheritance $_503576 ugly)) 125)
(supportOf (, (Inheritance $_503474 $_503480) (Inheritance $_503474 $_503504) (Inheritance $_503474 sodaDrinker)) 125)
(supportOf (, (Inheritance $_503372 $_503378) (Inheritance $_503396 $_503378) (Inheritance $_503420 $_503378)) 12000)
(supportOf (, (Inheritance $_503270 $_503276) (Inheritance $_503270 $_503300) (Inheritance $_503270 human)) 190)
(supportOf (, (Inheritance $_503168 $_503174) (Inheritance $_503168 human) (Inheritance $_503168 man)) 30)
(supportOf (, (Inheritance $_503066 $_503072) (Inheritance $_503066 human) (Inheritance $_503066 woman)) 30)
(supportOf (, (Inheritance $_502964 $_502970) (Inheritance $_502964 human) (Inheritance $_502964 ugly)) 35)
(supportOf (, (Inheritance $_502862 $_502868) (Inheritance $_502862 human) (Inheritance $_502862 sodaDrinker)) 35)
(supportOf (, (Inheritance $_502760 $_502766) (Inheritance $_502760 man) (Inheritance $_502760 ugly)) 20)
(supportOf (, (Inheritance $_502658 $_502664) (Inheritance $_502658 man) (Inheritance $_502658 sodaDrinker)) 20)
(supportOf (, (Inheritance $_502556 $_502562) (Inheritance $_502556 woman) (Inheritance $_502556 ugly)) 15)
(supportOf (, (Inheritance $_502454 $_502460) (Inheritance $_502454 woman) (Inheritance $_502454 sodaDrinker)) 15)
(supportOf (, (Inheritance $_502352 $_502358) (Inheritance $_502352 ugly) (Inheritance $_502352 sodaDrinker)) 20)))



;----------------------------------------------------------------
;; mine frequent patterns with surprissingness (2 - conjunct)
;----------------------------------------------------------------
;; number of conjucts -> 2 , so the depth will be 0
;; surprissingness mode -> isurp-old 
;; normalization -> False
;; minimum support ->  10
;;(pattern-miner $kb $db $minsup $depth $surp-mode $normalization $db-ratio $conj_exp)


(pattern-miner &res3 &db 10 0 isurp-old False none True) 
(assertEqual (collapse (get-atoms &res3)) 
;; Expected result
        ((surprisingnessOf (, (Inheritance $_560150 $_560156) (Inheritance $_560150 $_560156)) 0.07344632768361578) 
        (surprisingnessOf (, (Inheritance $_560234 human) (Inheritance $_560234 man)) 0.005585878898145486) 
        (surprisingnessOf (, (Inheritance $_560318 human) (Inheritance $_560318 woman)) 0.005585878898145486) 
        (surprisingnessOf (, (Inheritance $_560402 human) (Inheritance $_560402 ugly)) 0.005585878898145486) 
        (surprisingnessOf (, (Inheritance $_560486 human) (Inheritance $_560486 sodaDrinker)) 0.005585878898145486)))


;----------------------------------------------------------------
;; mine frequent patterns with surprissingness (2 - conjunct)
;----------------------------------------------------------------
;; number of conjucts -> 2 , so the depth will be 0
;; surprissingness mode -> isurp 
;; normalization -> True
;; minimum support ->  5
;;(pattern-miner $kb $db $minsup $depth $surp-mode $normalization $db-ratio $conj_exp)


(pattern-miner &res4 &db 5 0 isurp True 0.2 True) 
(assertEqual (collapse (get-atoms &res4))
;; Expected result
  ((surprisingnessOf (, (Inheritance $_679614 human) (Inheritance $_679614 man)) 0.6666666666666666) 
  (surprisingnessOf (, (Inheritance $_679698 human) (Inheritance $_679698 woman)) 0.6666666666666666) 
  (surprisingnessOf (, (Inheritance $_679782 human) (Inheritance $_679782 ugly)) 0.6666666666666666) 
  (surprisingnessOf (, (Inheritance $_679866 human) (Inheritance $_679866 sodaDrinker)) 0.6666666666666666) 
  (surprisingnessOf (, (Inheritance $_679950 man) (Inheritance $_679950 ugly)) 0.6666666666666666) 
  (surprisingnessOf (, (Inheritance $_680034 man) (Inheritance $_680034 sodaDrinker)) 0.6666666666666666)
   (surprisingnessOf (, (Inheritance $_680118 woman) (Inheritance $_680118 ugly)) 0.6666666666666666)
    (surprisingnessOf (, (Inheritance $_680202 woman) (Inheritance $_680202 sodaDrinker)) 0.6666666666666666) 
    (surprisingnessOf (, (Inheritance $_680286 ugly) (Inheritance $_680286 sodaDrinker)) 0.6666666666666666))) 
   


;----------------------------------------------------------------
;; mine frequent patterns with surprissingness (3 - conjunct)
;----------------------------------------------------------------
;; number of conjucts -> 3 , so the depth will be 1
;; surprissingness mode -> isurp 
;; normalization -> true
;; minimum support ->  5

;!(bind! &res5 (new-space))

!(pattern-miner &res5 &db 5 1 isurp True 0.2 True) 
!(assertEqual (collapse (get-atoms &res5 ))
;; Expected result
((surprisingnessOf (, (Inheritance $_129702 human) (Inheritance $_129702 man) (Inheritance $_129702 ugly)) 0.6666666666666665) 
 (surprisingnessOf (, (Inheritance $_129810 human) (Inheritance $_129810 man) (Inheritance $_129810 sodaDrinker)) 0.6666666666666665) 
 (surprisingnessOf (, (Inheritance $_129918 human) (Inheritance $_129918 woman) (Inheritance $_129918 ugly)) 0.6666666666666665)
  (surprisingnessOf (, (Inheritance $_130026 human) (Inheritance $_130026 woman) (Inheritance $_130026 sodaDrinker)) 0.6666666666666665) 
  (surprisingnessOf (, (Inheritance $_130134 human) (Inheritance $_130134 ugly) (Inheritance $_130134 sodaDrinker)) 0.6666666666666665) 
  (surprisingnessOf (, (Inheritance $_130242 man) (Inheritance $_130242 ugly) (Inheritance $_130242 sodaDrinker)) 0.8333333333333334)))


;----------------------------------------------------------------
;; mine frequent patterns with surprissingness (3 - conjunct)
;----------------------------------------------------------------
;; number of conjucts -> 3 , so the depth will be 1
;; surprissingness mode -> isurp 
;; normalization -> False
;; minimum support ->  5


(pattern-miner &res6 &db 5 1 isurp False 0.2 True) 
(assertEqual (collapse (get-atoms &res6))
;; Expected result
((surprisingnessOf (, (Inheritance $_136416 human) (Inheritance $_136416 man) (Inheritance $_136416 ugly)) 1.5432098765432096e-5) 
(surprisingnessOf (, (Inheritance $_136524 human) (Inheritance $_136524 man) (Inheritance $_136524 sodaDrinker)) 1.5432098765432096e-5) 
(surprisingnessOf (, (Inheritance $_136632 human) (Inheritance $_136632 woman) (Inheritance $_136632 ugly)) 1.5432098765432096e-5) 
(surprisingnessOf (, (Inheritance $_136740 human) (Inheritance $_136740 woman) (Inheritance $_136740 sodaDrinker)) 1.5432098765432096e-5) 
(surprisingnessOf (, (Inheritance $_136848 human) (Inheritance $_136848 ugly) (Inheritance $_136848 sodaDrinker)) 1.5432098765432096e-5) 
(surprisingnessOf (, (Inheritance $_136956 man) (Inheritance $_136956 ugly) (Inheritance $_136956 sodaDrinker)) 1.9290123456790123e-5)))



;----------------------------------------------------------------
;; mine frequent patterns with jsd surprissingness (3 - conjunct)
;----------------------------------------------------------------
;; number of conjucts -> 3 , so the depth will be 1
;; surprissingness mode -> jsd
;; minimum support ->  3

; !(bind! &res7 (new-space))

(pattern-miner &res7 &db 5 1 jsd none 0.2 True) 
(assertEqual (collapse (get-atoms &res7)) 
;; Expected result 
((surprisingnessOf (, (Inheritance $_217764 human) (Inheritance $_217764 man) (Inheritance $_217764 ugly)) 0.8548398421185) 
 (surprisingnessOf (, (Inheritance $_217872 human) (Inheritance $_217872 man) (Inheritance $_217872 sodaDrinker)) 0.8548398421185) 
 (surprisingnessOf (, (Inheritance $_217980 human) (Inheritance $_217980 woman) (Inheritance $_217980 ugly)) 0.8548398421185) 
 (surprisingnessOf (, (Inheritance $_218088 human) (Inheritance $_218088 woman) (Inheritance $_218088 sodaDrinker)) 0.8548398421185) 
 (surprisingnessOf (, (Inheritance $_218196 human) (Inheritance $_218196 ugly) (Inheritance $_218196 sodaDrinker)) 0.8548398421185) 
 (surprisingnessOf (, (Inheritance $_218304 man) (Inheritance $_218304 ugly) (Inheritance $_218304 sodaDrinker)) 0.8507324751176)))

