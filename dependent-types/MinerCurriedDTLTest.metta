!(register-module! ../../chaining)
!(import! &self chaining:dtl:backward:curried)
!(import! &self chaining:dtl:forward:curried)
!(import! &self chaining:dtl:utils)

!(register-module! ../../hyperon-miner)
!(import! &self hyperon-miner:utils:MinerUtils)
!(import! &self hyperon-miner:dependent-types:bc-system-prf)

;; Load db
!(import! &db hyperon-miner:data:sample2)
;; Remove, stdlib, corelib DynSpace imported
!(match &db $x (if (== (get-type $x) hyperon::space::DynSpace) (remove-atom &db $x) (Empty) ))

;; Parameters
(= (highsurp) 0.8)
(= (ms) 2)

;; Type definition for -> to prevent early reduction
;; of the conclusions before matching the correct premises.
(: -> (-> Atom Atom Type))

;;;;;;;;;;;;;;;;;;;;;;
;; KB and rule base ;;
;;;;;;;;;;;;;;;;;;;;;;

!(import! &kb hyperon-miner:dependent-types:MinerCurriedDTL)
;; Remove, stdlib, corelib DynSpace imported
!(match &kb $x (if (== (get-type $x) hyperon::space::DynSpace) (remove-atom &kb $x) (Empty)))

;; Initialize miner with the given db, kb and parameters
!(init-miner &db &kb (ms) (highsurp))

;;;;;;;;;;
;; Test ;;
;;;;;;;;;;

; initial fact: Abstract pattern (interacts_with X Y) has enough support
!(add-atom &kb (: FACT (supportOf (interacts_with (VarIdx Z) (VarIdx (S Z))) 5)))

;; Test 1
; !(syn &kb (fromNumber 11) (: $prf $concln))

;; Test 2
; !(let $r (syn &kb (fromNumber 11) (: $prf $concln)) (add-atoms-nodup &kb (collapse $r)))
; !(syn &kb (fromNumber 4) (: $prf (minsup $ptrn)))

;; Test 3
;; FIXME: iterative synthesize not working? 
; !(isyn &kb (fromNumber 9) (S (S Z)) (: $prf (minsup $ptrn)))

;; Test 4
;; Recursive call
; !(let $a (syn &kb (fromNumber 4) (: $prf (minsup $ptrn))) (add-atoms-nodup &kb (collapse $a)))
; !(let $b (syn &kb (fromNumber 5) (: $prf (supportOf $ptrn $cnt))) (add-atoms-nodup &kb (collapse $b)))
; !(let $c (syn &kb (fromNumber 5) (: $prf (minsup $ptrn))) (add-atoms-nodup &kb (collapse $c)))
; !(let $d (syn &kb (fromNumber 5) (: $prf (supportOf $ptrn $cnt))) (add-atoms-nodup &kb (collapse $d)))
; !(syn &kb (fromNumber 5) (: $prf (minsup $ptrn)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Recursive minsup algorithm  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; step 1
; (minsup P1)
; (minsup P2)
; (minsup P3)
; ...
; step2
; (, (minsup P1) (minsup P2))
; (, (minsup P1) (minsup P3))
; (, (minsup P2) (minsup P3))
; ...
; step3
; (, (minsup P1) (, (minsup P1) (minsup P2)))
; (, (minsup P1) (, (minsup P2) (minsup P3)))
; (, (minsup P2) (, (minsup P1) (minsup P3)))
; ...
; step 4
; (, (minsup P1) (, (minsup P1) (, (minsup P1) (minsup P2))))
; ...
