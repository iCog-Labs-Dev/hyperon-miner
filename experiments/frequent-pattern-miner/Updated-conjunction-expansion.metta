! (import! &self frequentMinerHelperFunctions)
! (import! &self conj-exp)
! (import! &self freq-pat)

(= (expand_conjunction $conjunctVariables $conjunct $pattern $db $ms)
    (let*
        (
            ($patVars (getOrderlyVariables $pattern))
            (() (println! (in expand conjunct_ with conjunct_:- $conjunct -> vars:- $conjunctVariables -> pattern:- $pattern patvars:- $patVars )))
            ($combo (combine_list $conjunctVariables $patVars)) ;;to get unDeterministic combinations made via MeTTa
            ; ($combo (superpose (combine_lists $conjunctVariables $patVars)))
            (() (println! (after we called "in expand_conjunction after calling getOrderlyVariables combine_list" combinations:- $combo)))
            ($npat (replace_pattern $conjunct $pattern $combo))
            (() (println! ($conjunct --> $conjunctVariables --> $pattern --> (combo:- $combo) ( npat:- $npat))))
        )
        (checker $db $npat $ms)
    )
)

;;;;;; substitute functions ;;;;;;
( = (substituteHelper $current ($Variables $newPattern) )
    (let 
      $currMetaType (if (== () $Variables) Symbol (get-metatype $current)) ;undermine the metatype of the current if we are run out of variables
      (if (== Expression $currMetaType)
        (let ($gotLeftVars $gotCorrectedExpression) (substituteMain $Variables $current) ($gotLeftVars (union-atom $newPattern ($gotCorrectedExpression))))
        (if (== Variable $currMetaType)
          (let ($headVariable $leftVariables) (decons-atom $Variables) ($leftVariables (union-atom $newPattern ($headVariable))))
          ($Variables (union-atom $newPattern ($current)))
        )
      )
    ) 
)
;; let the substituteMain function return ($LeftVariables (pattern made)) for a given expression (curr)
(= (substituteMain $variables $curr) (foldl-atom $curr ($variables ()) $acc $current (substituteHelper $current $acc) ))
( = (substitute $curr $variables) (let ($_ $answer) (substituteMain $variables $curr) $answer))
; !(substitute (name is $var1) ($yonas))

(= (replace_pattern $conjunct $pattern $pv2cv)
    (let* (
            (() (println! (in replace pattern function with conjunct:- $conjunct -> pattern:- $pattern -> pv2cv:- $pv2cv )))
            ($newPattern (substitute $pattern $pv2cv))
            ($formattedConjunct (cdr-atom $conjunct))
            ($new_conjunct (union-atom $conjunct ($newPattern)))
            (() (println! (return_ from replace pattern function with $new_conjunct)))
        )
        $new_conjunct
    )
)
; !(replace_pattern ((Hi This is $yonas)) (name is $var1) ($yonas))

(= (checker $db $pattern $ms) 
   (let* (
        (() (println! (pattern $pattern)))
        ($supEval (sup-evalCustom $db $pattern $ms))
        (() (println! (in check func)))
        ) 
        (if $supEval $pattern (empty))
    )
)

------------------------------------------------
;; doConjunct
------------------------------------------------
;; function to expand the conjunctions of the patterns and create conjunctions of any amount of clauses

;; parameters:
;; $db: the database that is loaded and cleaned of the stdlib functions.
;; $candidatePatterns: the candidate patterns space
;; $conjunct: the conjunctions part of the pattern
;; $ms: minimum support
;; (S $K)/ Z: a debruijin index to check if we are in the last iteration of the recursion.

;steps:
;; 1: get the matches of the candidate patterns in the database
;; 2: expand the conjunctions with the matches and the database
;; 3: replace the variables with the debruijin index
;; 4: remove any redundant clauses from the conjunctions
;; 5: if we are in the last iteration of the recursion, return the conjunctions else call the function again with the new conjunctions and the debruijin index.

; returns:
; a superpose of conjunctions that satisfy the minimum support and are not redundant.
;(: doConjunct SpaceType SpaceType Pattern Number Nat Atom)
(= (doConjunct $db $candidatePatterns $conjunct $ms Z)
    (let* (
        (() (println! "==== Build conjunction with depth 0 ===="))
        ($conjunctVariables (collapse (variableExtractor $conjunct)))
        (() (println! (in doConj function matches:- $match -> conjunct:- $conjunct -> vars:- $conjunctVariables)))
        ($match (superpose $candidatePatterns))
        (True (== () (collapse (is_member $conjunct $match)))) ;this will stop the thread if match Is not New in the conjuncts
        (() (println! ($match is new in the $conjunct)))
        ($listConjs (collapse (expand_conjunction $conjunctVariables $conjunct $match $db $ms)))
        (() (println! (after expand conjunction listConjs:- $listConjs)))
        ($listConj (superpose $listConjs))
        (() (println! (this conj:- $listConj)))
        (True (sup-evalCustom $db $listConj $ms)) ;; the final conjunct will be filtered here ...
        (() (println! (has passed)))
    )
    $listConj
    )
)

(= (doConjunct $db $candidatePatterns $conjunct $ms (S $K))
    (let* (
        (() (println! "==== Build conjunction with depth greater than 0 ====="))
        ($match (superpose $candidatePatterns))
        (True (== () (collapse (is_member $conjunct $match)))) ;this will stop the thread if match Is not New in the conjuncts (repetition)
        ($conjunctVariables (collapse (variableExtractor $conjunct)))
        ($listConj (expand_conjunction $conjunctVariables $conjunct $match $db $ms))
        (() (println! (this conj:- $listConj)))
        (True (sup-evalCustom $db $listConj $ms)) ;; this will stop any unfinished conjunct that has lower support than the minimum support
        (() (println! (has passed)))
        ($conj (doConjunct $db $candidatePatterns $listConj $ms $K))
    )
    $conj
    )
)


--------------------------------------------
;;  formatter
--------------------------------------------
;; function to format the patterns with thier support annotation.
;; 1: get the matches of the conjunctions in the database
;; 2: sort the conjunctions with a custom sorting function and get only the unique conjunctions from the sorte results
;; 3: create a flattened conjunction  using cons-atom with the sorted conjunctions and ,.
;; 4: add the results to the knowledge base with their support
;(: formatter (-> SpaceType SpaceType Atom ))


(= (formatter $conjspace $dbspace) 
    (let* (
        (() (println! "==== Formating  started ====="))
        ($sorted (unique (match $conjspace $pattern (sort_conj $pattern))))
        ($res (cons-atom , $sorted))
        ($var (replacev $res))
        ($sup (sup-num $dbspace $var))
        ($final (supportOf $var $sup))
    )
        $final
    )
)

-----------------------------------------------
;; conjunct 
-----------------------------------------------
;; function to extract candidate patterns and call doConjunct 
;(: conjunct (-> SpaceType SpaceType SpaceType Number Number Atom))
(= (conjunct $db $candidatePatterns $conjspace $minSup $depth )   
    (let $conj (doConjunct $db $candidatePatterns (, (superpose $candidatePatterns)) $minSup (fromNumber $depth)) (add-atom $conjspace $conj))
)   

