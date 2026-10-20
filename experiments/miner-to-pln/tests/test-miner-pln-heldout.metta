;; Held-out prediction test: mine a rule without Alaura, then use PLN to infer
;; a conclusion from an observation automatically extracted from her held-out facts.
;;
;; The target fact (Alaura human) remains in &heldout-db for final checking only.
;; It is never added to the PLN tasks or rules passed to PLN.Derive / PLN.Query.

!(import! &self (library lib_import))
!(git-import! "https://github.com/trueagi-io/PLN.git")
!(import! &self ../../../lib_pattern_miner)
!(import! &self ../miner-pln-bridge)

!(println! "=== Held-out miner-to-PLN prediction test ===")

;; Load all 60 facts, then place every Alaura fact in the held-out partition.
!(bind! &source-db (new-space))
!(import! &source-db ../../data/ugly_man_sodaDrinker)
!(assertEqual (miner-db-size &source-db) 60)

!(bind! &mining-db (new-space))
!(bind! &heldout-db (new-space))
!(collapse
    (match &source-db
        (Inheritance $subject $property)
        (if (== $subject Alaura)
            (add-atom &heldout-db (Inheritance $subject $property))
            (add-atom &mining-db (Inheritance $subject $property)))))

;; Alaura contributes three facts: human, woman, and ugly.
!(assertEqual (miner-db-size &mining-db) 57)
!(assertEqual (miner-db-size &heldout-db) 3)
!(assertEqual
    (let $matches
        (collapse (match &mining-db (Inheritance Alaura $property) Found))
        (if (== $matches ()) Found Fail))
    Found)

;; Mine patterns only from the mining partition. The remaining nine ugly
;; subjects are human, so ugly -> human is still frequent at minsup 5.
!(println! "=== Mine the mining partition (Alaura excluded) ===")
!(bind! &mined (new-space))
!(PatternMiner.Mine &mined &mining-db 5 0)
!(println! ("Mining support records:" (collapse (match &mined $x $x))))

;; Convert only the mining output. The generated rule carries mining
;; evidence and cannot contain any ground fact about Alaura.
!(bind! &mined-beliefs (new-space))
!(miner-results-to-pln-beliefs
    (collapse (match &mined $x $x))
    &mining-db UglyManMining &mined-beliefs)

;; Verify the bridge generated the rule from mining support:
;; ugly->human has joint support 9 and antecedent support 9.
!(assertEqual
    (let $matches
        (collapse
            (match &mined-beliefs
                (Sentence
                    ((Implication (Inheritance $p ugly)
                                  (Inheritance $p human))
                     $tv)
                    ((MinerPatternRuleEvidence UglyManMining
                                               (Inheritance $p ugly)
                                               (Inheritance $p human)
                                               9 9)))
                Found))
        (if (== $matches ()) Fail Found))
    Found)
!(println! "Mined rule confirmed: ugly -> human (support 9/9)")

;; Extract Alaura's ugly fact from the held-out database and package it as a
;; PLN task. This replaces manually adding a premise to the belief space.
!(let*
    (
        ($premise-facts
            (collapse
                (match &heldout-db
                    (Inheritance Alaura ugly)
                    (Inheritance Alaura ugly))))
        ($premise-fact (car-atom $premise-facts))
        ($tasks
            (cons-atom
                (Sentence
                    ($premise-fact (stv 1.0 1.0))
                    ((HeldoutObservation UglyManHoldout $premise-fact)))
                ()))
        ($rule-matches
            (collapse
                (match &mined-beliefs
                    (Sentence
                        ((Implication (Inheritance $p ugly)
                                      (Inheritance $p human))
                         $tv)
                        $evidence)
                    (Sentence
                        ((Implication (Inheritance $p ugly)
                                      (Inheritance $p human))
                         $tv)
                        $evidence))))
        ($rules (cons-atom (car-atom $rule-matches) ()))
        (($tasks-ret $beliefs-ret) (PLN.Derive $tasks $rules 10))
        ($derived-match
            (collapse
                (let (Sentence ($term $tv) $evidence)
                     (superpose $beliefs-ret)
                     (if (== $term (Inheritance Alaura human)) Found (empty)))))
        ($query-answer
            (PLN.Query $tasks $rules (Inheritance Alaura human) 10 10 10))
        ($derived-check
            (assertEqual (if (== $derived-match ()) Fail Found) Found))
        ($query-check
            (assertEqual (if (== $query-answer ()) Fail Found) Found))
    )
    True)

;; Only now inspect the held-out target to score the prediction. This atom was
;; not passed to the miner, the bridge, PLN.Derive, or PLN.Query.
!(assertEqual
    (let $matches
        (collapse
            (match &heldout-db (Inheritance Alaura human) Found))
        (if (== $matches ()) Fail Found))
    Found)

!(println! "PASS: PLN derived the held-out Alaura human conclusion")
