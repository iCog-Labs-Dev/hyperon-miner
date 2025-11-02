
;;Checks if **all elements** of $lst are in $used
(=(all-in $lst $used)
(let $inter (intersection-atom $lst $used) (eval (if (== (size-atom $inter) (size-atom $lst)) True False)))

)

; Generates all subsets (the powerset) of a given list
;; Example:  (powerset (a b)) → (() (b) (a) (a b))

(= (powerset $lst)
   (if (== $lst ())
       (())                              ; only subset of empty list
       (let* (
          (true (println! "====Here===="))
          (($head $tail) (decons-atom $lst))
          ($ps-tail   (powerset $tail)) ; subsets of tail
          ;($with-head (map-atom $ps-tail $s (cons-atom $head $s))) ; prepend head to each
          ($with-head (cons-atom $head (superpose ($ps-tail))))
         )
         (union-atom $ps-tail $with-head) ; union of both halves
       )
   )
)

(=(any-in $lst $used)(let $inter (intersection-atom $lst $used) (eval (if (== (size-atom $inter) 0) False True))))


(= (valid-subset $subset $original)
   (and (not (== $subset ()))
        (not (== $subset $original))))  


(= (partitions-helper $subsets $original $current $used)
   (if (all-in $original $used)
       ($current)
       (partitions-collect (cdr-atom $subsets) $original $current $used))    
       )

; Collect partitions by trying each valid subset
(= (partitions-collect $subsets $original $current $used)
   (if (== $subsets ())
       ()
       (let ($subset $rest) (decons-atom $subsets)   
        (eval (if (and (valid-subset $subset $original)
                  (not (any-in $subset $used)))     ;; ((a b) ( c))
              (let* (
                 (true (println! (here 2)))
                    ($first (partitions-helper $subsets $original (cons-atom $subset $current) (union-atom $used $subset)))
                      ($second (partitions-collect $rest $original $current $used)))
                        (union-atom $first $second))
             (partitions-collect $rest $original $current $used))))))



; Main: Generate all partitions
(= (partitions $subsets $original)
   (partitions-collect $subsets $original () ()))

(=(partitions $original) (partitions (powerset $original) $original))