; ! (register-module! ../../../hyperon-miner)
; ; ! (import! &db hyperon-miner:experiments:data:sample-data)
; ; ! (import! &db hyperon-miner:experiments:data:ugly_man_sodaDrinker)
; ! (import! &db hyperon-miner:experiments:data/small-ugly)
; ! (import! &self hyperon-miner:metta-log:frequent-pattern-miner/build-specialization)
; ! (import! &self hyperon-miner:metta-log:frequent-pattern-miner/candidate-patterns)
; ! (import! &self hyperon-miner:metta-log:frequent-pattern-miner/conjunction-expansion)
; ! (import! &self hyperon-miner:experiments:utils/variable-combinations)
; ! (import! &self hyperon-miner:metta-log:frequent-pattern-miner/index_To_ver_log)
; ! (import! &self hyperon-miner:experiments:utils/common-utils)
; ; ! (import! &self hyperon-miner:experiments:utils:variable-combinations)
; ; ! (import! &self build-specialization)
; ; ! (import! &self candidate-patterns)
; ; ! (import! &self conjunction-expansion)

; ! (bind! &kb (new-space))
; ! (bind! &dbspace (new-space))
; ! (bind! &testspace (new-space))
; ! (bind! &specspace (new-space))
; ! (bind! &cndpspace (new-space))
; ! (bind! &aptrnspace (new-space))
; ! (bind! &conjspace (new-space))
; ; ! (import! &self freq-pat)
; ; ; ! (import! &self conj-exp)

; !(let ($link $x $y) (get-atoms &db) (add-atom &dbspace ($link $x $y)))


---------------------------------------------
;; abstract-pattern
---------------------------------------------
;; Gets Abstract Patterns with Minimum Support so that we can use them for the specialization.
;; 1: Query the database to retrieve all link nodes (nodes that connect other nodes)
;; 2: Take only the unique links from the queried links
;; 3: Create an Abstract pattern using the links and variables
;; 4: Calculate the support for the Abstract patterns and store the ones satisfy the minimum support in a space
;(: abstract-pattern (-> space Number space Atoms))

(= (abstract-pattern $dbspace $minsup $aptrnspace $cndpspace)
            (let* (
                    ($linkunique (unique (match $dbspace ($link $x $y) $link)))
                    ($result (sup-num $dbspace ($linkunique $z $t)))
                    ; ($add1 (if (>= $result $minsup) (remove-atom $aptrnspace (AbstractPattern ($linkunique Z (S Z)))) ()))
                    ($rem1 (if (=> $result $minsup) (add-atom $aptrnspace (AbstractPattern ($linkunique Z (S Z)))) ()))
                    ; ($add2 (if (>= $result $minsup) (remove-atom $cndpspace (CandidatePattern ($linkunique Z (S Z)) $result)) ()))
                    ; ($rem2 (if (>= $result $minsup) (add-atom $cndpspace (CandidatePattern ($linkunique Z (S Z)) $result)) ()))
                )
               ($add1 $rem1 $add2 $rem2)
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
;(: frequency-pattern-miner (-> space space space space space Number Number Atoms))
(= (frequency-pattern-miner $dbspace $specspace $cndpspace $aptrnspace $conjspace $minsup $depth $cnj_exp)
   (let* (
           (() (println! "==== Frequent miner started ====="))
           ($abs (collapse (abstract-pattern $dbspace $minsup $aptrnspace $cndpspace))) ; prevent patterns that dont have a support from being speciallized
           ($var  (collapse (match $aptrnspace (AbstractPattern $pattern) (build-specialization $pattern $dbspace $specspace)))) ; specializa abstract patterns
           ($temp2  (collapse (candidatePattern $dbspace $specspace $minsup $cndpspace))); get candidate patterns
            ($temp3  (if $cnj_exp (collapse (conjunct $dbspace $cndpspace $conjspace $minsup $depth)) $temp2)) ; store candidate patterns
            ($temp4  (if $cnj_exp (formatter $conjspace $dbspace) (match $cndpspace (CandidatePattern $pattern $cnt) (supportOf $pattern $cnt))))      
        )  
        $temp4
        )
)



; !(frequency-pattern-miner &dbspace &specspace &cndpspace &aptrnspace &conjspace 3 0 True)
; !(match &conjspace $pattern $pattern)