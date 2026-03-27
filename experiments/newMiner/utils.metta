(= (sup-evalCustom $db $pattern $ms)
    (let $pool (collapse (match $db $pattern $pattern)) 
        (>= (size-atom $pool) $ms))
    ; (>= (random-int 200 800) $ms)
)

;; insert
(= (insert $conjunct $var $val)
    (if (== $conjunct ()) () (let*
        (
            (($top $tail) (decons-atom $conjunct))
            ($correctTop (if (is-expr $top) (insert $top $var $val) (if (== $var $top) $val $top)))
        )
        (union-atom ($correctTop) (insert $tail $var $val))

    ))
)
; !(insert (, (link $a $b) (link $a $c)) $a x)


(= (structureValuesHelper $var $valuations $acc) 
    (let*
        (
            (($index $allVals) (decons-atom $acc))
            ($valuesOfVar (unique-atom (collapse (index-atom (superpose $valuations) $index))))
            ; (true (println! (var:- $var -> index:- $index -> valuesOfVar:- $valuesOfVar -> allVals:- $allVals)))
        )
        (cons-atom (+ 1 $index) (cons-atom ($var (cons-atom $var $valuesOfVar)) $allVals))
    )
)

(= (structureValues $vars $valuations)
    (let $x (foldl-atom $vars (0) $acc $var (structureValuesHelper $var $valuations $acc)) (cdr-atom $x))
)

(= (get_variables_for_tree $pattern)
    (if (== $pattern ())
        ()
        (let* (
                ($head (car-atom $pattern))
                ($tail (cdr-atom $pattern))
                ($headvar (if (== (get-metatype $head) Expression)
                                (get_variables_for_tree $head)
                                (if (== (get-metatype $head) Variable)
                                ($head)
                                ())
                                ))
                ($tailvar (get_variables_for_tree $tail))
            )
            (union-atom $headvar $tailvar)
        )
    )
)

(= (does_exist $var $list_vars)
    (if (== $list_vars ())
        False
        (if (== $var (car-atom $list_vars))
            True
            (does_exist $var (cdr-atom $list_vars)))
    )
)

;;; functions for sorting.... ;;;
;; the main issue here is that we can't call built-in sort function since the conjuncts doesn't have common variables and sort function considers the varibales(their id...) 

; approach... after getting every conjunct... remove the variables and sort them based on their symbols , solely.
;; accepts an expression with variables jumbled in it and returns an expression with out the variables
(= (remove_variables $pattern $acc)
    (if (== $pattern ())
        $acc
        (let* (
                (($head $tail) (decons-atom $pattern))
                ($newAcc (if (== (get-metatype $head) Expression)
                                (union-atom $acc ((remove_variables $head ())))
                                (if (== (get-metatype $head) Variable)
                                    $acc
                                    (union-atom $acc ($head))
                                )))
            )
            (remove_variables $tail $newAcc)
        )
    )
)
; !(remove_variables (, (link $a $b) (link hi $r)) ())
; !(remove_variables (, (Inheritance $_102586 $_102592) (Inheritance Lucy $_102592)) ())
(= (removeVarFromConjunctHelper $conjunct $index)
    (if (== $conjunct ())
        ()
        (let*
            (
                (($top $tail) (decons-atom $conjunct))
                ($pureTop ((remove_variables $top ()) $index))
            )
            (cons-atom $pureTop (removeVarFromConjunctHelper $tail (+ $index 1)))
        )
    )
)

; (= (shuffler_ $conjunct $sortedConj)
;     (foldl-atom $sortedConj (, ) $acc ($x $index) (union-atom $acc ((index-atom $conjunct $index))))
; )

;; shuffler with tail recursion
;; input 
    ; conjunct -> (, (link $x b) (link $x a))
    ; sortedConj -> (((link b) 1) ((link a) 0))
;; output:- (, (link $x a) (link $x b))
( = (shuffler $conjunct $sortedConj $acc)
    (if (== $sortedConj ())
        $acc
        (let*
            (
                ((($_ $index) $tail) (decons-atom $sortedConj))
                ($newAcc (union-atom $acc ((index-atom $conjunct $index))))
            )
            (shuffler $conjunct $tail $newAcc)
        )
    )
)
(= (customConjunctSorter $rawConjunct)
    (let*
        (
            ((, $conjunct) (decons-atom $rawConjunct))
            ($pureConj (removeVarFromConjunctHelper $conjunct 0))
            ($sortedConj (sort $pureConj))
            ($correctedConj (shuffler $conjunct $sortedConj (,)))
        )
        $correctedConj
    )
)

