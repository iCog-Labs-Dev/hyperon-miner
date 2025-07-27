(= (find () $var) False)
(= (find $pattern $var)(
    if (== (car-atom $pattern) $var)
        True
       (find (cdr-atom $pattern) $var)
))

(= (to_unique $pattern) (to_unique $pattern ()))
(= (to_unique $pattern $acc)
    (if (== $pattern ())
        $acc 
        (let* (
                ($head (car-atom $pattern)) 
                ($tail (cdr-atom $pattern))) 
            (if (== (get-metatype $head) Expression)
                (to_unique $head (to_unique $tail $acc))
                (if (find $acc $head) 
                    (to_unique $tail $acc)
                    (to_unique $tail (union-atom $acc ($head))) 
                )
))))

(= (set_score $pattern) (set_score $pattern 1))
(= (set_score $pattern $count)(
    let* (
        (($head $tail) (decons-atom $pattern))
        ($scored ($head $count))
        ($remaining (if (== $tail ()) () (set_score $tail (+ $count 1))))
    ) (
        cons-atom $scored $remaining
    )
))

(= (find_score $scores $key) (
    if (== $scores ()) Nil (
    let (($var $val) $t)
        ((car-atom $scores) (cdr-atom $scores))
        ( if (== $var $key) $val (find_score $t $key))
)))

(= (calc_score $scores $exp)(
    if (== $exp ()) 0 (
        let* (
            (($h $t) (decons-atom $exp))
            ($sc (
                if (== (get-metatype $h) Expression)
                   (calc_score $scores $h)
                   (find_score $scores $h)
            ))
        ) (+  (if (== $sc Nil) 0 $sc) (calc_score $scores $t))
    )
))


(= (pop $pattern) (pop () $pattern))
(= (pop $head $tail)(
   if (== $tail ()) (() ())
      ( let ($h $t) (decons-atom $tail)
            ( if (== $t ())
                 ($head ($h))
                 (pop (union-atom $head ($h)) $t)))))


(= (sort_pass $scores $pattern)(
    if (== $pattern ()) ()
    (
        let* (
            (($h $t) (decons-atom $pattern))
            (($h2 $t2) (if (== $t ()) (Nil ()) (decons-atom $t)))
            (($sh $st) (
                (calc_score $scores ($h))
                (calc_score $scores ($h2)))))
            (if (== $st 0) ($h)
                (if (> $sh $st)
                    (let $tmp (sort_pass $scores (cons-atom $h $t2)) (cons-atom $h2 $tmp))
                    (let $tmp (sort_pass $scores $t) (cons-atom $h $tmp)))))))

(= (sort $pattern)(
    let* (
        ($elements (to_unique $pattern))
        ($el_scores (set_score $elements))
    )(sort $el_scores $pattern)))

(= (sort $scores $pattern)(
    if (== $pattern ())()(
        let* (
            ($passed (sort_pass $scores $pattern))
            (($rest $last) (pop $passed))
            ($rem (sort $scores $rest))
        )(union-atom $rem $last ))))


; !(sort (
;     (Inheritance a b $e $d)
;     (Inheritance c d $c $d))
; )
