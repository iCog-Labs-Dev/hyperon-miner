! (register-module! ../../../../hyperon-miner/experiments)

! (import! &self experiments:frequent-pattern-miner:frequent-pattern-miner)
! (import! &self experiments:pattern-miner:pattern-miner)
! (import! &self experiments:utils:common-utils)

! (import! &self experiments:pattern-miner:pattern-miner)

! (import! &self experiments:surprisingness:isurp-old)
! (import! &self experiments:utils:binomialMetta)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:utils:emp-tv-bs)
! (import! &self experiments:utils:bs-utils)
! (import! &self experiments:utils:customType)
! (import! &self experiments:truth-values:emp-tv)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)
! (import! &self experiments:surprisingness:jsd)
! (import! &self experiments:utils:jsd-helper)

! (import! &self experiments:utils:remove_useless_clauses)
! (import! &self experiments:utils:index_to_var)
! (import! &db experiments:data:small-ugly)



;; create the database 
!(bind! &dbb (new-space))




;; space to hold the miner result
!(bind! &res1 (new-space))


;(: space hyperon::space::DynSpace)


---------------------------------------------------
;; mine frequent patterns without surprissingness 
---------------------------------------------------
;; number of conjucts 2 , so the depth will be 0
;; surprissingness mode none
;; minimum support 4

; !(pattern-miner &res1 &db 4 0 none True) 
; !(collapse (match &res1 $pattern $pattern))
;; Expected result 
        ; ((supportOf (, (Inheritance $h10#3741032 $w01#3741033) (Inheritance Allen $w01#3741033)) 14)
        ; (supportOf (, (Inheritance $r56#3741034 $r45#3741035) (Inheritance Abe $r45#3741035)) 14)
        ; (supportOf (, (Inheritance $i60#3741036 $v92#3741037) (Inheritance Cason $v92#3741037)) 14)
        ; (supportOf (, (Inheritance $p88#3741038 $x28#3741039) (Inheritance $p88#3741038 sodaDrinker)) 14)
        ; (supportOf (, (Inheritance $h42#3741040 sodaDrinker) (Inheritance $h42#3741040 ugly)) 4)
        ; (supportOf (, (Inheritance $v22#3741041 $u14#3741042) (Inheritance $v22#3741041 ugly)) 14)
        ; (supportOf (, (Inheritance $p21#3741043 $a44#3741044) (Inheritance $p21#3741043 $f23#3741045)) 54)
        ; (supportOf (, (Inheritance $l06#3741046 $u10#3741047) (Inheritance $u57#3741048 $u10#3741047)) 54)
        ; (supportOf (, (Inheritance Allen $p44#3741049) (Inheritance Cason $p44#3741049)) 4)
        ; (supportOf (, (Inheritance Allen $k34#3741050) (Inheritance $r80#3741051 $k34#3741050)) 14)
        ; (supportOf (, (Inheritance Abe $j94#3741052) (Inheritance Allen $j94#3741052)) 4)
        ; (supportOf (, (Inheritance Abe $a57#3741053) (Inheritance Cason $a57#3741053)) 4) 
        ; (supportOf (, (Inheritance Abe $a11#3741054) (Inheritance $s37#3741055 $a11#3741054)) 14)
        ; (supportOf (, (Inheritance Cason $b49#3741056) (Inheritance $d13#3741057 $b49#3741056)) 14))
----------------------------------------------------------------
;; mine frequent patterns without surprissingness (3 - conjunct)
----------------------------------------------------------------
;; number of conjucts 3 , so the depth will be 1
;; surprissingness mode none
;; minimum support 3

!(bind! &res2 (new-space))

 !(pattern-miner &res2 &db 4 1 none True) 
 !(collapse (match &res2 $pattern $pattern ))
;; Expected result
; ((supportOf (, (Inheritance $a88#3981498 human) (Inheritance $a88#3981498 man) (Inheritance $a88#3981498 ugly)) 3) 
; (supportOf (, (Inheritance $t39#3981499 human) (Inheritance $t39#3981499 man) (Inheritance $t39#3981499 sodaDrinker)) 3) 
; (supportOf (, (Inheritance $v02#3981500 human) (Inheritance $v02#3981500 sodaDrinker) (Inheritance $v02#3981500 ugly)) 3) 
; (supportOf (, (Inheritance $v54#3981501 man) (Inheritance $v54#3981501 sodaDrinker) (Inheritance $v54#3981501 ugly)) 3) 
; (supportOf (, (Inheritance Abe $v37#3981502) (Inheritance Allen $v37#3981502) (Inheritance Cason $v37#3981502)) 4))




----------------------------------------------------------------
;; mine frequent patterns with surprissingness (2 - conjunct)
----------------------------------------------------------------
;; number of conjucts -> 2 , so the depth will be 0
;; surprissingness mode -> nisurp-old (normalized)
;; minimum support ->  3

; !(bind! &res3 (new-space))

; !(pattern-miner &res3 &db 3 0 nisurp-old) 
; !(collapse (match &res3 $pattern $pattern ))
;; Expected result
; ((surprisingnessOf (, (Inheritance $r34#777329 human) (Inheritance $r34#777329 man)) 0.5357142857142857) 
; (surprisingnessOf (, (Inheritance $s48#777330 human) (Inheritance $s48#777330 ugly)) 0.5357142857142857) 
; (surprisingnessOf (, (Inheritance $q38#777331 human) (Inheritance $q38#777331 sodaDrinker)) 0.5357142857142857) 
; (surprisingnessOf (, (Inheritance $e19#777332 man) (Inheritance $e19#777332 ugly)) 0.5357142857142857) 
; (surprisingnessOf (, (Inheritance $s47#777333 man) (Inheritance $s47#777333 sodaDrinker)) 0.5357142857142857) 
; (surprisingnessOf (, (Inheritance $t48#777334 sodaDrinker) (Inheritance $t48#777334 ugly)) 0.5357142857142857) 
; (surprisingnessOf (, (Inheritance Abe $y71#777335) (Inheritance Cason $y71#777335)) 0.5357142857142858) 
; (surprisingnessOf (, (Inheritance Abe $z89#777336) (Inheritance Allen $z89#777336)) 0.5357142857142858) 
; (surprisingnessOf (, (Inheritance Allen $h42#777337) (Inheritance Cason $h42#777337)) 0.5357142857142858))


----------------------------------------------------------------
;; mine frequent patterns with surprissingness (2 - conjunct)
----------------------------------------------------------------
;; number of conjucts -> 2 , so the depth will be 0
;; surprissingness mode -> isurp-old (non-normalized)
;; minimum support ->  3

!(bind! &res4 (new-space))

; !(pattern-miner &res4 &db 3 0 isurp-old) 
; !(collapse (match &res4 $pattern $pattern ))
;; Expected result
; ((surprisingnessOf (, (Inheritance $g66#777005 human) (Inheritance $g66#777005 man)) 0.052982731554160126) 
; (surprisingnessOf (, (Inheritance $t11#777006 human) (Inheritance $t11#777006 ugly)) 0.052982731554160126) 
; (surprisingnessOf (, (Inheritance $p94#777007 human) (Inheritance $p94#777007 sodaDrinker)) 0.052982731554160126) 
; (surprisingnessOf (, (Inheritance $o86#777008 man) (Inheritance $o86#777008 ugly)) 0.052982731554160126) 
; (surprisingnessOf (, (Inheritance $v43#777009 man) (Inheritance $v43#777009 sodaDrinker)) 0.052982731554160126) 
; (surprisingnessOf (, (Inheritance $r81#777010 sodaDrinker) (Inheritance $r81#777010 ugly)) 0.052982731554160126) 
; (surprisingnessOf (, (Inheritance Abe $r23#777011) (Inheritance Cason $r23#777011)) 0.09419152276295135) 
; (surprisingnessOf (, (Inheritance Abe $e18#777012) (Inheritance Allen $e18#777012)) 0.09419152276295135) 
; (surprisingnessOf (, (Inheritance Allen $o44#777013) (Inheritance Cason $o44#777013)) 0.09419152276295135))


----------------------------------------------------------------
;; mine frequent patterns with surprissingness (3 - conjunct)
----------------------------------------------------------------
;; number of conjucts -> 3 , so the depth will be 1
;; surprissingness mode -> isurp-old (non-normalized)
;; minimum support ->  3

!(bind! &res5 (new-space))

; !(pattern-miner &res5 &db 3 1 isurp-old) 
; !(collapse (match &res5 $pattern $pattern ))
;; Expected result
; ((surprisingnessOf (, (Inheritance $t70#4271124 human) (Inheritance $t70#4271124 man) (Inheritance $t70#4271124 ugly)) 0.052982731554160126) 
; (surprisingnessOf (, (Inheritance $l89#4271125 human) (Inheritance $l89#4271125 man) (Inheritance $l89#4271125 sodaDrinker)) 0.052982731554160126) 
; (surprisingnessOf (, (Inheritance $l53#4271126 human) (Inheritance $l53#4271126 sodaDrinker) (Inheritance $l53#4271126 ugly)) 0.052982731554160126)
; (surprisingnessOf (, (Inheritance $a63#4271127 man) (Inheritance $a63#4271127 sodaDrinker) (Inheritance $a63#4271127 ugly)) 0.052982731554160126)
; (surprisingnessOf (, (Inheritance Abe $l53#4271126) (Inheritance Allen $l53#4271126) (Inheritance Cason $l53#4271126)) 0.12558869701726846))


----------------------------------------------------------------
;; mine frequent patterns with surprissingness (3 - conjunct)
----------------------------------------------------------------
;; number of conjucts -> 3 , so the depth will be 1
;; surprissingness mode -> nisurp-old (normalized)
;; minimum support ->  3

!(bind! &res6 (new-space))

; !(pattern-miner &res6 &db 3 1 nisurp-old) 
; !(collapse (match &res6 $pattern $pattern ))
;; Expected result
; ((surprisingnessOf (, (Inheritance $p43#4271077 human) (Inheritance $p43#4271077 man) (Inheritance $p43#4271077 ugly)) 0.7142857142857143) 
; (surprisingnessOf (, (Inheritance $h53#4271078 human) (Inheritance $h53#4271078 man) (Inheritance $h53#4271078 sodaDrinker)) 0.7142857142857143) 
; (surprisingnessOf (, (Inheritance $i64#4271079 human) (Inheritance $i64#4271079 sodaDrinker) (Inheritance $i64#4271079 ugly)) 0.7142857142857143)
;  (surprisingnessOf (, (Inheritance $a93#4271080 man) (Inheritance $a93#4271080 sodaDrinker) (Inheritance $a93#4271080 ugly)) 0.7142857142857143)
;   (surprisingnessOf (, (Inheritance Abe $h27#4271081) (Inheritance Allen $h27#4271081) (Inheritance Cason $h27#4271081)) 0.7142857142857143))



----------------------------------------------------------------
;; mine frequent patterns with jsd surprissingness (3 - conjunct)
----------------------------------------------------------------
;; number of conjucts -> 3 , so the depth will be 1
;; surprissingness mode -> jsd
;; minimum support ->  3

; !(bind! &res7 (new-space))

;  !(pattern-miner &res7 &db 3 1 jsd) 
;  !(collapse (match &res7 $pattern $pattern ))
;; Expected result 
;((surprisingnessOf (, (Inheritance $h99#9978924 human) (Inheritance $h99#9978924 sodaDrinker) (Inheritance $h99#9978924 ugly)) 0.8602770128397317) 
;(surprisingnessOf (, (Inheritance $u24#9978925 human) (Inheritance $u24#9978925 man) (Inheritance $u24#9978925 sodaDrinker)) 0.8602770128397317) 
;(surprisingnessOf (, (Inheritance $n61#9978926 human) (Inheritance $n61#9978926 man) (Inheritance $n61#9978926 ugly)) 0.8602770128397317) 
;(surprisingnessOf (, (Inheritance $h49#9978927 man) (Inheritance $h49#9978927 sodaDrinker) (Inheritance $h49#9978927 ugly)) 0.8602770128397317) 
;(surprisingnessOf (, (Inheritance Abe $t43#9978928) (Inheritance Allen $t43#9978928) (Inheritance Cason $t43#9978928)) 0.8602249031703285))


