; (: Nat Type)
; (: Z Nat)
; (: S (-> Nat Nat))

(= (debruijn2num Z) 0)

(= (debruijn2num (S $k)) (+ 1 (debruijn2num $k)))

(= (fromNum $n) (if (<= $n 0) Z (S (fromNum (- $n 1)))))

(= (make_var1 $x) (let $v (py-call (format-args "$var{}" ($x))) (py-call (parse (parse (repr $v))))))

(= (generate $x $space)
    (let* (
        (true (println! (in generate $space)))
        ($num (eval (debruijn2num $x)))
        (true (println! (in dev $num)))
        ($result   (eval (unify $space ($num $var)  $var (make_var1 $num))) )
        (true (println! (in res $result)))
        ($result2   (eval (unify $space ($num $var)  yes No)) )
        (true (println! (in res $result2)))
        ($dummy (eval (add-atom-nodup $space ($num $result))))
        )
       $result
        )
)

($num $var)

(= (replacev $pattern $space)
    (map-atom $pattern $x (if (== (get-type $x) Nat) (generate $x $space) 
                              (if (and (not (== (get-type $x) Nat)) 
                               (== (get-metatype $x) Expression)) (replacev $x $space) $x))) ;
)

; (= (replacev-helper $x) (
;     if (== (get-type $x) Nat) (generate $x) 
;                                (if (and (not (== (get-type $x) Nat)) 
;                                (== (get-metatype $x) Expression)) (replacev $x) $x)
; ))

; (= (replacev $pattern) 
;     ( replacev-helper (superpose $pattern)
; ))

(= (num2deb $pattern)
    (map-atom $pattern $x (if (== (get-type $x) Number) (fromNum $x) (if (and (not (== (get-type $x) Number)) (== (get-metatype $x) Expression)) (num2deb $x) $x)))
)


(= (replace $pattern)
(let* (
       ($result (eval (var2num $pattern 0 ())))
       (($numpat $index $list) $result)
       ($deb (num2deb $numpat))
       )
       $deb))

       
(= (var2num () $index $list)
    (() $index $list) ; Return the empty list, current index, and list
)

(= (check $list $var)
   (if (== $list ())
        False
        (if (== $var (car-atom $list))
            True
            (check  (cdr-atom $list) $var))
    )
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
            ($is_var (==  (get-metatype $head) Variable))
            ($is_expr (==  (get-metatype $head) Expression))
            ($check (check $list ($head)))
            ($processed_head_and_index (eval (if $is_expr
                                        (var2num $head $index $list) ; Recursive call for sub-expression
                                        (if $is_var
                                            (if $check
                                                ((find_index $list $head 0) $index $list) ; Return existing index, current index, and list
                                                ;($index (+ $index 1) (union-atom $list ($head))) ; Return new index, incremented index, and updated list
                                                False
                                              )
                                            ($head $index $list) ; Not a var or expr, return head, current index, and list
                                        )
                                    )))

            ($here ($index (+ $index 1) (union-atom $list ($head))) )
            (($res_head $new_index $new_list) (if  (== False $processed_head_and_index) 
                                                   ($index (+ $index 1) (union-atom $list ($head)))  $processed_head_and_index))
            
            ($processed_tail_and_index (var2num $tail $new_index $new_list)) ; Recursive call for tail with updated index and list
            (($res_tail $final_index $final_list) $processed_tail_and_index)

        )
        ((cons-atom $res_head $res_tail) $final_index $final_list)
        )   
)