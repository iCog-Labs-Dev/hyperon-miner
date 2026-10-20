;; Load PLN from the MeTTa library registry; entry points should run
;; `git-import!` for PLN before importing this bridge.
!(import! &self (library PLN lib_pln))


;; Dataset-size helpers

(= (miner-db-size $db)
   (length (collapse (match $db $x $x))))


;; Truth-value primitives


(= (miner-support-to-strength $pattern $support $db)
   ;; Use support / total database atom count. Empty databases yield 0.0.
   (let $denominator (miner-db-size $db)
       (if (> $denominator 0)
           (/safe $support $denominator)
           0.0)))

(= (miner-pattern-confidence-k) 1.0)

(= (miner-support-to-confidence $support)
   (/ $support (+ $support (miner-pattern-confidence-k))))

(= (mined-pattern-to-pln-sentence $pattern $support $db $dataset-id)
   (let*
       (
           ($strength (miner-support-to-strength $pattern $support $db))
           ($confidence (miner-support-to-confidence $support))
           ($stamp
               (cons-atom
                   (MinerPatternEvidence $dataset-id $pattern $support)
                   ()))
       )
       (Sentence ($pattern (stv $strength $confidence)) $stamp)))


;; Conditional implication rules (binary conjunctions)
;; Convert an ordered side of a mined binary conjunction to a rule. Strength
;; estimates P(consequent | antecedent); confidence reflects antecedent support.
(= (store-mined-conditional-rule $antecedent $consequent $joint-support
                                 $db $dataset-id $belief-space)
   (let*
       (
           ($antecedent-support (sup-num $db $antecedent))
           ($valid (and (> $antecedent-support 0)
                        (<= $joint-support $antecedent-support)))
           ($strength (/safe $joint-support $antecedent-support))
           ($confidence (miner-support-to-confidence $antecedent-support))
           ($evidence
               (cons-atom
                   (MinerPatternRuleEvidence $dataset-id $antecedent
                                             $consequent $joint-support
                                             $antecedent-support)
                   ()))
           ($rule
               (Sentence ((Implication $antecedent $consequent)
                          (stv $strength $confidence))
                         $evidence))
       )
       (if $valid (add-atom $belief-space $rule) True)))

(= (store-mined-binary-rule (, $first $second)
                            $joint-support $db $dataset-id $belief-space)
   (let*
       (
           ($forward
               (store-mined-conditional-rule
                   $first $second $joint-support $db $dataset-id $belief-space))
           ($reverse
               (store-mined-conditional-rule
                   $second $first $joint-support $db $dataset-id $belief-space))
       )
       True))

(= (store-mined-binary-rule $pattern $support $db $dataset-id $belief-space)
   True)


;; Convert each supportOf atom in the collapsed result list.
(= (store-mined-pattern-results $results $db $dataset-id $belief-space)
   (if (== $results ())
       ()
       (let*
           (
               ($result (car-atom $results))
               ($tail (cdr-atom $results))
               ((supportOf $pattern $support) $result)
               ($sentence
                   (mined-pattern-to-pln-sentence
                       $pattern $support $db $dataset-id))
               ($add
                   (add-atom $belief-space $sentence))
               ($add-rule
                   (store-mined-binary-rule
                       $pattern $support $db $dataset-id $belief-space))
               ($rest
                   (store-mined-pattern-results
                       $tail $db $dataset-id $belief-space))
           )
           $rest)))

(= (miner-results-to-pln-beliefs $results $db $dataset-id $belief-space)
   (store-mined-pattern-results
       $results $db $dataset-id $belief-space))


;; ---------------------------------------------------------------
;; PLN.Query wrapper
;; ---------------------------------------------------------------
;; Converts a belief space to a list and runs PLN's agenda-based reasoner
;; for a bounded query and returns the best-supported matching answer.

(= (pln-query-from-beliefs $belief-space $query-atom $max-steps)
   (let $beliefs (collapse (match $belief-space $s $s))
       (PLN.Query $beliefs $query-atom $max-steps)))

(= (pln-query-from-beliefs $belief-space $query-atom)
   (pln-query-from-beliefs $belief-space $query-atom (PLN.Config.MaxSteps)))
