 ;  * cnjtion = (Inheritance X Y)
 ;  * pattern = (Inheritance Z W)

 ! (register-module! ../../../experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:rules:freq-pat)
! (import! &self experiments:rules:conj-exp)
! (import! &self experiments:rules:conjunction-expansion)
; ! (import! &self experiments:utils:variable-combinations)

;; test knowledge base
(Inheritance A B)
(Inheritance B C)
(INHERITANCE_LINK A B)
(LIST_LINK A B)


!(expand_conjunction (Inheritance $X $Y) (Inheritance $Z $W) &self 1 2 False)
;;EXPECTED
; [ (, (Inheritance $X $Y) (Inheritance $X $Y)),
;; THE ABOVE IS INCLUDED BECAUSE THE REMOVAL OF REDUNDANT CLAUSES IS NOT INCLUDED YET
;   (, (Inheritance $X $Y) (Inheritance $Z $Y)), 
;  (, (Inheritance $X $Y) (Inheritance $Y $W)),
;   (, (Inheritance $X $Y) (Inheritance $Z $X)), 
;   (, (Inheritance $X $Y) (Inheritance $X $W))]
!(expand_conjunction (INHERITANCE_LINK $X $Y) (LIST_LINK $Z $W) &self 1 2 False)
;;EXPECTED
; [ (, (INHERITANCE_LINK $X $Y) (LIST_LINK $X $Y)), 
; (, (INHERITANCE_LINK $X $Y) (LIST_LINK $Z $Y)),
;  (, (INHERITANCE_LINK $X $Y) (LIST_LINK $X $W))]


