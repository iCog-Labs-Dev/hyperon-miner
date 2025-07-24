(=(is-pattern $expr) (
    collapse(
 or (unify $expr ($link $x $y) (
       and (is-symbol $link) (
        or (or (is-variable $x) (is-expression $x))
             (or (is-variable $y) (is-expression $y)))) False)
    (unify $expr ($link $x) 
       (and (is-symbol $link) 
        (or (is-variable $x) 
            (is-expression $x))) False ) )))
            
(=(is-present $atom ()) False)
(=(is-present $atom $list) (
    if (is-expression $list) (
    let* ((($head $tail) (decons-atom $list))) (
        if (== $atom $head) True  (or (is-present $atom $head) (is-present $atom $tail))
    )) (if (== $atom $list) True False)))
    
(=(is-symbol $var) 
   (== (get-metatype $var) Symbol)
)

(=(is-variable $var) 
   (== (get-metatype $var) Variable)
)

(=(is-expression $var) 
  (== (get-metatype $var) Expression)
)

(=(checkIntersection $var $set) 
    (not (== ((intersection-atom ($var) $set)) (())))) 


(=(process-pattern $pattern $var)
    (let* (
        (($is_pat ) (is-pattern $pattern)))
    
        (if $is_pat
            ; If it's a pattern, do the normal check
            (let* (
                ($is_expression (== (get-metatype $pattern) Expression))
                ($vars (cdr-atom $pattern))
                ($is_connected (checkIntersection $var $vars))
            )
                (if (and $is_expression $is_connected)
                    $pattern
                    (empty)
                )
            )
           
               (process-pattern (superpose $pattern) $var)
     
        )
    ))




(=(connected-subpatterns-with-var $partition $var)

 (collapse (process-pattern (superpose $partition ) $var)))





    
    
!(connected-subpatterns-with-var (((Inheritance $x $y) (Inheritance $y $z)) (Inheritance $j $f)  (Inheritance $y $k)) $y)   

