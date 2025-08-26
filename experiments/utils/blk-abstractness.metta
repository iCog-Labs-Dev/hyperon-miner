



(: Constant (-> String $a))

; Function to replace a variable with @var throughout a pattern
; Usage: (erase $pattern $var)
; Example: (erase ((Man $x Eyob) (Student $x Newyork)) $x)
; Result: ((Man @eyob Eyob) (Student @eyob Newyork))

(= (erase $pattern $var)
   (replace-var $pattern $var @eyob))

; Main replacement function using collapse and superpose
(= (replace-var $expr $var $replacement) 
   (collapse (replace-var-exp (superpose $expr) $var $replacement)))



; Replace variable in an expression 
(= (replace-var-exp $exp $var $replacement)  
   (let* (
       (($link $var1 $var2) $exp)
       ($subvar1 (sub-var $var1 $var $replacement))
       ($subvar2 (sub-var $var2 $var $replacement)) 
   )
   ($link $subvar1 $subvar2)))


; Substitute variable in a single atom
(= (sub-var $atom $var $replacement)  
   (if (== (get-metatype $atom) Variable)
       (if (== $atom $var)
           $replacement
           $atom)
       $atom))


; Check if variable exists in a single expression
(= (var-exist-exp $exp $var)  
   (let ($link $var1 $var2) $exp
       (or (== $var1 $var) (== $var2 $var))))

; Check if variable exists in the entire pattern
(= (is-var-exist $exp $var) 
   (if (== $exp ())
       False
       (let $che (var-exist-exp (car-atom $exp) $var) (if $che 
           True
           (is-var-exist (cdr-atom $exp) $var)))))

; Get all variables from a pattern
; Check if two patterns can be unified after treating var as constant
; (= (can-unify $l_body $r_body $db)
;    (let*( 
    
;     ($conj-l (union-atom (,) $l_body))
;     ($conj-r (union-atom (,) $r_body))

;     ($value-l (collapse (match $db $conj-l $conj-l)))
;     ($value-r (collapse (match $db) $conj-r $conj-l)))

;     ($is-unify1 (== (subsctract-atom $value-l $value-r) ()))
;     ($is-unify2 (== (subsctract-atom $value-r $value-l) ()))

;     )

;     (Or $is-unify1 $is-unify2)  ; Both conditions must be true for unification

;    )
        

; (= (can-unify $l_body $r_body)
; (
;     let* (
;        ($- (!(bind! &left $l_body)) )
;        ($__ (!(bind! &right $r_body)) )
;        ($_ (println! (can un called with (&left) (&right))))
;     )
;     (unify &left &right True False)
; )
; )

; Main unification function for atom bodies
(= (can-unify $l_body $r_body)
   (if (== (size-atom $l_body) (size-atom $r_body))
       (let* (
           ($left_empty (== (size-atom $l_body) 0))
           ($right_empty (== (size-atom $r_body) 0))
       )
       (if (and $left_empty $right_empty)
           True
           (if (or $left_empty $right_empty)
               False
               (let* (
                    ($_ (println! (can-unify called with $l_body $r_body)))
                   ($l_head (car-atom $l_body))
                   ($l_tail (cdr-atom $l_body))
                   ($r_head (car-atom $r_body))
                   ($r_tail (cdr-atom $r_body))
                   ($head_unify (can-unify-expr $l_head $r_head))
               )
               (if $head_unify
                   (can-unify $l_tail $r_tail)
                   False)))))
       False))

(= (can-unify-expr ($link1 $pridicate1 $conclusion) ($link2 $pridicate2 $conclusion2)) 
    (
        if (== $link1 $link2)
            (let* (
                ($can-unify1 (can-unify-ground $pridicate1 $pridicate2))
                ($can-unify2 (can-unify-ground $conclusion $conclusion2))
            )
            (and $can-unify1 $can-unify2))
        
            False
    )
 
 )

 (= (can-unify-expr ($link1 $pridicate1 ) ($link2 $pridicate2)) 
    (
        if (== $link1 $link2)
            (let* (
                ($can-unify1 (can-unify-ground $pridicate1 $pridicate2))
                
            )
             $can-unify1)
        
            False
    )
 
 )


;we need to change this so that (Person $x) can be unified with (Person Abebe), becasuse eventhough they are not equal, since the expression with the variable is just a more absract version of the second expression.
(= (can-unify-ground $ground1 $ground2)
    (if (== $ground1 $ground2)
        True
        (if (or (== (get-metatype $ground1) Variable)
                (== (get-metatype $ground2) Variable))
                True
                False)
    )
)

;main change to handle calls like this as well: (is-blk-syntax-more-abstract ((Human (Person $x) (Person Abebe))) ((Human (Person $x) (Person $y))) (Person $x))
; (= (can-unify-ground $ground1 $ground2)
;     (if (== $ground1 $ground2)
;         True
;         (if (and (== (get-metatype $ground1  ) Expression) (== (get-metatype $ground2 ) Expression ) ) (can-unify-expr $ground1 $ground2) (if (or (== (get-metatype $ground1) Variable)
;                 (== (get-metatype $ground2) Variable))
;                 True
;                 False))
;     )
; )


; (= (validate-unification $left-body $right-body) 
;    (let $indexed-right-body (replace $right-body) 
;         (can-unify $left-body $indexed-right-body)
;     )
; )

(= (validate-unification $left-body $right-body) 
   (let* ( ($indexed-right-body (replace $right-body)) 
;    ($_ (println! (right body is $right-body validate called et the replaced is $indexed-right-body ) ))
   ) 
        (let* (($for (can-unify $left-body $indexed-right-body)) 
        ; ($_ (println! (the bool of val_uni is $for ))) 
        ) $for)
    )
)
; Main function: check if l_pat is more abstract than r_pat with respect to var
(= (is-blk-syntax-more-abstract $l_pat $r_pat $var)
   (let* (
       ; Check if var exists in both patterns

       ($l_has_var (is-var-exist $l_pat $var))
       ($r_has_var (is-var-exist $r_pat $var))
       
       ; If var is not in both patterns, return False
       ($both_have_var (and $l_has_var $r_has_var))
   )
   (if (not $both_have_var)
       False
       (let* (
           ; Convert var to constant (@eyob) in both patterns
           ($l_body (erase $l_pat $var))
           ($r_body (erase $r_pat $var))
           
           ; Try to unify the modified patterns
           ($can_unify_result (can-unify $l_body $r_body))

        ;    ($_ (println! (after unification in blk left is $l_body et right is $r_body)))
       )
            (if $can_unify_result 
                (validate-unification $l_body $r_body) 
                False
            )
       )
    )
    )
)










(= (is-blk-more-abstract $l_blk $r_blk $var) 
   (let* (
            ($rps (powerset-without-empity $r_blk))  
            ($l_partitions (partition $l_blk))  
         
        )
         (check-partitions $l_partitions $rps $var)
))


(= (check-partitions $partitions $rps $var) 
   (if (== $partitions ())
       False  ; No more partitions, return False
       (let $lp (car-atom $partitions)
         (if (check-subsets $lp $rps $var)
             True  ; Found valid combination
             (check-partitions (cdr-atom $partitions) $rps $var)))))  ; Try next partition

;; Check each subset in rps for current partition lp (flat list)
(= (check-subsets $lp $subsets $var)
   (if (== $subsets ())
       False  ; No more subsets, return False
       (let $rs (car-atom $subsets)
         (if (check-all-blocks $lp $rs $var)
             True  ; All blocks match with this subset
             (check-subsets $lp (cdr-atom $subsets) $var)))))  ; Try next subset

;; Check if all blocks in partition match the current subset (flat list)
(= (check-all-blocks $blocks $rs $var)
   (if (== $blocks ())
       True   ; All blocks checked, return True
       (let $lb (car-atom $blocks)
         (if (is-blk-syntax-more-abstract $lb $rs $var)
             (check-all-blocks (cdr-atom $blocks) $rs $var)  ; Continue checking
             False))))  ; One block failed, return False


(: is-membership (-> $a Expression Bool))
(= (is-membership $elem $list) (
    if (== $list ())
    False
    (let ($head $tail) (decons-atom $list)
        (if (== $head $elem)
            True
            (is-membership $elem $tail)
        ) 

    )

))
(: merge-list (-> Expression Expression Expression))
(= (merge-list $list1 $list2)  (unique-list (union-atom  $list1 $list2)))
; (: unique-list (-> Expression Expression))
(= (unique-list $list)
    (uniq $list ())
)
; (: uniq (-> Expression Exprssion Expression))
(= (uniq $list1  $acc)
    (if (== $list1 ())
        $acc
        (let* (
            (($head $tail) (decons-atom $list1))
        )
            (if (is-membership $head $acc)
                (uniq $tail $acc)
                (let $newAcc (union-atom  $acc ($head))
                    (uniq $tail $newAcc) 
                )
            )
        )
    )

)






