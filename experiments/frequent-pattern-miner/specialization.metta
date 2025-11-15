;; substitute_for_tree always returns (newtree remaining-subs)
(= (substitute $pattern $sub)
   (if (== $pattern ())
       (() $sub) ;; base case: empty
       (let* (
               ($head (if (== (get-metatype $pattern) Variable) (car-atom ($pattern)) (car-atom $pattern)))
               ($tail (if (== (get-metatype $pattern) Variable) (cdr-atom ($pattern)) (cdr-atom $pattern)))

               ;; process head
               (($newhead $after-head-subs)
                  (if (== (get-metatype $head) Variable)
                      (if (== $sub ())
                          ($head $sub) ;; no subs left
                          ((car-atom $sub) (cdr-atom $sub)))
                      (if (== (get-metatype $head) Expression)
                          ;; nested list → recurse, passing whole $sub
                          (substitute $head $sub)
                          ;; constant atom
                          ($head $sub))
                  )
               )

               ;; process tail using whatever is left after head
               (($newtail $remaining)
                  (substitute $tail $after-head-subs))
             )
         ((cons-atom $newhead $newtail) $remaining)
       )
   )
)

;; wrapper: only the substituted tree
; (= (substitute $pattern $sub)
;    (car-atom (substitute $pattern $sub)))


(= (specialization $pattern $shallow_abstractions)
    (let* (
        ($spec (substitute $pattern $shallow_abstractions))
        ($res (car-atom $spec))
    )
    $res
    )
)

; !(specialization (Inheritance $x $y) (superpose (((Inheritance (fromNumber 0) (fromNumber 1)) Cason) ((Inheritance (fromNumber 0) (fromNumber 1)) Emily) ((Inheritance (fromNumber 0) (fromNumber 1)) Lucy) (ugly Cason) (ugly Emily) (ugly Lucy) (sodaDrinker Cason) (sodaDrinker Emily) (sodaDrinker Lucy))))