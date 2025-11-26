
; ! (import! &self build-specialization)
; ! (import! &self candidate-patterns)

! (import! &self Updated-conjunction-expansion)
! (import! &self frequentMinerHelperFunctions)
! (import! &self freq-pat)
! (import! &self conj-exp)

---------------------------------------------
;; abstract-pattern
---------------------------------------------
;; Extract link atoms from the database and keep only those that meet the minimum support.
;; 1: Retrieve every fact as a link expression from the database.
;; 2: Remove duplicates with `unique` so each link is considered once.
;; 3: Evaluate the links against the minimum support using `evalLink`.
;; 4: Return the unique link set when it passes the support check; otherwise return `Empty`.
(= (abstractPattern $dbspace $minsup)
    (let* (
            ($uniqueLink (unique (match $dbspace $fullFact (car-atom $fullFact))) )
            ($niceLink (evalLink $dbspace $uniqueLink $minsup))
        )
        (if $niceLink $uniqueLink Empty)
    )
)
        

( = (specialCreator $currDepth (S $debruignIndex) $values $acc) 
    (function
        (chain (eval (car-atom $values)) $topGuy
            (chain (eval (make_var1 varNum $currDepth)) $topGuyInVarForm
                (chain (eval (union-atom $acc ($topGuyInVarForm))) $accWithVar
                    (chain (eval (union-atom $acc ($topGuy))) $accWithOutVar
                        (chain (eval 
                                (if-equal $debruignIndex Z
                                    (superpose ($accWithOutVar $accWithVar))
                                    (chain (eval (cdr-atom $values)) $tailValue 
                                        (chain (eval (+ $currDepth 1)) $nextDepth 
                                            (chain 
                                                (eval (superpose ( 
                                                    (specialCreator $nextDepth $debruignIndex $tailValue $accWithOutVar) 
                                                    (specialCreator $nextDepth $debruignIndex $tailValue $accWithVar)
                                                                )
                                                        )
                                                ) $notFinal $notFinal 
                                            ))) )) $answer (return $answer)))))))
)

(= (buildSpecialization $db $uniqueLink) 
    (collapse 
        (let*
            (  
                (() (println! "==== Build specialization started ====="))
                ($data (match $db $fullFact $fullFact))
                (($uniqueLink $values) (decons-atom $data)) ;this will end the thread if uniqueLink doesn't match
                ($size (size-atom $values))
            )
            (specialCreator 0 (fromNumber $size) $values ($uniqueLink))
        )
    )
)
;;temporary function to filter best candidate patterns from specializations
( = (evalCandidatePatterns $db $dbSize $specialPattern $minSup)
    (let*
        (
            ($pool (collapse (match $db $specialPattern 1))) 
            ($size (size-atom $pool))
            (() (println! (size of candidate patterns ($specialPattern) :- $size )))
        )
        (if (and (>= $size $minSup) (< $size $dbSize)) True False)
    )
)

( = (candidatePatternMaker $db $dbSize $specialPattern $minSup)
    (if (evalCandidatePatterns $db $dbSize $specialPattern $minSup) $specialPattern Empty )
)

( = (absSpeCan $db $dbSize $minSup) 
    ; a function that handles unique specializations + remove duplicates in one link + candidate patterns choosing.
    (let*
        (
            ($uniqueLink (abstractPattern $db $minSup) )
            (() (println! (uniqu_e link are:- $uniqueLink) ))

            ; get all specials since we are using branching we will have no duplicates on different links but we might have duplicates on same link so we use only_uniques function to handle that
            ($xx (buildSpecialization $db $uniqueLink))
            (() (println! (--------- $xx --------)))
            ($specials (only_unique $xx))
            (() (println! (--------- $specials --------)))
            ($candidates (collapse (candidatePatternMaker $db $dbSize (superpose $specials) $minSup))) ; find the candidate patterns
        )
        $candidates
    )
)

--------------------------------------------------------
;; frequency-pattern-miner
---------------------------------------------------------
;; function to mine the frequent patterns from the atomspace.
;; 1: get all abstract patterns with their support and store them in a space
;; 2: specialize the abstract patterns and store them in a space
;; 3: get all candidate patterns from the specialized patterns and store them in a space
;; 4: expand the conjunctions of the candidate patterns and store them in a space with their support
;; 5: format the patterns and add them to the knowledge base with their support

;(: frequency-pattern-miner (-> SpaceType SpaceType SpaceType SpaceType SpaceType Number Number Atoms))
(= (frequency-pattern-miner $db $specspace $cndpspace $aptrnspace $conjSpace $minSup $depth)
   (let*(
        (() (println! "==== Frequent miner started ====="))
        ;    ($abs (collapse (abstract-pattern $db $minSup $aptrnspace))) ; prevent patterns that dont have a support from being speciallized
        ;    ($var  (collapse (match $aptrnspace (AbstractPattern $pattern) (buildSpecialization $pattern $db $specspace)))) ; specializa abstract patterns
        ;    ($temp2  (collapse (candidatePattern $db $specspace $minSup $cndpspace))); get candidate patterns
        ($everyThing (collapse (get-atoms $db)))
        ($dbSize (size-atom $everyThing))
        ($candidatePatterns (absSpeCan $db $dbSize $minSup))
        (() (println! (-------------------absSpeCanEnded-------------------------)))
        (() (println! (candid patterns are $candidatePatterns)))
        (() (println! (--------------------------------------------)))
        ($temp3  (collapse (conjunct $db $candidatePatterns $conjSpace $minSup $depth ))) 
        (() (println! (----------the conjuncts we have got are :- ----------------------------------)))
        (() (println! (collapse (get-atoms $conjSpace))))
        ; ($temp4  (formatter $conjSpace $db))      
        )  Done)
)
