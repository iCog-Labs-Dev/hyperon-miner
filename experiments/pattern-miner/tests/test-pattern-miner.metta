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
(supportOf (, (Inheritance $_502352 $_502358) (Inheritance $_502352 ugly) (Inheritance $_502352 sodaDrinker)) 20))

)



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
(
        (surprisingnessOf (, (Inheritance $_758976 $_758982) (Inheritance $_758976 $_759006)) 0.10619553768074302) 
        (surprisingnessOf (, (Inheritance $_759060 $_759066) (Inheritance $_759084 $_759066)) 0.45082830604232477) 
        (surprisingnessOf (, (Inheritance $_759144 $_759150) (Inheritance $_759144 human)) 0.03351527338887292) 
        (surprisingnessOf (, (Inheritance $_759228 $_759234) (Inheritance $_759228 man)) 0.01675763669443646) 
        (surprisingnessOf (, (Inheritance $_759312 $_759318) (Inheritance $_759312 woman)) 0.01675763669443646) 
        (surprisingnessOf (, (Inheritance $_759396 $_759402) (Inheritance $_759396 ugly)) 0.019582495451498604) 
        (surprisingnessOf (, (Inheritance $_759480 $_759486) (Inheritance $_759480 sodaDrinker)) 0.019582495451498604) 
        (surprisingnessOf (, (Inheritance $_759564 human) (Inheritance $_759564 man)) 0.005585878898145486) 
        (surprisingnessOf (, (Inheritance $_759648 human) (Inheritance $_759648 woman)) 0.005585878898145486) 
        (surprisingnessOf (, (Inheritance $_759732 human) (Inheritance $_759732 ugly)) 0.005585878898145486) 
        (surprisingnessOf (, (Inheritance $_759816 human) (Inheritance $_759816 sodaDrinker)) 0.005585878898145486)
))
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
  
(
 (surprisingnessOf (, (Inheritance $_252250 $_252256) (Inheritance $_252250 $_252280)) 0.6842105263157894) 
 (surprisingnessOf (, (Inheritance $_252334 $_252340) (Inheritance $_252358 $_252340)) 0.925) 
 (surprisingnessOf (, (Inheritance $_252418 $_252424) (Inheritance $_252418 human)) 0.6666666666666667) 
 (surprisingnessOf (, (Inheritance $_252502 $_252508) (Inheritance $_252502 man)) 0.6666666666666667) 
 (surprisingnessOf (, (Inheritance $_252586 $_252592) (Inheritance $_252586 woman)) 0.6666666666666667) 
 (surprisingnessOf (, (Inheritance $_252670 $_252676) (Inheritance $_252670 ugly)) 0.7142857142857143) 
 (surprisingnessOf (, (Inheritance $_252754 $_252760) (Inheritance $_252754 sodaDrinker)) 0.7142857142857143) 
 (surprisingnessOf (, (Inheritance $_252838 human) (Inheritance $_252838 man)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_252922 human) (Inheritance $_252922 woman)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_253006 human) (Inheritance $_253006 ugly)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_253090 human) (Inheritance $_253090 sodaDrinker)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_253174 man) (Inheritance $_253174 ugly)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_253258 man) (Inheritance $_253258 sodaDrinker)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_253342 woman) (Inheritance $_253342 ugly)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_253426 woman) (Inheritance $_253426 sodaDrinker)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_253510 ugly) (Inheritance $_253510 sodaDrinker)) 0.6666666666666666)
))
;----------------------------------------------------------------
;; mine frequent patterns with surprissingness (3 - conjunct)
;----------------------------------------------------------------
;; number of conjucts -> 3 , so the depth will be 1
;; surprissingness mode -> isurp 
;; normalization -> true
;; minimum support ->  5

;!(bind! &res5 (new-space)). 

(pattern-miner &res5 &db 5 1 isurp True 0.2 True) 
(assertEqual (collapse (get-atoms &res5 ))
;; Expected result
((surprisingnessOf (, (Inheritance $_518506 $_518512) (Inheritance $_518506 $_518536) (Inheritance $_518506 $_518560)) 0.09523809523809525) 
 (surprisingnessOf (, (Inheritance $_518614 $_518620) (Inheritance $_518614 human) (Inheritance $_518614 $_518668)) 1.2325666802993103e-16) 
 (surprisingnessOf (, (Inheritance $_518722 $_518728) (Inheritance $_518722 $_518752) (Inheritance $_518722 man)) 0.05000000000000016) 
 (surprisingnessOf (, (Inheritance $_518830 $_518836) (Inheritance $_518830 $_518860) (Inheritance $_518830 woman)) 0.0) 
 (surprisingnessOf (, (Inheritance $_518938 $_518944) (Inheritance $_518938 $_518968) (Inheritance $_518938 ugly)) 0.24000000000000005) 
 (surprisingnessOf (, (Inheritance $_519046 $_519052) (Inheritance $_519046 $_519076) (Inheritance $_519046 sodaDrinker)) 0.24000000000000005) 
 (surprisingnessOf (, (Inheritance $_519154 $_519160) (Inheritance $_519178 $_519160) (Inheritance $_519202 $_519160)) 0.19999999999999993) 
 (surprisingnessOf (, (Inheritance $_519262 $_519268) (Inheritance $_519262 human) (Inheritance $_519262 man)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_519370 $_519376) (Inheritance $_519370 human) (Inheritance $_519370 woman)) 0.6666666666666666) 
 (surprisingnessOf (, (Inheritance $_519478 $_519484) (Inheritance $_519478 human) (Inheritance $_519478 ugly)) 0.6666666666666667) 
 (surprisingnessOf (, (Inheritance $_519586 $_519592) (Inheritance $_519586 human) (Inheritance $_519586 sodaDrinker)) 0.6666666666666667) 
 (surprisingnessOf (, (Inheritance $_519694 $_519700) (Inheritance $_519694 man) (Inheritance $_519694 ugly)) 0.7083333333333334) 
 (surprisingnessOf (, (Inheritance $_519802 $_519808) (Inheritance $_519802 man) (Inheritance $_519802 sodaDrinker)) 0.7083333333333334) 
 (surprisingnessOf (, (Inheritance $_519910 $_519916) (Inheritance $_519910 woman) (Inheritance $_519910 ugly)) 0.6111111111111112) 
 (surprisingnessOf (, (Inheritance $_520018 $_520024) (Inheritance $_520018 woman) (Inheritance $_520018 sodaDrinker)) 0.6111111111111112) 
 (surprisingnessOf (, (Inheritance $_520126 $_520132) (Inheritance $_520126 ugly) (Inheritance $_520126 sodaDrinker)) 0.7083333333333334) 
 (surprisingnessOf (, (Inheritance $_520234 human) (Inheritance $_520234 man) (Inheritance $_520234 ugly)) 0.6666666666666665) 
 (surprisingnessOf (, (Inheritance $_520342 human) (Inheritance $_520342 man) (Inheritance $_520342 sodaDrinker)) 0.6666666666666665) 
 (surprisingnessOf (, (Inheritance $_520450 human) (Inheritance $_520450 woman) (Inheritance $_520450 ugly)) 0.6666666666666665) 
 (surprisingnessOf (, (Inheritance $_520558 human) (Inheritance $_520558 woman) (Inheritance $_520558 sodaDrinker)) 0.6666666666666665) 
 (surprisingnessOf (, (Inheritance $_520666 human) (Inheritance $_520666 ugly) (Inheritance $_520666 sodaDrinker)) 0.6666666666666665) 
 (surprisingnessOf (, (Inheritance $_520774 man) (Inheritance $_520774 ugly) (Inheritance $_520774 sodaDrinker)) 0.8333333333333334))

)

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
((surprisingnessOf (, (Inheritance $_647442 $_647448) (Inheritance $_647442 $_647472) (Inheritance $_647442 $_647496)) 0.00027777777777777783)
(surprisingnessOf (, (Inheritance $_647550 $_647556) (Inheritance $_647550 human) (Inheritance $_647550 $_647604)) 1.0842021724855044e-19)
(surprisingnessOf (, (Inheritance $_647658 $_647664) (Inheritance $_647658 $_647688) (Inheritance $_647658 man)) 2.3148148148148225e-5)
(surprisingnessOf (, (Inheritance $_647766 $_647772) (Inheritance $_647766 $_647796) (Inheritance $_647766 woman)) 0.0)
(surprisingnessOf (, (Inheritance $_647874 $_647880) (Inheritance $_647874 $_647904) (Inheritance $_647874 ugly)) 0.00013888888888888892)
(surprisingnessOf (, (Inheritance $_647982 $_647988) (Inheritance $_647982 $_648012) (Inheritance $_647982 sodaDrinker)) 0.00013888888888888892)
(surprisingnessOf (, (Inheritance $_648090 $_648096) (Inheritance $_648114 $_648096) (Inheritance $_648138 $_648096)) 0.011111111111111106)
(surprisingnessOf (, (Inheritance $_648198 $_648204) (Inheritance $_648198 human) (Inheritance $_648198 man)) 9.259259259259259e-5)
(surprisingnessOf (, (Inheritance $_648306 $_648312) (Inheritance $_648306 human) (Inheritance $_648306 woman)) 9.259259259259259e-5)
(surprisingnessOf (, (Inheritance $_648414 $_648420) (Inheritance $_648414 human) (Inheritance $_648414 ugly)) 0.0001080246913580247)
(surprisingnessOf (, (Inheritance $_648522 $_648528) (Inheritance $_648522 human) (Inheritance $_648522 sodaDrinker)) 0.0001080246913580247)
(surprisingnessOf (, (Inheritance $_648630 $_648636) (Inheritance $_648630 man) (Inheritance $_648630 ugly)) 6.558641975308642e-5)
(surprisingnessOf (, (Inheritance $_648738 $_648744) (Inheritance $_648738 man) (Inheritance $_648738 sodaDrinker)) 6.558641975308642e-5)
(surprisingnessOf (, (Inheritance $_648846 $_648852) (Inheritance $_648846 woman) (Inheritance $_648846 ugly)) 4.243827160493828e-5)
(surprisingnessOf (, (Inheritance $_648954 $_648960) (Inheritance $_648954 woman) (Inheritance $_648954 sodaDrinker)) 4.243827160493828e-5)
(surprisingnessOf (, (Inheritance $_649062 $_649068) (Inheritance $_649062 ugly) (Inheritance $_649062 sodaDrinker)) 6.558641975308642e-5)
(surprisingnessOf (, (Inheritance $_649170 human) (Inheritance $_649170 man) (Inheritance $_649170 ugly)) 1.5432098765432096e-5)
(surprisingnessOf (, (Inheritance $_649278 human) (Inheritance $_649278 man) (Inheritance $_649278 sodaDrinker)) 1.5432098765432096e-5)
(surprisingnessOf (, (Inheritance $_649386 human) (Inheritance $_649386 woman) (Inheritance $_649386 ugly)) 1.5432098765432096e-5)
(surprisingnessOf (, (Inheritance $_649494 human) (Inheritance $_649494 woman) (Inheritance $_649494 sodaDrinker)) 1.5432098765432096e-5)
(surprisingnessOf (, (Inheritance $_649602 human) (Inheritance $_649602 ugly) (Inheritance $_649602 sodaDrinker)) 1.5432098765432096e-5)
(surprisingnessOf (, (Inheritance $_649710 man) (Inheritance $_649710 ugly) (Inheritance $_649710 sodaDrinker)) 1.9290123456790123e-5))

)



;----------------------------------------------------------------
;; mine frequent patterns with jsd surprissingness (3 - conjunct)
;----------------------------------------------------------------
;; number of conjucts -> 3 , so the depth will be 1
;; surprissingness mode -> jsd
;; minimum support ->  3

; !(bind! &res7 (new-space))

!(pattern-miner &res7 &db 5 1 jsd none 0.2 True) 
!(assertEqual (collapse (get-atoms &res7)) 
;; Expected result 
(
        
(surprisingnessOf (, (Inheritance $_643504 $_643510) (Inheritance $_643504 $_643534) (Inheritance $_643504 $_643558)) 0.8610271496573)
(surprisingnessOf (, (Inheritance $_643612 $_643618) (Inheritance $_643612 human) (Inheritance $_643612 $_643666)) 0.8612038426398)
(surprisingnessOf (, (Inheritance $_643720 $_643726) (Inheritance $_643720 $_643750) (Inheritance $_643720 man)) 0.8612332080994)
(surprisingnessOf (, (Inheritance $_643828 $_643834) (Inheritance $_643828 $_643858) (Inheritance $_643828 woman)) 0.8612363427871)
(surprisingnessOf (, (Inheritance $_643936 $_643942) (Inheritance $_643936 $_643966) (Inheritance $_643936 ugly)) 0.8612252606634)
(surprisingnessOf (, (Inheritance $_644044 $_644050) (Inheritance $_644044 $_644074) (Inheritance $_644044 sodaDrinker)) 0.8612252606634)
(surprisingnessOf (, (Inheritance $_644152 $_644158) (Inheritance $_644176 $_644158) (Inheritance $_644200 $_644158)) 0.8034689893858)
(surprisingnessOf (, (Inheritance $_644260 $_644266) (Inheritance $_644260 human) (Inheritance $_644260 man)) 0.8612546292081)
(surprisingnessOf (, (Inheritance $_644368 $_644374) (Inheritance $_644368 human) (Inheritance $_644368 woman)) 0.8612546292081)
(surprisingnessOf (, (Inheritance $_644476 $_644482) (Inheritance $_644476 human) (Inheritance $_644476 ugly)) 0.8612531390662)
(surprisingnessOf (, (Inheritance $_644584 $_644590) (Inheritance $_644584 human) (Inheritance $_644584 sodaDrinker)) 0.8612531390662)
(surprisingnessOf (, (Inheritance $_644692 $_644698) (Inheritance $_644692 man) (Inheritance $_644692 ugly)) 0.8612575913482)
(surprisingnessOf (, (Inheritance $_644800 $_644806) (Inheritance $_644800 man) (Inheritance $_644800 sodaDrinker)) 0.8612575913482)
(surprisingnessOf (, (Inheritance $_644908 $_644914) (Inheritance $_644908 woman) (Inheritance $_644908 ugly)) 0.8612590633821)
(surprisingnessOf (, (Inheritance $_645016 $_645022) (Inheritance $_645016 woman) (Inheritance $_645016 sodaDrinker)) 0.8612590633821)
(surprisingnessOf (, (Inheritance $_645124 $_645130) (Inheritance $_645124 ugly) (Inheritance $_645124 sodaDrinker)) 0.8612575913482)
(surprisingnessOf (, (Inheritance $_645232 human) (Inheritance $_645232 man) (Inheritance $_645232 ugly)) 0.8548398421185)
(surprisingnessOf (, (Inheritance $_645340 human) (Inheritance $_645340 man) (Inheritance $_645340 sodaDrinker)) 0.8548398421185)
(surprisingnessOf (, (Inheritance $_645448 human) (Inheritance $_645448 woman) (Inheritance $_645448 ugly)) 0.8548398421185)
(surprisingnessOf (, (Inheritance $_645556 human) (Inheritance $_645556 woman) (Inheritance $_645556 sodaDrinker)) 0.8548398421185)
(surprisingnessOf (, (Inheritance $_645664 human) (Inheritance $_645664 ugly) (Inheritance $_645664 sodaDrinker)) 0.8548398421185)
(surprisingnessOf (, (Inheritance $_645772 man) (Inheritance $_645772 ugly) (Inheritance $_645772 sodaDrinker)) 0.8507324751176)
))