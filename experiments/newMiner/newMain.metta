!(import! &self ../frequent-pattern-miner/alt-exp/Updated-frequentMinerHelperFunctions)
; !(import! &self ../utils/common-utils)
!(import! &self utils)
!(import! &self ../utils/index_to_var)
!(import! &self ../utils/surp-utils/blk-abstractness)
!(import! &self ../utils/remove_useless_clauses)
; !(import! &self nolawi)
!(import! newDB ../data/ugly_man_sodadrinker)

;; check function
( = (conjunctChecker $db $conjunct $cnjSpace $ms)
    ; return the conjunct if (not (is-member-custom $conjunct $cnjSpace)) && (main-func $conjunct ()) && (sup-evalCustom $db $conjunct $ms)
    (let $bool1 (== () (collapse (eval (is_member $cnjSpace $conjunct)))) ;(is-member-custom $conjunct $cnjSpace)
        (if $bool1              
            (let $bool2 True ;(main-func $conjunct ())
                (if $bool2
                    (let $bool3 (sup-evalCustom $db $conjunct $ms)
                        (if $bool3
                            (if (== (size-atom (unique-atom (cdr-atom $conjunct))) (size-atom (remove_Abstract_clauses (cdr-atom $conjunct))))
                                $conjunct
                                (trace! (WARN:- $conjunct have abstract clauses in it) ())
                            )
                            (trace! (WARN:- $conjunct doesn't have enough support) ())
                        )
                    )
                    (trace! (WARN:- $conjunct have disjoint groups in it) ())
                )
            )
            (trace! (WARN:- $conjunct is already stored) ())            
        )
    )
)

( = (makeNVars $num $acc)
    (if (== $num 0) 
        $acc
        (makeNVars (- $num 1) (cons-atom $x $acc))
    )
)

( = (abstractPattern $numOfConj $link)
    (if (== $numOfConj 1)
        (let $vars (makeNVars 2 ()) ($vars (, (cons-atom $link $vars))))
        (let*
            (
                ($vars (makeNVars 2 ()))
                (($lesser $Conjuncts) (abstractPattern (- $numOfConj 1) $link))
                ($combo (combine_list $lesser $vars))
                ($joint (union-atom $lesser $combo))
                ($niceCombo (cons-atom $link $combo))
                ($newConjuncts (union-atom $Conjuncts ($niceCombo)))
            )
            ($joint $newConjuncts)
        )
    )
)

( = (mainSpecializerHelper2 $conjunct $var $vals $tail $db $ms $conjDB)
    (if ( == $vals () ) $conjDB
        (let*
            (
                (($val $tailVals) (decons-atom $vals))
                ($newConj (insert $conjunct $var $val))
                ($newSortedConj (customConjunctSorter $newConj))
                ($checked (conjunctChecker $db $newSortedConj $conjDB $ms))
                ($newConjDB
                    (if (== $checked ()) $conjDB
                        (mainSpecializerHelper $checked $tail $db $ms (cons-atom $checked $conjDB)) ;; getting in more...
                    )
                )
            )
            (mainSpecializerHelper2 $conjunct $var $tailVals $tail $db $ms $newConjDB) ;; for the other valuations for the same variable...
        )
    )
)

( = (mainSpecializerHelper $conjunct $structuredVars $db $ms $conjDB)
    (if ( == $structuredVars () ) $conjDB
        (let*
            (
                ((($var $vals) $tail) (decons-atom $structuredVars))
                ; ($dummy1 (println! (starting with conjunct:- $conjunct -- var:- $var -- vals:- $vals) ))
            )
            (mainSpecializerHelper2 $conjunct $var $vals $tail $db $ms $conjDB)
            
        )
    )
)

( = (mainSpecializer $conjunct $db $ms $conjDB)
    (let*
        (
            ($dummy1 (println! (---)))
            ($dummy2 (println! (starting to specialize conjunct:- $conjunct)))
            ($dummy3 (println! (conjDB:- $conjDB)))
            ($vars (unique-atom (getOrderlyVariables $conjunct)))
            ($valuations (collapse (match $db $conjunct $vars)))
            ($structuredVars (structureValues $vars $valuations))
            ; ($dummy4 (println! (structured vars :- $structuredVars)))
            ($dummy5 (println! (---)))
        )
        (mainSpecializerHelper $conjunct $structuredVars $db $ms $conjDB)
    )
)

( = (mainMiner $db $ms $numOfConj)
    (let*
        (
            ($cnjSpace conjDB)
            ($conjuncts (collapse (let ($dummy $abstractConj) (abstractPattern $numOfConj Inheritance) (if (sup-evalCustom $db $abstractConj $ms) $abstractConj (empty) ))))
            ($dummy (println! (conjuncts to specialize:- $conjuncts)))
        )
        (foldl-atom $conjuncts () $acc $conjunct (mainSpecializer $conjunct $db $ms $acc))
    )
)


!(--------------------- main miner with specialization step ---------------)
!(let $x (mainMiner newDB 5 2) (trace! (conjs size :- (size-atom $x) ) (superpose $x)))
!(-------------------------------------------------------------------------)
