!(import! &self ../frequent-pattern-miner/alt-exp/Updated-frequentMinerHelperFunctions)
!(import! &self ../utils/disjoint_conjunct)
!(import! &self utils)
!(import! &self ../utils/index_to_var)
!(import! &self ../utils/surp-utils/blk-abstractness)
!(import! &self ../utils/remove_useless_clauses)

!(import! &self "C:/Users/tewob/PeTTaProject/PeTTa/lib/lib_import.metta") ;add local path of PeTTa's lib
!(static-import! newDB ../data/ugly_man_sodadrinker)

;; check function
( = (conjunctChecker $db $conjunct $cnjSpace $ms)
    ; return the conjunct if (not (is-member-custom $conjunct $cnjSpace)) && (main-func $conjunct ()) && (sup-evalCustom $db $conjunct $ms)
    (let $bool1 (== () (collapse (eval (is_member $cnjSpace $conjunct)))) ;(is-member-custom $conjunct $cnjSpace)
        (if $bool1              
            (let $bool2 (check-disj $conjunct)
                (if $bool2
                    (let ($newSupport $bool3) (sup-evalCustom2 $db $conjunct $ms)
                        (if $bool3
                            (if (== (size-atom (unique-atom (cdr-atom $conjunct))) (size-atom (remove_Abstract_clauses (cdr-atom $conjunct))))
                                (trace! (conjunct : $conjunct is added) ($newSupport $conjunct))
                                (() ())
                            )
                            
                            (() ())
                        )
                    )
                   
                    (() ())
                )
            )
            
            (() ())       
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

( = (mainSpecializerHelper2 $conjunct $var $vals $tail $ms $conjDB $support)
    (if ( == $vals () ) $conjDB
        (let*
            (
                (($val $tailVals) (decons-atom $vals))
                ($newConj (insert $conjunct $var $val))
                ($newSortedConj (customConjunctSorter $newConj))
               
                (($newSupport $checked) (conjunctChecker $support $newSortedConj $conjDB $ms))
                ($newConjDB
                    (if (== $checked ()) $conjDB
                        (mainSpecializerHelper $checked $tail $ms (cons-atom $checked $conjDB) $newSupport) ;; getting in more...
                    )
                )
            )
            (mainSpecializerHelper2 $conjunct $var $tailVals $tail $ms $newConjDB $support) ;; for the other valuations for the same variable...
        )
    )
)

( = (mainSpecializerHelper $conjunct $structuredVars $ms $conjDB $support)
    (if ( == $structuredVars () ) $conjDB
        (let*
            (
                ((($var $vals) $tail) (decons-atom $structuredVars))
              
            )
            (mainSpecializerHelper2 $conjunct $var $vals $tail $ms $conjDB $support)
            
        )
    )
)

( = (mainSpecializer ($support $conjunct) $db $ms $conjDB)
    (let*
        (
            
            ($vars (unique-atom (getOrderlyVariables $conjunct)))
            ($valuations (collapse (match $db $conjunct $vars)))
            ($structuredVars (structureValues $vars $valuations))
        )
        (mainSpecializerHelper $conjunct $structuredVars $ms $conjDB $support)
    )
)

( = (mainMiner $db $ms $numOfConj)
    (let*
        (
            ($cnjSpace conjDB)
            ($conjuncts
                (collapse 
                    (let*
                        (
                            (($dummy $abstractConj) (abstractPattern $numOfConj inheritance))
                            (($sup $bool) (sup-evalCustom3 $db $abstractConj $ms))                          
                        )
                        (if $bool ($sup $abstractConj) (empty))
                    )
                )
            )
            
        )
        (foldl-atom $conjuncts () $acc $conjunct (mainSpecializer $conjunct $db $ms $acc))
    )
)


!(--------------------- main miner with specialization step ---------------)
!(let $x (mainMiner newDB 5 2) (trace! (conjs size :- (size-atom $x) ) (superpose $x)))
!(-------------------------------------------------------------------------)
