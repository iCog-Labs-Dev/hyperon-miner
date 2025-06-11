(= (all-in $lst $used)
   (if (== $lst ())
       True
       (let* (($head (car-atom $lst))) (if (not (== ((intersection-atom ($head) $used)) (())))
           (all-in (cdr-atom $lst) $used)
           False))))

(= (powerset $lst)
   (if (== $lst ())
       (())                              ; only subset of empty list
       (let* (
           ($head      (car-atom $lst))  ; first element
           ($tail      (cdr-atom $lst))  ; rest of list
           ($ps-tail   (powerset $tail)) ; subsets of tail
           ($with-head (map-atom
                         $ps-tail
                         $s
                         (cons-atom $head $s))) ; prepend head to each
         )
         (union-atom $ps-tail $with-head) ; union of both halves
       )
   )
)


(= (any-in $lst $used)
   (if (== $lst ())
       False
       (let* (($head (car-atom $lst)))(if (not (== ((intersection-atom ($head) $used)) (())))
           True
           (any-in (cdr-atom $lst) $used)))))


;the subset can't be an empty set or the orginal set itself
(= (valid-subset $subset $original)
   (and (not (== $subset ()))
        (not (== $subset $original))))

; Main: Generate all partitions
(= (partitions $subsets $original)
   (partitions-helper $subsets $original () ()))

(=(partitions $original) (partitions (powerset $original) $original))

; Recursive helper
(= (partitions-helper $subsets $original $current $used)
   (if (all-in $original $used)
       ($current)
       (partitions-collect $subsets $original $current $used)))

; Collect partitions by trying each valid subset
(= (partitions-collect $subsets $original $current $used)
   (if (== $subsets ())
       ()
       (let* (
           ($subset (car-atom $subsets))
           ($rest   (cdr-atom $subsets))
        
         )
         (if (and (valid-subset $subset $original)
                  (not (any-in $subset $used)))
             (let* (
           
           ($first (partitions-helper $subsets $original (cons-atom $subset $current) (union-atom $used $subset))
           )
           ($second (partitions-collect $rest $original $current $used))
         )
             (union-atom
               $first
               $second))
             (partitions-collect $rest $original $current $used)))))