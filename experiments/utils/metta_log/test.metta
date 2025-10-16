!(import! &self ./common-util)
!(import! &self ./index_to_var)
!(import! &self ./blk-abstractness)
!(import! &self ./partition-metta)
!(import! &self ./eq-prob)
!(import! &kb ../../data/ugly_man_sodaDrinker)






; !(is-blk-more-abstract ((Inheritance $x $y)) ((Inheritance $x Man)) $x)
; !(is-var-exist ((Inheritance $x Man)) $x) ; True
; !(is-var-exist ((Inheritance $x $y)) $x) ; True

; !(is-blk-syntax-more-abstract ((Inheritance $x $y)) ((Inheritance $x man)) $x) 

; !(erase ((Inheritance $x $y)) $x) ; ((Inheritance @eyob y))

; !(replace ((Inheritance $x $y)) $x @eyob)

; !(validate-unification ((Inheritance @eyob $y)) ((Inheritance @eyob $y)) )
; !(let $result (replace ((Inheritance $x $y)))  (can-unify $result ((Inheritance @eyob $x))))

; !(powerset (a b c))
; !(powerset-without-empity (a b c))

! (eq-prob (((Inheritance $x $y)) ((Inheritance $x man)) ((Inheritance $z human))) ((Inheritance $x $z)) &kb)

; !(joint-variables ((Inheritance $x $z)) (((Inheritance $x $y)) ((Inheritance $x man)) ((Inheritance $z human)))) 
; !(get-var ((Inheritance $x $y)))
; ; !(extract-vars-from-pattern ((Inheritance $x $y)) ())
; !(filter-joint-vars ($x $y) (((Inheritance $x $y)) ((Inheritance $x man)) ((Inheritance $z human))))
; !(is-joint-var $x (((Inheritance $x $y)) ((Inheritance $x man)) ((Inheritance $z human))))
; !(count-blocks-with-var $x (((Inheritance $x $y)) ((Inheritance $x man)) ((Inheritance $z human))) 0)
; ; !(var-exist-exp (Inheritance $x $y) $x)
; ; !(is-var-exist (Inheritance $x $y) $x)


; !(is-membership $x (Inheritance $x y))





; !(calculate-prob-for-vars ($x) (((Inheritance $x $y)) ((Inheritance $x man)) ((Inheritance $z human))) $kb 1.0)
; !(connected-subpatterns-with-var (((Inheritance $x $y)) ((Inheritance $x man)) ((Inheritance $z human))) $x) ;(((Inheritance $x man)) ((Inheritance $x man)))
; !(sort-by-abstraction (((Inheritance $x man)) ((Inheritance $x $y))) $x )
; !(filter-more-abstract (((Inheritance $x $y))) ((Inheritance $x man)) $x)
; !(filter-less-abstract (((Inheritance $x $y))) ((Inheritance $x man)) $x)



; (is-blk-syntax-more-abstract called with l_pat ((Inheritance $x $y)) r_pat ((Inheritance $x ugly)) var $x l_has_var True r_has_var True)
; (is-blk-syntax-more-abstract called with l_pat ((Inheritance $x $y)) r_pat ((Inheritance $x man)) var $x l_has_var False r_has_var False)