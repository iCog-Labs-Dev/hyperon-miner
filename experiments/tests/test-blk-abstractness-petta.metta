
! (import! &self ../utils/common-utils-petta)
! (import! &self ../utils/index_to_var-petta)
! (import! &self ../utils/blk-abstractness-petta)
! (import! &self ../utils/partition-metta-petta)

; (= (can-unify-ground $ground1 $ground2)
;     (if (== $ground1 $ground2)
;         True
;         (if (or (== (get-metatype $ground1) Variable)
;                 (== (get-metatype $ground2) Variable))
;                 True
;                 False)
;     )
; )

; (= (can-unify-ground $ground1 $ground2)

; (unify $ground1 $ground2 True False)
; )

; !(can-unify-ground $x $x)
; !(can-unify-ground Abebe kebede)
; (=(checkPat $x)
;     (let $type (get-metatype $x)
;         (if (not (== $type Expression))
;             False
;             (and
;                 (> (size-atom $x) 1)
;                 (let $head (car-atom $x)
;                     (== (get-metatype $head) Symbol)
;                 )
;             )
;         )
;     )
; )


; 1. Helper for the main recursive step
; (= (can-unify-step $l_body $r_body)
;     (let* (
;         ($l_head (car-atom $l_body))
;         ($l_tail (cdr-atom $l_body))
;         ($r_head (car-atom $r_body))
;         ($r_tail (cdr-atom $r_body))
        
;         ; Evaluate and check if unification succeeded (returns [True] or [])
;         ($head_unify (eval (can-unify-expr $l_head $r_head))) 
;         ; Check if $head_unify is non-empty ([True]), which means unification succeeded
;         ($is_unifiable (not (== $head_unify ())))
;     )
;     ; Check the result and recurse
;     (if $is_unifiable
;         (eval (can-unify $l_tail $r_tail)) ; FORCE EVAL for recursion
;         False                              ; CLEAN FALSE RETURN
;     ))
; )

; ; 2. The main function (simplified flow control)
; (= (can-unify $l_body $r_body)
;    (if (== (size-atom $l_body) (size-atom $r_body)) ; Check size match first
;        ; Now we know sizes match, so either both are empty, or both are non-empty
;        (if (== (size-atom $l_body) 0) 
;            True ; Both are empty (Base Case: Unification successful)
;            (can-unify-step $l_body $r_body) ; Recurse on non-empty lists
;        )
;        False ; Sizes don't match (Failure Case)
;    )
; )
 


; (= (validate-unification $left-body $right-body) 
;    (let* ( ($indexed-right-body (replace $right-body)) 
; ;    ($_ (println! (right body is $right-body validate called et the replaced is $indexed-right-body ) ))
;    ) 
;         (let* (($for (can-unify $left-body $indexed-right-body)) 
;         ; ($_ (println! (the bool of val_uni is $for ))) 
;         ) $for)
;     )
; )

; ! (erase ((Human $x man) (Inheritance $x Person )) $x) 
; !(is-var-exist ((Human $x Abebe)) $x)
;!(partitions ((Human $x $y)) ((Human $x Abebe)))
!(is-blk-syntax-more-abstract ((Human $x $y)) ((Human $x Abebe)) $x)

!(is-blk-syntax-more-abstract ((Human Abebe)) ((Human $x $y)) $x) ; False because of is var exist check

; !(is-blk-syntax-more-abstract ((Human (Person $x) (Person $y))) ((Human (Person $x) (Person Abebe))) (Person $x))

; !(is-blk-syntax-more-abstract ((Human (Person $x) (Person $y))) ((Human (Person $x) (Person Abebe))) $x)

;  !(is-blk-syntax-more-abstract ((Human (Person $x) (Person Abebe))) ((Human (Person $x) (Person $y))) (Person $x))

; !(is-blk-syntax-more-abstract ((Inheritance $x (Person $y))) ((Inheritance $x (Person Abebe) )) $x)


