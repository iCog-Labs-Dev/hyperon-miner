; (=(is-pattern $expr) (
;     collapse(
;  or (unify $expr ($link $x $y) (
;        and (is-symbol $link) (
;         or (or (is-variable $x) (is-expression $x))
;              (or (is-variable $y) (is-expression $y)))) False)
;     (unify $expr ($link $x) 
;        (and (is-symbol $link) 
;         (or (is-variable $x) 
;             (is-expression $x))) False ) )))
(=(checkIntersection $var $set) 
    (not (== ((intersection-atom ($var) $set)) (())))) 

(=(process-pattern $pattern $var)
    (let* (
        ($is_pat (checkPat $pattern))
        
        )
    
        (if $is_pat
            ; If it's a pattern, do the normal check
            (let* (
                ;($is_expression (== (get-metatype $pattern) Expression))
                ; ($vars (cdr-atom $pattern))
                ;($exp (if $is_exp $pattern (car-atom $pattern)))
                ($exp (if (== (size-atom $pattern) 1) (car-atom $pattern) $pattern))
                ($vars (cdr-atom $exp))
                ($is_connected (checkIntersection $var $vars))
            )
                (if $is_connected
                    $pattern
                    (empty)
                )
            )
           
            ;    (process-pattern (superpose $pattern) $var)

            ;(collapse (process-pattern (superpose $pattern) $var)) ;activate this for checking inside the block, comment out if not
                             
            (let $ch (collapse (process-pattern (superpose $pattern) $var)) (if (not (== $ch ())) $pattern (empty) )) ;activate this for returning the whole block, comment out if not
              
     
        )
    ))


(=(rmvPar $x) (if (== $x ()) (empty) (let $fuc (checkPat $x) (if $fuc $x  (if (== (size-atom $x) 1) (car-atom $x) $x))))) 

(=(checkPat $x)(if (== (size-atom $x) 1) True (if (==( let $hell (car-atom $x) (get-metatype $hell)) Symbol) True False)))

 (=(connected-subpatterns-with-var $partition $var)

(collapse (rmvPar (process-pattern (superpose $partition ) $var))))


!(connected-subpatterns-with-var (((Inheritance $y $f) (Inheritance $u $z $i)) ((Inheritance $i $f))  ((Inheritance $y $k))) $i)     


;;================================================================================================================================

;alternate for the get-variables using superposition, and works with links that connect any number of nodes




(=(ret-vars $x) (if (== ( get-metatype $x ) Variable) $x (empty)))

(=(get-variables-helper $pattern) (let $a (cdr-atom $pattern) (ret-vars (superpose $a))))



(=(get-variables-step $lst $acc) (if  (== $lst ()) $acc (let* ((($head $tail) (decons-atom $lst))) (if (== ((intersection-atom ($head) $acc)) (())) (get-variables-step $tail (cons-atom $head $acc)) (get-variables-step $tail $acc))) ))

(=(get-variables $conjunct) (let $lst (collapse (let $a (car-atom $conjunct) (if (not (== $a ,)) (get-variables-helper $conjunct )(let $b (cdr-atom $conjunct) (get-variables-helper (superpose $b)))))) (get-variables-step $lst ())) )

