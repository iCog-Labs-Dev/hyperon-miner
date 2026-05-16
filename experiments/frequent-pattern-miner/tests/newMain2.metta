; !(import! &self ../frequent-pattern-miner/alt-exp/Updated-frequentMinerHelperFunctions)

(= (_is-var-in-list $var $list) (if (== $list ()) False (let $head (car-atom $list) (if (== $var $head) True (_is-var-in-list $var (cdr-atom $list))))))
(= (_vars-exist $list1 $list2) (if (== $list1 ()) False (let $head (car-atom $list1) (if (_is-var-in-list $head $list2) True (_vars-exist (cdr-atom $list1) $list2)))))
(= (_combiner-pat1-pat2 $vars () $accum) $accum)
(= (_combiner-pat1-pat2 $vars $pat2 $accum)
    (let ($head $tail) (eval (decons-atom $pat2))
        (superpose (
            (_combiner-pat1-pat2 $vars $tail (union-atom $accum ($head)))
            (let $var (superpose $vars) (if (== $var $head) (empty) (_combiner-pat1-pat2 $vars $tail (union-atom $accum ($var))))) ;; Option 2: replace with each var but avoid redundancy that might come
                    )
        )
    )
)
(= (_combine_list $vars1 $vars2)   
    (let* (  
        ($combinations (eval (_combiner-pat1-pat2 $vars1 $vars2 ())))  
        ($boolGot (_vars-exist $combinations $vars1))  
        ($vars1-check (if $boolGot $combinations (empty)))  
    ) $combinations  
    )  
)
(= (_getOrderlyVariablesHelper $curr $store)
  (if (is-expr $curr)
      (let $currAnswer (_getOrderlyVariables $curr) (union-atom $store $currAnswer))
      (if (is-var $curr) (union-atom $store ($curr)) $store)
    )
) 

(= (_getOrderlyVariables $pattern) 
(if (is-var $pattern) 
    ($pattern)
  (foldl-atom $pattern () $store $curr (_getOrderlyVariablesHelper $curr $store))
))


(= (_varInserter $variables $patterns $acc)
    (if (== $patterns ())
        ($variables $acc)
        (let ($top $tail) (decons-atom $patterns)
            (if (is-expr $top) 
                (let ($leftVars $newAcc) (_varInserter $variables $top ()) (_varInserter $leftVars $tail (union-atom $acc ($newAcc)))) 
                (if (is-var $top)
                    (let ($topVar $tailVars) (decons-atom $variables)
                        (_varInserter $tailVars $tail (union-atom $acc ($topVar)))
                    )
                    (_varInserter $variables $tail (union-atom $acc ($top)))
                )
            )
        )
    )
)

;test var inserter function
; !(_varInserter ($x $y) (, (Inheritance $x y) (Instance x sodaDrinker) (just e $t)) ())
; !(_varInserter ($x $x) (, (Inheritance $x y) (Instance x sodaDrinker) (just e $t)) ())

(= (_abstractPattern $combination $pattern )
    (if (== $pattern ())
        $combination
        (let*
            (
                (($top $rest) (decons-atom $pattern))
                ($vars (_getOrderlyVariables $top))
                ($combo (_combine_list $combination $vars))
            )
            (_abstractPattern (union-atom $combination $combo) $rest)
        )
    )
)

(= (_nicePatterns $pattern)
    (let*
        (
            ($d (println! (original pattern:- $pattern)))
            (($comma $acpat) (decons-atom $pattern))
            ($d (println! (pattern:- $acpat)))
            (($top $rest) (decons-atom $acpat))
            ($d (println! (top:- $top)))
            ($vars (_getOrderlyVariables $top))
            ($d (println! (vars:- $vars)))
            ($combos (_abstractPattern $vars $rest))
            ; ($d (println! (combos:- $combos)))
            (($dummy $pat) (_varInserter $combos $pattern ()))
            ($d (println! (final pat:- $pat  original pattern:- $pattern)))
        )
         $pat
    )
)

; !(_nicePatterns (, (Inheritance $x $y) (Instance $xx sodaDrinker) $e))
