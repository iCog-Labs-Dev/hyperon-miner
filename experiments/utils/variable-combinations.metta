; Check if a variable is in a list
(= (is-var-in-list $var $list) (if (== $list ()) False (let $head (car-atom $list) (if (== $var $head) True (is-var-in-list $var (cdr-atom $list))))))


; Generate combinations of variables
(= (combine-vars $vars $count $combinations) 
    (let* (
        ($tmp-vars (superpose $vars))
        ($tmp-combinations (if (== (car-atom ($combinations)) ()) () (superpose $combinations)))
        ($new-pattern (cons-atom $tmp-vars $tmp-combinations)))
        (if (== $count 1) $new-pattern (combine-vars $vars (- $count 1) (collapse $new-pattern)))))

; Check if variables from one list exist in another list
(= (vars-exist $list1 $list2) (if (== $list1 ()) False (let $head (car-atom $list1) (if (is-var-in-list $head $list2) True (vars-exist (cdr-atom $list1) $list2)))))


; Get filtered combinations of variables
(= (get-filtered-combinations $all-vars $vars1 $vars2 $length) 
    (let* (
        ($combinations (combine-vars $all-vars $length ()))
        ($vars1-check (if (vars-exist $combinations $vars1) $combinations Empty))
        ($vars2-check (if (vars-exist $combinations $vars2) $combinations Empty))
    ) $combinations
))


(= (create-variables $all-vars $cleared) (
    if (== $all-vars ()) $cleared (let $head (car-atom $all-vars ) (if (is-var-in-list $head $cleared) (create-variables (cdr-atom $all-vars) $cleared) (create-variables (cdr-atom $all-vars) (cons-atom $head $cleared))))
))


; Create combinations of variables from two patterns
(= (combine_lists $vars1 $vars2)
    (let* (
        ($all-vars1 (union-atom $vars1 $vars2))
        ($all-vars (create-variables $all-vars1 ()))
        ($length (tuple-count $vars2))
    ) (if (== $length 1) $vars1 (get-filtered-combinations $all-vars $vars1 $vars2 $length))
))


; !(experimenting with the second pattern that has 1 variable)
; !(combine_lists (link AAA $BBB) (link CCC $CCC))

; !(experimenting with the second pattern that has 2 variables)
; !(combine_lists (link  $AAA $BBB ) (link $BB $AA))

; !(experimenting with the second pattern that has 3 variables)
; !(combine_lists (link $AAA $BBB) (link $AA (link1 $CCC $DDD)))
