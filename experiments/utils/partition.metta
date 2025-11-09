(=(all-in $lst $used)
(let $inter (intersection-atom $lst $used) (if (== (size-atom $inter) (size-atom $lst)) True False))

)




(= (powerset $lst)
   (if (== $lst ())
       (())                             
       (let* (
          (($head $tail) (decons-atom $lst))
          ($ps-tail   (powerset $tail)) 
          ($with-head (map-atom $ps-tail $s (cons-atom $head $s)))
         )
         (union-atom $ps-tail $with-head) 
       )
   )
)


(=(any-in $lst $used)(let $inter (intersection-atom $lst $used) (if (== (size-atom $inter) 0) False True)))



(= (valid-subset $subset $original)
   (and (not (== $subset ()))
        (not (== $subset $original))))  



(= (partitions-collect $subsets $original $current $used)
   (if (== $subsets ())
       ()
       (let ($subset $rest) (decons-atom $subsets)   
         (if (and (valid-subset $subset $original)
                  (not (any-in $subset $used)))     
             (let* (
                    ($first (partitions-helper $subsets $original (cons-atom $subset $current) (union-atom $used $subset)))
                      ($second (partitions-collect $rest $original $current $used)))
                        (union-atom $first $second))
             (partitions-collect $rest $original $current $used)))))

 ; Recursive helper
(= (partitions-helper $subsets $original $current $used)
   (if (all-in $original $used)
       ($current)
       (partitions-collect (cdr-atom $subsets) $original $current $used))
       )


; Main: Generate all partitions
(= (partitions $subsets $original)
   (partitions-collect $subsets $original () ()))






(=(partitions $original) (let $f  (powerset $original) (partitions $f $original)))


!(partitions ((Inheritance $x man) (Inheritance $x sodaDrinker) (Inheritance $x ugly)))