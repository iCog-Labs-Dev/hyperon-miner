# Miner-to-PLN Integration

## Purpose

The pattern miner and PLN have different jobs:

- **The miner** searches the dataset and reports patterns with support counts.
- **The bridge** converts those records into PLN Sentence atoms with truth values and evidence. For binary conjunctions, it also creates conditional Implication rules.
- **PLN** uses premises and rules to derive conclusions or answer a specific query.

A support count is empirical data, not a PLN truth value and not a conclusion. The bridge is the conversion boundary between the two systems.

## Why this integration matters

> Hyperon Miner discovers recurring patterns in data; PLN makes the resulting rules usable as evidence for reasoning. It can apply a mined rule to a new observation to answer a focused question, and `PLN.Derive` can revise the same rule when independent mining runs contribute more evidence. The integration therefore demonstrates two uses beyond listing pattern counts: inference about a held-out case and evidence accumulation across disjoint data batches.


The held-out experiment learns **ugly → human** without Alaura, then asks PLN whether her held-out observation **Alaura is ugly** supports **Alaura is human**. The separate revision experiment mines **ugly → sodaDrinker** from two subject-disjoint batches and checks that PLN combines their evidence into one revised rule. Revision is explicitly invoked in that experiment; the bridge does not do it automatically. The miner’s own counts and search are unchanged; the revised rule is available for later PLN queries. The bridge confidence is an estimate from its formula, not calibrated certainty.

## End-to-end flow

The maintained end-to-end experiment is **experiments/miner-to-pln/tests/test-miner-pln-heldout.metta**. It:

1. Loads the 60 source facts into **&source-db**.
2. Copies the 57 non-Alaura facts into **&training-db** and Alaura's three facts into the separate **&heldout-db** space.
3. Runs **PatternMiner.Mine** and the bridge using only **&training-db**.
4. Verifies the bridge created **ugly → human** with joint and antecedent support 9.
5. Supplies **Alaura is ugly** from **&heldout-db** as a PLN task and checks whether PLN derives **Alaura is human**.
6. Checks the held-out **Alaura is human** label only after inference.

The terms training and held-out space refer to separate MeTTa spaces containing different facts. Alaura's facts are not given to the miner or bridge. PLN receives only her held-out ugly premise and a rule learned from the other subjects.

## Cross-run evidence revision experiment

**experiments/miner-to-pln/tests/test-miner-pln-revision.metta** mines the same conditional rule independently from two existing datasets, then asks `PLN.Derive` to revise the rule from run B against the rule from run A.

- Batch A is `ugly_man_sodaDrinker.metta`: 10 ugly subjects, 5 of whom are soda drinkers.
- Batch B starts from `norm-isupr-valid/ugly_soda-drinker.metta`. It shares six subject names with A, so the experiment removes those subjects before mining. The remaining batch has 14 ugly subjects, 7 of whom are soda drinkers.
- Both runs therefore yield `ugly → sodaDrinker` with strength 0.5. The bridge confidence formula gives weights of 10 and 14 under PLN's `Truth_c2w`; revision should retain strength 0.5 and produce confidence 24/25 = 0.96.
- The test checks that the revised sentence carries evidence from both run-specific stamps.

This experiment is explicit; the bridge still does not revise beliefs automatically. The subject filtering is essential because `StampDisjoint` checks exact evidence tokens and cannot discover overlapping subjects by inspecting dataset IDs. These are example datasets, so this demonstrates the revision path and its arithmetic, not calibrated confidence or a real-world predictive result.


~~~text
dataset
  │
  ▼
PatternMiner.Mine
  │  (supportOf pattern count)
  ▼
miner-results-to-pln-beliefs
  │  (PLN Sentences, STVs, evidence, conditional Implications)
  ▼
&pln-beliefs
  │
  ├── PLN.Derive: run inference and inspect the expanded beliefs
  └── PLN.Query: ask for a particular conclusion and inspect the answer
~~~

## What the bridge creates

For each **(supportOf $pattern $count)** record, the bridge stores a PLN Sentence containing the pattern, an STV, and a MinerPatternEvidence stamp. For example, a mined conjunction such as **ugly ∧ sodaDrinker** is retained as a sentence.

For a binary conjunction, the bridge also creates conditional implications in both directions. If the conjunction has joint support 5, and each individual property has support 10, the bridge can create:

~~~metta
(Implication (Inheritance $x ugly)
             (Inheritance $x sodaDrinker))
(Implication (Inheritance $x sodaDrinker)
             (Inheritance $x ugly))
~~~

Their conditional strength is joint support divided by the support of the antecedent. The bridge records the joint and antecedent counts in MinerPatternRuleEvidence.

For the current 60-fact dataset, the bridge's mined-pattern STV uses:

~~~text
strength   = support / total database atom count
confidence = support / (support + 1)
~~~

For conditional rules, it uses:

~~~text
strength   = joint support / antecedent support
confidence = antecedent support / (antecedent support + 1)
~~~

The confidence formulas are the bridge's chosen estimates; they are not confidence intervals. The two STV calculations answer different questions: pattern frequency versus conditional frequency.

## Why use PLN.Derive?

**PLN.Derive** runs bounded inference using tasks and rules, then returns the updated task list and expanded belief list. Use it when you want to inspect the conclusions PLN derived, including their truth values and evidence. In this test, it checks whether **Alaura is human** appears among the derived beliefs.

## Why use PLN.Query?

**PLN.Query** asks for one specific conclusion and returns a matching answer with its truth value and evidence. Use it when you have a focused question and want that answer without inspecting the full derived belief list. This test asks:

~~~metta
(Inheritance Alaura human)
~~~

The test calls both functions to check both result styles. **PLN.Query** internally runs **PLN.Derive**, so an application normally chooses the one that fits its need rather than calling both. The function provided by this PLN library is named **PLN.Derive**; there is no **PLN.Drive** entry point.

Neither function mines patterns or turns support counts into premises. The bridge creates rules from mined records; the caller supplies the premise and selected rules.

## Held-out prediction experiment

The test divides the source facts into separate spaces:

1. **&source-db** holds all 60 original facts.
2. **&training-db** holds the 57 facts about everyone except Alaura. The miner and bridge use only this space.
3. **&heldout-db** holds Alaura's three facts. The test gives PLN only **Alaura is ugly** as an input premise.
4. **Alaura is human** remains out of PLN's tasks and rules. After inference, the test checks the answer against that fact in **&heldout-db**.

This checks whether a rule mined from one group can support a conclusion for a subject absent from the miner's input. The held-out space supplies the premise; the separate target fact is used only to score the prediction.

## Run the experiments

From the repository's **experiments/miner-to-pln/tests** directory:

~~~bash
../../../scripts/run-petta.sh test-miner-pln-heldout.metta
../../../scripts/run-petta.sh test-miner-pln-revision.metta
~~~

The test imports PLN from GitHub with PeTTa's **git-import!**. Its local import cache is under this test directory's **repos/** folder.

## Main files

- **experiments/miner-to-pln/tests/test-miner-pln-heldout.metta** — held-out miner-to-PLN prediction experiment.
- **experiments/miner-to-pln/tests/test-miner-pln-revision.metta** — two-run, subject-disjoint rule revision experiment.
- **experiments/miner-to-pln/miner-pln-bridge.metta** — support-to-STV conversion, PLN sentence and implication creation, and a query wrapper.
- **experiments/miner-to-pln/PLN_INTEGRATION_Research.md** — rationale and design alternatives.
- **experiments/data/ugly_man_sodaDrinker.metta** — source dataset.
- **(library PLN lib_pln)** — imported PLN implementation.