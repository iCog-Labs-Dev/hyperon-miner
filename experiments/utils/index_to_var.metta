! (register-module! ../../../hyperon-miner)
! (import! &self hyperon-miner:experiments:utils:common-utils)
! (import! &self hyperon-miner:experiments:rules:freq-pat)


(= (debruijn2num Z) 0)

(= (debruijn2num (S $k)) (+ 1 (debruijn2num $k)))

(= (fromNum $n) (if (<= $n 0) Z (S (fromNum (- $n 1)))))


(= (replacev $pattern)
    (map-atom $pattern $x (if (== (get-type $x) Nat) (gen_var (eval (debruijn2num $x))) (if (and (not (== (get-type $x) Nat)) (== (get-metatype $x) Expression)) (deb2var $x) $x))) ;
)
(= (num2deb $pattern)
    (map-atom $pattern $x (if (== (get-type $x) Number) (fromNumber $x) (if (and (not (== (get-type $x) Number)) (== (get-metatype $x) Expression)) (num2deb $x) $x)))
)

(= (replace $pattern)
    (let* (
        (($numpat $index $list) (var2num $pattern 0 ()))
        ($deb  (num2deb $numpat)) 
    ) 
    $deb
    )
)
(= (var2num () $index $list)
    (() $index $list) ; Return the empty list, current index, and list
)

(= (check $list $var)
   (if (== (intersection-atom $list $var) ()) False True)
)

(= (find_index () $var $index)
    ()
)

(= (find_index $list $var $index)
    (let* (
        ($head (car-atom $list))
        ($tail (cdr-atom $list))
        ($res (if (== $head $var) $index (find_index $tail $var (+ $index 1))))
    )
    $res
    )
)

(= (var2num $pattern $index $list)
        (let* (
            ($head (car-atom $pattern))
            ($tail (cdr-atom $pattern))
            ($is_var (== (get-metatype $head) Variable))
            ($is_expr (== (get-metatype $head) Expression))
            ($processed_head_and_index (if $is_expr
                                        (var2num $head $index $list) ; Recursive call for sub-expression
                                        (if $is_var
                                            (if (check $list ($head))
                                                ((find_index $list $head 0) $index $list) ; Return existing index, current index, and list
                                                ($index (+ $index 1) (union-atom $list ($head))) ; Return new index, incremented index, and updated list
                                            )
                                            ($head $index $list) ; Not a var or expr, return head, current index, and list
                                        )
                                    ))
            (($res_head $new_index $new_list) $processed_head_and_index)
            ($processed_tail_and_index (var2num $tail $new_index $new_list)) ; Recursive call for tail with updated index and list
            (($res_tail $final_index $final_list) $processed_tail_and_index)
        )
        ((cons-atom $res_head $res_tail) $final_index $final_list)
        )
    
)

!(var2deb (,(, (link $x $y) (an $o $y)) (this $x $t)))
!(var2deb (Inheritance $x $y))
