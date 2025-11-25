! (import! &self valuation)
! (import! &self shallow-abstractions)
! (import! &self specialization)
! (import! &self candidate)
! (import! &self conjunction-expansion)

! (import! &self freq-pat)
! (import! &self conj-exp)

---------------------------------------------
;; abstract-pattern
---------------------------------------------
;; Gets Abstract Patterns with Minimum Support so that we can use them for the specialization.
;; 1: Query the database to retrieve all link nodes (nodes that connect other nodes)
;; 2: Take only the unique links from the queried links
;; 3: Create an Abstract pattern using the links and variables
;; 4: Calculate the support for the Abstract patterns and store the ones satisfy the minimum support in a space
;(: abstract-pattern (-> space Number space Atoms))




--------------------------------------------------------
;; frequency-pattern-miner
---------------------------------------------------------
;; function to mine the frequent patterns from the atomspace.
;; 1: mine all candidate patterns and store them in a space
;; 2: expand the conjunctions of the candidate patterns and store them in a space with their support
;; 3: format the patterns and add them to the knowledge base with their support
;(: frequency-pattern-miner (-> space Atoms space space Number Number Atoms Boolean))
(= (frequency-pattern-miner $dbspace $initpat $cndpspace $conjspace $minsup $depth $cnj_exp)
   (let*(
           (() (println! "==== Frequent miner started ====="))
           ($temp2  (collapse (candidate-pattern-miner $initpat $dbspace $minsup $cndpspace))); get candidate patterns
            ($temp3  (if $cnj_exp (collapse (conjunct $dbspace $cndpspace $conjspace $minsup $depth)) $temp2)) ; do conjunction expansion if required
            ($temp4  (formatter $conjspace $cndpspace $dbspace $cnj_exp))  ; format the patterns    
        )  
        $temp4
        )
)



