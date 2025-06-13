;; helper functions
(: is-variable (-> Atom Bool))
(= (is-variable $x) (== (get-metatype $x) Variable))

(: lazy-or (-> Bool Atom Bool))
(= (lazy-or False $x) $x)
(= (lazy-or True $x) True)

(: is-expression (-> Atom Bool))
(= (is-expression $x) (== (get-metatype $x) Expression))

(: is-closed (-> Atom Bool))
(= (is-closed $x) (if (is-variable $x)
                      False
                      (if (is-expression $x)
                          (lazy-or (let $head (car-atom $x) (is-closed $head))
                                   (let $tail (cdr-atom $x) (is-closed $tail)))
                          True)))

;; System proof for ⍃
;; if conclusion equals (⍃ $X $Y), then return (: CPU (⍃ $X $Y)) 
;; if $x and $Y are fully grounded and (< $X $Y)
(= (syn $kb $_ (: CPU (⍃ $X $Y))) 
    (if (and (and (is-closed $X) (is-closed $Y)) (< $X $Y))
        (: CPU (⍃ $X $Y))
        (empty)))
;; System proof for isDiff
(= (syn $kb $_ (: CPUDiff (isDiff $X $Y)))
    (if (and (and (is-closed $X) (is-closed $Y)) (== $X $Y))
        (empty)
        (: CPUDiff (isDiff $X $Y))))

;; Proof for prunning
(= (syn $kb $_ (: PRUNEPRF (valid-conj $p1 $p2))) 
    (if (prune? (, $p1 $p2))
        (empty)
        (: PRUNEPRF (valid-conj $p1 $p2))))
