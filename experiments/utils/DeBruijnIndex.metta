 ;; Declaration of List data type and constructors
(: List (-> $a Type))
(: Nil (List $a))
(: Cons (-> $a (List $a) (List $a)))

;; Define DeBruijn Index
(: DeBruijn Type)
;(: VarIdx (-> Nat DeBruijn))

;; Map a DeBruijn Index to an given variable
(: idx2var (-> DeBruijn (List Variable) Atom))
(= (idx2var z (Cons $head $tail)) $head)
(= (idx2var (s $k) (Cons $head $tail)) (idx2var $k $tail))

;; Map a DeBruijn Index in a given pattern to a variable
(: Debruijn2var (-> Atom (List Variable) Atom))
(= (Debruijn2var (s $k) $varlist) 
    (idx2var (s $k) $varlist))

(= (Debruijn2var z $varlist) 
    (idx2var z $varlist))

(= (Debruijn2var $symbol $varlist)
    (if (and (== (get-metatype $symbol) Symbol) (not (== $symbol z))) $symbol (empty)))

(= (Debruijn2var ($link $first $second) $varlist)
    ($link (Debruijn2var $first $varlist) (Debruijn2var $second $varlist)))

; For conjunctions
(= (Deb2var $ptrn $varlist)
    (case $ptrn (
      ((, $p1 $p2) (, (Debruijn2var $p1 $varlist) (Debruijn2var $p2 $varlist)))
      ((, $p1 $p2 $p3) (, (Debruijn2var $p1 $varlist) (Debruijn2var $p2 $varlist) (Debruijn2var $p3 $varlist)))
      ($_ (Debruijn2var $ptrn $varlist)))))
