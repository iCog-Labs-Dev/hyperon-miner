# Why Integrate PLN with Hyperon Pattern Miner?

## 1. The Problem with Pure Statistical Mining

The Hyperon frequent-pattern miner discovers patterns purely by counting — it finds structures that appear frequently in the AtomSpace. This produces correct statistical answers but has 2 concrete limitations that PLN directly addresses.

### Limitation 1: Redundant beliefs accumulate across mining runs

Within a single mining run, the miner already handles deduplication: `unique-atom` removes duplicate patterns and `sort_conj` canonicalises conjunction ordering so `(, A B)` and `(, B A)` are treated as the same pattern.

The PLN library defines `Truth_Revision`, and `PLN.Derive` checks `StampDisjoint` before combining task and belief evidence. The explicit experiment `tests/test-miner-pln-revision.metta` mines `ugly → sodaDrinker` independently from two subject-disjoint batches and checks the revised STV and combined evidence stamp. The bridge itself still only adds converted sentences; it does not automatically revise repeated results across runs. `StampDisjoint` compares exact evidence tokens and cannot detect overlapping subjects from dataset IDs, so the experiment filters the six shared subject names before its second run. This demonstrates the revision mechanism and its arithmetic on the example data; it does not establish calibrated confidence.

**This only matters in iterative or incremental mining setups, not in a single one-shot run.**

### Limitation 2: PLN derives facts the miner cannot find directly

This applies when the dataset contains an observation that can be combined with a rule to infer a new fact. For example, suppose mining a frequent co-occurrence leads the bridge to create this rule, while the second rule comes from external domain knowledge:

```metta
(Implication (Inheritance $x ugly) (Inheritance $x man))
(Implication (Inheritance $x man) (Inheritance $x sportsFan))
```

Now suppose the database or query supplies this fact:

```metta
(Inheritance Alice ugly)
```

PLN applies Modus Ponens twice:

```text
Alice is ugly + (ugly → man)          ⇒ Alice is man
Alice is man   + (man → sportsFan)    ⇒ Alice is a sports fan
```

The miner cannot count `(Inheritance Alice sportsFan)` if that fact is absent from the database. Modus Ponens can infer it from the supplied premise and rules. This example is about deriving an individual fact; it does not claim that the miner discovered the rule chain or that it can infer a missing population-level co-occurrence from counts alone.


## 2. Why Integrate at the pattern-miner/ Layer Specifically?

The project has multiple layers where PLN could have been integrated. Each was considered for concrete reasons.

### Option A: Inside frequent-pattern-miner/ — partially appropriate

The `frequent-pattern-miner/` modules handle raw pattern generation and support counting. Not all of them are equally appropriate for PLN integration.

**`candidate.metta` and `build-specialization.metta`** — PLN adds no value here. These generate single-atom patterns like `(Inheritance $x ugly)`. A single Atomese link has no logical structure to contradict. PLN has no basis for pruning or scoring at this stage because no conjunction exists yet.

**`conjunction-expansion.metta`** — a PLN prefilter is a possible future design, but it is not part of the current pipeline. This is an expensive step: `checker()` runs `sup-eval` on candidate conjunctions before deciding whether to keep them. A prefilter could help only when PLN has explicit, relevant contradiction evidence for a candidate.

In a proposed version of this design, a prefilter inside `checker()` could reject a candidate only when PLN derives an explicit contradiction. For example, if PLN knows:

```metta
(Implication (Inheritance $x man) (Not (Inheritance $x woman)))
```

then a candidate asserting that the same individual is both a man and not a woman could be rejected before `sup-eval` runs.

This prefilter is **not implemented in the current `checker()`**. If added, no PLN answer must be treated as unknown, not as a contradiction, so `sup-eval` would still run. Its value would depend on how often explicit contradiction evidence is available and whether those checks cost less than the support scans they avoid.


### Option B: Inside truth-values/ (rejected)

The `truth-values/` module (`est-tv.metta`, `emp-tv.metta`) computes empirical and estimated truth values for patterns from raw data. This is where strength/confidence numbers are produced before the miner reports results.

PLN was not integrated here because these functions compute values from raw database matches — they are data-driven, not inference-driven. PLN operates on derived beliefs, not raw database queries. Mixing PLN into the TV computation layer would confuse two distinct epistemic sources:

- `emp-tv`: what the data directly shows (empirical)
- `PLN-derived`: what can be inferred from other beliefs (rational)

These should remain separate. The bridge converts empirical results into STV-bearing PLN sentences; it does not automatically call `Truth_Revision` to merge repeated results.

### Option C: Standalone PLN layer — the pattern-miner/ bridge (chosen)

The pattern-miner stage orchestrates mining, collects results, applies surprisingness scoring, and outputs to &kb. The separate integration files are organized under experiments/miner-to-pln/.

**This is the correct integration point because:**

1. **It has access to the complete mined output.** By the time `pattern-miner.metta` runs its post-mining step, all `supportOf` atoms are collected. PLN needs complete pattern lists to compute meaningful beliefs — not partial results from inside the mining loop.

2. **It is the natural handoff boundary.** The miner's job ends when it writes `supportOf` records. PLN's job begins when it receives those records as `Sentence` atoms. `experiments/miner-to-pln/miner-pln-bridge.metta` is the translation layer at exactly this boundary.

3. **It does not pollute the mining algorithm.** The `frequent-pattern-miner` remains a pure counting engine. `pattern-miner.metta` adds the PLN layer on top without changing any mining logic.

4. **It makes beliefs available for later reasoning.** A caller can retain `&pln-beliefs` and use them in a later PLN query or derivation. The miner's candidate generation is not influenced by those beliefs unless an explicit feedback or pruning step is added.

---

## 3. What the Integration Actually Adds

| Without PLN | With PLN Integration |
|-------------|----------------------|
| Patterns are isolated support counts | Patterns become probabilistic beliefs linked to each other |
| Mined rules are not used to answer queries | `PLN.Derive` and `PLN.Query` can reason from mined rules and supplied premises |
| Mined supports are counts, not inference results | PLN inference rules propagate STVs when a caller runs inference |
| Repeated results are not automatically revised by the bridge | A separate experiment invokes `PLN.Derive` with disjoint run evidence and checks the revised belief |
| Cannot combine mined rules with domain axioms | PLN chains empirical rules with external knowledge |
| Candidate generation has no PLN contradiction filter | A future prefilter could reject candidates when explicit contradiction evidence is available |


## 4. The Bridge File's Role (miner-pln-bridge.metta)

`miner-pln-bridge.metta` is not part of the miner and not part of PLN. It is a **translation and orchestration layer** that:

1. **Translates** `supportOf` atoms (miner output) into `Sentence` atoms (PLN input) with correct `stv` values derived from support counts.

2. **Derives directional Implication rules** from binary conjunctions (e.g. A∧B with support → both A→B and B→A with conditional probability as strength).

3. **Exposes PLN reasoning operations.** The bridge has a Modus Ponens helper and a bounded query wrapper. Callers can also use `PLN.Derive` or `PLN.Query` from the imported PLN library. The bridge does not automatically run every PLN inference mode at each mining handoff.

4. **Keeps derived conclusions separate** when using its Modus Ponens helper, so inferred results can be distinguished from observed or mined beliefs.

### Using `PLN.Derive` and `PLN.Query`

Using these after the bridge has placed mined rules in a belief list, together with any separately evidenced premises needed for the inference:

- **`PLN.Derive`** runs inference for a bounded number of steps and returns the remaining task list and expanded belief list. we can use it when we want to inspect the conclusions PLN can derive, along with their truth values and evidence.
- **`PLN.Query`** asks for one specific term. It runs bounded derivation internally and returns the best-confidence matching answer it finds, including its truth value and evidence; it can return no answer if the supplied premises and rules do not derive that term. we can use it when we have a focused question rather than wanting the whole expanded belief state.

---

## 5. Summary

PLN is connected to Hyperon Pattern Miner at the post-mining handoff, with integration files kept in `experiments/miner-to-pln/`, because:

1. **The miner produces statistically frequent patterns** but cannot evaluate their logical meaning, uncertainty, or relationships to other known facts.

2. **PLN is Hyperon's native uncertain reasoning engine**, using the same Atomese structures the miner already produces.

3. **The post-mining boundary is the correct handoff point** — it sits above the mining algorithm and below the application layer, making it the natural place to translate statistical outputs into logical beliefs.

4. **Integrating at lower layers** (`frequent-pattern-miner/`, `truth-values/`) would violate separation of concerns and create circular dependencies.

The current result is a post-mining handoff: the miner discovers patterns, the bridge converts support records into PLN beliefs, and callers can use bounded PLN derivation or queries to reason from those beliefs. PLN results do not currently guide candidate generation in a later mining iteration; that feedback would require an additional integration step.

---
