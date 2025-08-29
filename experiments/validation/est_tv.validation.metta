! (register-module! ../../../hyperon-miner/experiments)

! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:emp-prob)
! (import! &self experiments:truth-values:emp-tv)
! (import! &kb experiments:data:ugly_man_sodaDrinker)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:truth-values:est-tv)

; ========== ji-tv-est in our implementation versus the classic one =================
;;;; here i have listed out the examples i have tested with, their values on the classic and on our implementation ;;;;

!(do-ji-tv-est  &kb (,(Inheritance $x ugly) (Inheritance $x man) (Inheritance $x sodaDrinker)))
; conjunction: (,(Inheritance $x ugly) (Inheritance $x man) (Inheritance $x sodaDrinker))
; result 
;   on our implementation: (STV 0 0.00027229280235977334)
;   on OPEN-COG miner's implementation: (stv 0 0.000272293)

(do-ji-tv-est  &kb (,(Inheritance $x woman) (Inheritance $x human) (Inheritance $x sodaDrinker)))
; conjunction: (,(Inheritance $x woman) (Inheritance $x human) (Inheritance $x sodaDrinker))
; result 
;   on our implementation: (STV 0 0.0002141712796459233)
;   on OPEN-COG miner's implementation: (stv 0 0.000214171)

(do-ji-tv-est  &kb (,(Inheritance $x ugly) (Inheritance $x human) (Inheritance $x sodaDrinker)))
; conjunction: (,(Inheritance $x ugly) (Inheritance $x human) (Inheritance $x sodaDrinker))
; result 
;   on our implementation: (STV 0 0.0002141712796459233)
;   on OPEN-COG miner's implementation: (stv 0 0.000214171)

(do-ji-tv-est  &kb (,(Inheritance $x ugly) (Inheritance $x man)))
; conjunction: (,(Inheritance $x ugly) (Inheritance $x man))
; result 
;   on our implementation: (STV 0.0027777777777780515 0.0006976744186046523)
;   on OPEN-COG miner's implementation: (stv 0.00277778 0.000697674)

(do-ji-tv-est  &kb (,(Inheritance $x ugly) (Inheritance $x sodaDrinker)))
; conjunction: (,(Inheritance $x ugly) (Inheritance $x sodaDrinker))
; result 
;   on our implementation: (STV 0.0027777777777780515 0.0006976744186046523)
;   on OPEN-COG miner's implementation: (stv 0.00277778 0.000697674)