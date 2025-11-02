



(: Constant (-> String $a))

; Function to replace a variable with @var throughout a pattern
; Usage: (erase $pattern $var)
; Example: (erase ((Man $x Eyob) (Student $x Newyork)) $x)
; Result: ((Man @eyob Eyob) (Student @eyob Newyork))

; Main replacement function using collapse and superpose
; 1. Helper for simple (non-pattern) replacement
(= (get-replacement $head $var $replacement)
   (if (== $head $var)
       $replacement
       $head))

; 2. The head logic (now using eval for the function call)
(= (handle-head $head $var $replacement)
    (if (checkPat $head) ; Let translator convert this to checkPat(A, true)
        (eval (replace-var-exp $head $var $replacement)) ; Force evaluation of the recursive call
        (get-replacement $head $var $replacement)  
    )
)

; 3. The main function
(= (replace-var-exp $exp $var $replacement )  
   (if (== $exp ())
       ()
       (let* (
          (($head $tail) (decons-atom $exp))
          ($updated-head (handle-head $head $var $replacement)) 
          ($updated-tail (replace-var-exp $tail $var $replacement))
       )
       (cons-atom $updated-head $updated-tail)
   ))
)

(= (replace-var $expr $var $replacement) 
   (collapse (replace-var-exp (superpose $expr) $var $replacement)))

(= (erase $pattern $var)
   (replace-var $pattern $var @eyob))





; (= (replace-var-exp $exp $var $replacement )  
;    (let* (
;       ;  ($is_pat (checkPat $exp))
;        (($link $tail) (decons-atom $exp))
;        ($updated-tail (handle_tail $tail $var $replacement () ))
 
       
;        ($ans (union-atom ($link) $updated-tail)) 
;    )
;    $ans ))

; (= (handle_tail $tale $var $replacement $acc) (if (== $tale ()) $acc (let* ((($cur $nxt) (decons-atom $tale)) ($updated-cur (handle_predicate $cur $var $replacement  )) ($new-acc (union-atom $acc ($updated-cur)))) (handle_tail $nxt $var $replacement $new-acc) )) )

; (=(handle_predicate $predicate $var $replacement)
; (let $invar (checkPat $predicate) (if $invar (replace-var-exp $predicate $var $replacement)  (if (== $predicate $var) $replacement $predicate))))

; Check if variable exists in a single expression
; (= (var-exist-exp $exp $var)  
;    (let ($link $var1 $var2) $exp
;        (or (== $var1 $var) (== $var2 $var))))



; Check if variable exists in the entire pattern
(=(is-var-same $predicate $var) (if (checkPat $predicate ) (let $tail (cdr-atom $predicate ) (is-var-same (superpose $tail) $var)) (if (== $predicate $var) True (empty))))

(= (var-exist-exp $exp $var)  
   (if (checkPat $exp) 
      (let* (($tail (cdr-atom $exp)) ($ans (collapse (is-var-same (superpose $tail) $var) ) ) ($len (size-atom $ans)) ) (if (== $len 0) False True)) False))


; 1. Helper for the recursive/Else branch
(= (is-var-exist-recur $tail $var)
    (if (== $tail ()) ; Base Case (was the main function's base case)
        False
        (eval (is-var-exist $tail $var)) ; Recursive call
    )
)

; 2. The main function (no more 'let')
(= (is-var-exist $exp $var) 
   (if (== $exp ())
       False
       (if (eval (var-exist-exp (car-atom $exp) $var)) ; Check current element
           True
           (is-var-exist-recur (cdr-atom $exp) $var) ; Go to recursive helper
       )
   )
)



; Get all variables from a pattern
; Check if two patterns can be unified after treating var as constant

; (= (can-unify-expr $body1 $body2) 
;    ( collapse (
;         unify $body1 $body2 True False
;     ))
 
;  )
; ; Main unification function for atom bodies
; (= (can-unify $l_body $r_body)
;    (if (== (size-atom $l_body) (size-atom $r_body))
;        (let* (
;            ($left_empty (== (size-atom $l_body) 0))
;            ($right_empty (== (size-atom $r_body) 0))
;        )
;        (if (and $left_empty $right_empty)
;            True
;            (if (or $left_empty $right_empty)
;                False
;                (let* (
;                    ($l_head (car-atom $l_body))
;                    ($l_tail (cdr-atom $l_body))
;                    ($r_head (car-atom $r_body))
;                    ($r_tail (cdr-atom $r_body))
;                    (($head_unify) (can-unify-expr $l_head $r_head))
          
;                )
;                (if $head_unify
;                    (can-unify $l_tail $r_tail)
;                    False)))))
;        False))


(= (can-unify $l_body $r_body) True)
(= (validate-unification $left-body $right-body) True)






; (= (validate-unification $left-body $right-body) 
;    (let* ( ($indexed-right-body (replace $right-body)) 
; ;    ($_ (println! (right body is $right-body validate called et the replaced is $indexed-right-body ) ))
;    ) 
;         (let* (($for (can-unify $left-body $indexed-right-body)) 
;         ; ($_ (println! (the bool of val_uni is $for ))) 
;         ) $for)
;     )
; )
; Main function: check if l_pat is more abstract than r_pat with respect to var
; (= (is-blk-syntax-more-abstract $l_pat $r_pat $var)
;    (let* (
;        ; Check if var exists in both patterns

;        ($l_has_var (is-var-exist $l_pat $var))
;        ($r_has_var (is-var-exist $r_pat $var))
       
;        ; If var is not in both patterns, return False
;        ($both_have_var (and $l_has_var $r_has_var))
;    )
;    (if (not $both_have_var)
;        False
;        (let* (
;            ; Convert var to constant (@eyob) in both patterns
;            ($l_body (erase $l_pat $var))
;            ($r_body (erase $r_pat $var))
           
;            ; Try to unify the modified patterns
;            ($can_unify_result (can-unify $l_body $r_body))
          
;        )
;             (if $can_unify_result 
;                 (validate-unification $l_body $r_body) 
;                 False
;             )
;        )
;     )
;     )
; )

; Function to force the execution of the main function body
; 1. New Helper: Execute all the expensive logic and return the FINAL boolean result
(= (final-abstraction-check $l_pat $r_pat $var)
   (let* (
       ($l_has_var (is-var-exist $l_pat $var))
       ($r_has_var (is-var-exist $r_pat $var))
       ($l_body (erase $l_pat $var))
       ($r_body (erase $r_pat $var))
       ($can_unify_result (can-unify $l_body $r_body))
       
       ($check1 (and $l_has_var $r_has_var))
       ($check2 (and $can_unify_result $check1))
   )
   (and (validate-unification $l_body $r_body) $check2)
))


; 2. The main function
(= (is-blk-syntax-more-abstract $l_pat $r_pat $var)
   (if (eval (final-abstraction-check $l_pat $r_pat $var)) ; CALL HELPER
       True ; If the complex check passes, return True
       False ; Otherwise, return False
   )
)








(= (is-blk-more-abstract $l_blk $r_blk $var) 
   (let* (
            ($rps (powerset-without-empity $r_blk))  
            ($l_partitions (partitions $l_blk))  
         
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
       (let $rs  (car-atom $subsets)
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
(: uniq (-> Expression Exprssion Expression))
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






