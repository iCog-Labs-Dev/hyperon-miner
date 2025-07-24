! (register-module! ../../../../hyperon-miner)

! (import! &self hyperon-miner:experiments:frequent-pattern-miner:frequent-pattern-miner)
! (import! &self hyperon-miner:experiments:pattern-miner:pattern-miner)
! (import! &self hyperon-miner:experiments:utils:common-utils)

! (import! &self hyperon-miner:experiments:pattern-miner:pattern-miner)

! (import! &self hyperon-miner:experiments:surprisingness:isurp-old)
! (import! &self hyperon-miner:experiments:utils:binomialMetta)
! (import! &self hyperon-miner:experiments:utils:beta-dist)
! (import! &self hyperon-miner:experiments:utils:constants)
! (import! &self hyperon-miner:experiments:utils:TruthValue)
! (import! &self hyperon-miner:experiments:utils:surp-utils)
! (import! &self hyperon-miner:experiments:utils:miner-utils)
! (import! &self hyperon-miner:experiments:utils:gen_partition)
! (import! &self hyperon-miner:experiments:truth-values:est-tv)

! (import! &db hyperon-miner:experiments:data:small-ugly)



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
;; minimum support 3

!(pattern-miner &res1 &db 3 0 none) 
 !(collapse (match &res1 $pattern $pattern ))
;; Expected result 
          ; ((supportOf (, (Inheritance $y human) (Inheritance $y man)) 3) 
          ; (supportOf (, (Inheritance $j human) (Inheritance $j ugly)) 3) 
          ; (supportOf (, (Inheritance $p human) (Inheritance $p sodaDrinker)) 3) 
          ; (supportOf (, (Inheritance $r man) (Inheritance $r ugly)) 3) 
          ; (supportOf (, (Inheritance $x man) (Inheritance $x sodaDrinker)) 3) 
          ; (supportOf (, (Inheritance $x sodaDrinker) (Inheritance $x ugly)) 3) 
          ; (supportOf (, (Inheritance Abe $r) (Inheritance Cason $r)) 4) (
          ;   supportOf (, (Inheritance Abe $l) (Inheritance Allen $l)) 4) 
          ;   (supportOf (, (Inheritance Allen $g) (Inheritance Cason $g)) 4))


----------------------------------------------------------------
;; mine frequent patterns without surprissingness (3 - conjunct)
----------------------------------------------------------------
;; number of conjucts 3 , so the depth will be 1
;; surprissingness mode none
;; minimum support 3

!(bind! &res2 (new-space))

 ;!(pattern-miner &res2 &db 3 1 none) 
 ;!(collapse (match &res2 $pattern $pattern ))
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