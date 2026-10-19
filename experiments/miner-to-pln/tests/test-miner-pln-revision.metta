;; Demonstrate PLN Truth_Revision over the same mined rule from two
;; subject-disjoint batches. Batch B is made from the existing norm-isupr
;; dataset after removing the six subject names it shares with batch A.

!(import! &self (library lib_import))
!(git-import! "https://github.com/trueagi-io/PLN.git")
!(import! &self ../../../lib_pattern_miner)
!(import! &self ../miner-pln-bridge)

(= (revision-shared-subject $subject)
   (or (== $subject Abe)
       (or (== $subject Allen)
           (or (== $subject Cason)
               (or (== $subject Emily)
                   (or (== $subject Lily)
                       (== $subject Lucy)))))))

!(println! "=== Cross-run miner-to-PLN evidence revision ===")

;; Batch A is the existing 60-fact dataset.
!(bind! &batch-a (new-space))
!(import! &batch-a ../../data/ugly_man_sodaDrinker)

;; Batch B starts from a second dataset. Remove subjects also present in A,
;; because PLN's current StampDisjoint checks stamp tokens, not row overlap.
!(bind! &batch-b-source (new-space))
!(import! &batch-b-source ../../data/norm-isupr-valid/ugly_soda-drinker)
!(bind! &batch-b (new-space))
!(collapse
    (match &batch-b-source
        (Inheritance $subject $property)
        (if (revision-shared-subject $subject)
            True
            (add-atom &batch-b (Inheritance $subject $property)))))

;; Sanity-check the split: six shared subjects (12 facts) were removed.
!(assertEqual (miner-db-size &batch-a) 60)
!(assertEqual (miner-db-size &batch-b-source) 40)
!(assertEqual (miner-db-size &batch-b) 28)

;; Mine both batches independently and convert each run with a distinct stamp.
!(bind! &mined-a (new-space))
!(bind! &mined-b (new-space))
!(PatternMiner.Mine &mined-a &batch-a 5 0)
!(PatternMiner.Mine &mined-b &batch-b 5 0)

!(bind! &beliefs-a (new-space))
!(bind! &beliefs-b (new-space))
!(miner-results-to-pln-beliefs
    (collapse (match &mined-a $record $record))
    &batch-a RevisionBatchA &beliefs-a)
!(miner-results-to-pln-beliefs
    (collapse (match &mined-b $record $record))
    &batch-b RevisionBatchB &beliefs-b)

;; Expected rule evidence:
;;   A: 5 joint matches / 10 ugly subjects => strength .5, confidence 10/11
;;   B: 7 joint matches / 14 ugly subjects => strength .5, confidence 14/15
!(assertEqual
    (match &beliefs-a
        (Sentence
            ((Implication (Inheritance $x ugly)
                          (Inheritance $x sodaDrinker)) $tv)
            ((MinerPatternRuleEvidence RevisionBatchA
                (Inheritance $x ugly)
                (Inheritance $x sodaDrinker)
                5 10)))
        Found)
    Found)
!(assertEqual
    (match &beliefs-b
        (Sentence
            ((Implication (Inheritance $x ugly)
                          (Inheritance $x sodaDrinker)) $tv)
            ((MinerPatternRuleEvidence RevisionBatchB
                (Inheritance $x ugly)
                (Inheritance $x sodaDrinker)
                7 14)))
        Found)
    Found)

;; Make B's rule the task and A's rule the belief. PLN.Derive's revision rule
;; combines them because their evidence stamps are disjoint.
!(let*
    (
        ($task-rules
            (collapse
                (match &beliefs-b
                    (Sentence
                        ((Implication (Inheritance $x ugly)
                                      (Inheritance $x sodaDrinker)) $tv)
                        $stamp)
                    (Sentence
                        ((Implication (Inheritance $x ugly)
                                      (Inheritance $x sodaDrinker)) $tv)
                        $stamp))))
        ($belief-rules
            (collapse
                (match &beliefs-a
                    (Sentence
                        ((Implication (Inheritance $x ugly)
                                      (Inheritance $x sodaDrinker)) $tv)
                        $stamp)
                    (Sentence
                        ((Implication (Inheritance $x ugly)
                                      (Inheritance $x sodaDrinker)) $tv)
                        $stamp))))
        ($nonempty-tasks
            (assertEqual (if (== $task-rules ()) Fail Found) Found))
        ($nonempty-beliefs
            (assertEqual (if (== $belief-rules ()) Fail Found) Found))
        ($tasks (cons-atom (car-atom $task-rules) ()))
        ($beliefs (cons-atom (car-atom $belief-rules) ()))
        (($remaining-tasks $derived-beliefs)
            (PLN.Derive $tasks $beliefs 10))
        ;; Search for the merged rule with specific expected values:
        ;; - Strength ≈ 0.5: Both batch A (5/10) and batch B (7/14) had strength 0.5
        ;; - Confidence ≈ 0.96: Combined confidence from both batches (24/25)
        ;; - Stamp contains BOTH batch A and batch B evidence (proves revision)
        ($merged-rules
            (collapse
                (let
                    (Sentence
                        ((Implication (Inheritance $x ugly)
                                      (Inheritance $x sodaDrinker))
                         (stv $strength $confidence))
                        $stamp)
                    (superpose $derived-beliefs)
                    (if
                        (and (and (> $strength 0.499999) (< $strength 0.500001))
                             (and (and (> $confidence 0.959999) (< $confidence 0.960001))
                                  (and
                                      (is-member
                                          (MinerPatternRuleEvidence RevisionBatchA
                                              (Inheritance $x ugly)
                                              (Inheritance $x sodaDrinker)
                                              5 10)
                                          $stamp)
                                      (is-member
                                          (MinerPatternRuleEvidence RevisionBatchB
                                              (Inheritance $x ugly)
                                              (Inheritance $x sodaDrinker)
                                              7 14)
                                          $stamp))))
                        (Sentence
                            ((Implication (Inheritance $x ugly)
                                          (Inheritance $x sodaDrinker))
                             (stv $strength $confidence))
                            $stamp)
                        (empty)))))
        ($revision-check
            (assertEqual (if (== $merged-rules ()) Fail Found) Found))
    )
    (println! ("Revised rule (strength 0.5, confidence 0.96):"
               $merged-rules)))

!(println! "PASS: PLN revised the same mined rule across disjoint batches")
