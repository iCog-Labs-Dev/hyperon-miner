(: Nat Type)
(: Z Nat)
(: S (-> Nat Nat))

(= (debruijn2num Z) 0)

(= (debruijn2num (S $k)) (+ 1 (debruijn2num $k)))

(= (fromNum $n) (if (<= $n 0) Z (S (fromNum (- $n 1)))))

(= (make_var1 $x) (let $v (format-args "$var{}" ($x)) (parse (parse (repr $v)))))

(= (generate $x)
    (let* (
        ($num (eval (debruijn2num $x)))
        )
        (make_var1 $num))
)
(= (convert $x)
    (let* (
        ($index (eval (fromNum $x)))
        )
    $index)
)
(= (get-conjunct $cnj) (
  unify ($ncnj $ptrn) $cnj (let $result (get-conjunct $ptrn) (cons-atom $ncnj $result) ) ($cnj)
))
; !(get-conjunct (Inheritance Z var1))
; !(get-conjunct (S (S Z)))
; !(intersection-atom (get-conjunct (S (S Z))) (S Z))
; !(intersection-atom (B C S S S Z) (S Z))
; !(intersection-atom (A S S Z) (S Z))
(= (checker $x)
    (let $flat (get-conjunct $x) (== (unique-atom $flat) (S Z)))
)
(= (replacev $pattern)
    (map-atom $pattern $x (if (== (get-metatype $x) Expression) (if (checker $x) (generate $x) (replacev $x)) (if (== (get-type $x) Nat) (generate $x) $x)))
)
(= (num2deb $pattern)
    (map-atom $pattern $x  (if (== (get-metatype $x) Expression) (num2deb $x) (if (== (get-type $x) Number) (fromNum $x) $x)))
)
; (= (num2deb $pattern)
;     (map-atom $pattern $x (if (== (get-type $x) Number) (fromNum $x) (if (and (not (== (get-type $x) Number)) (== (get-metatype $x) Expression)) (num2deb $x) $x)))
; )

; (= (num2deb $pattern)
;     (let*
;         (
;             (car)
;         )
;     )
; )

(= (replace $pattern)
    (let* (
        (() (println! $pattern))
        (($numpat $index $list) (var2num $pattern 0 ()))
        (() (println! ($numpat , $index , $list)))
        ; ($res (var2num $pattern 0 ()))
        ; ($numpat (car-atom $res))
        ($deb  (num2deb $numpat)) 
        (() (println! $deb))
    ) 
    $deb
    )
)
(= (var2num () $index $list)
    (() $index $list) ; Return the empty list, current index, and list
)

(= (check $list $var)
    (let* (
        (() (println! (here in check $list $var)))
        ($res (intersection-atom $list $var))
        (() (println! (here in check $res)))
        ) (if (== $res ()) False True)
    )
;    (if (== (intersection-atom $list $var) ()) False True)
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
            (() (println! (here in var2num $head)))
            ($tail (cdr-atom $pattern))
            (() (println! (here in var2num $tail)))
            ($is_var (== (get-metatype $head) Variable))
            (() (println! (here in var2num $is_var)))
            ($is_expr (== (get-metatype $head) Expression))
            (() (println! (here in var2num $is_expr)))
            ; (() (println! (here in var2num $list)))
            ($check (check $list ($head)))
            (() (println! (here in var2num $check)))
            ($processed_head_and_index (if $is_expr
                                        (var2num $head $index $list) ; Recursive call for sub-expression
                                        (if $is_var
                                            (if $check
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

; !(replace (, (Inheritance $var0 var1) (Inheritance $var0 var2)))
; !(replace (, (Inheritance $var0 var1) (Inheritance $var1 var2)))
; !(replace (, (Inheritance $var0 $var1) (Inheritance $var0 var2)))
; !(replace (, (Inheritance $var0 $var1) (Inheritance $var3 var2)))
; !(replace (, (Inheritance $var0 $var1) (Inheritance $var0 $var1)))
; !(replace (Inheritance $var0 var1))

; !(num2deb (, (Inheritance 0 var1) (Inheritance 0 var2)))
; !(replacev (, (Inheritance Z var1) (Inheritance Z var2)))
; !(num2deb (, (Inheritance 0 var1) (Inheritance 1 var2)))
; !(replacev (, (Inheritance Z var1) (Inheritance (S Z) var2)))
; !(num2deb (, (Inheritance 0 1) (Inheritance 0 var2)))
; !(replacev (, (Inheritance Z (S Z)) (Inheritance Z var2)))
; !(num2deb (, (Inheritance 0 1) (Inheritance 2 var2)))
; !(replacev (, (Inheritance Z (S Z)) (Inheritance (S (S Z)) var2)))
; !(num2deb (Inheritance 0 var1))
;; no-results ;;

; !(if (== (get-metatype (Inheritance 0 var1)) Expression) exp non)
; !(if (== (get-type (Inheritance 0 var1)) Number) non  exp)
; !(== ((type (Inheritance 0 var1))) ())
; !(type 0)
; !(type (Inheritance 0 var1))
; !(if (not True) False True)
; !(if (and (== (get-type 0) Number) True) works doesn't)
; !(== (fromNum (Inheritance 0 var1)))