# Hyperon Pattern Miner

## Description

The goal of this project is to port the classic Pattern Miner to Hyperon using MeTTa, the language of OpenCog Hyperon. Pattern Miner is used to identify not only frequent patterns but also interesting or surprising patterns in the large hypergraph space (Atomspace). This capability is crucial for inference, learning, and cognitive architectures.

For this current phase, we are directly porting from the classic implementation, following the same flow, algorithms, and structure. However, the actual implementation adheres to Hyperon concepts and leverages MeTTa’s capabilities for  reasoning and pattern manipulation.

## How it works 
This pattern miner is to mine frequent and interesting patterns from Hypergraph AtomSpace. In order to do that, it will first mine frequent patterns and store them in a new space, which will be passed to the surprisingness components to score each pattern's surprisingness value.

**To Mine Frequent Patterns:**
- Mine Abstract Patterns:
Query link nodes, form abstract patterns with variables, and filter by minimum support.

- Specialize Patterns:
Break abstract patterns into triplets, apply valuations (including nested expressions), and build specializations.

- Select Candidate Patterns:
Evaluate support for specialized patterns and keep those meeting the support threshold.

- Expand via Conjunction:
Combine candidate patterns through variable mapping, remove redundancy, and normalize structure.


After having frequent patterns, they will be processed by the surprisingness scoring part. For now, we haven't integrated the frequent miner with the surprisingness part, but both phases can be run independently to see their results. After the integration, the surprisingness phase starts from the frequent miner result and scores each of the mined patterns and meets the surprisingness rules. To do that, it will use a backward chainer.

**Score Surprisingness Value:**
- Compute the empirical probability of a pattern based on support or bootstrapped sampling

- Divide the pattern into partitions of sub-patterns

- For each partition, compute a probability estimate assuming independence between blocks

- From these estimates, determine the minimum (emin) and maximum (emax) probable values

- Compute the distance between the empirical probability and the interval emin,emax

- Optionally normalize this distance using the empirical value



## Running the code
-  [Pattern-miner](https://github.com/iCog-Labs-Dev/hyperon-miner/tree/syn/experiments/pattern-miner)

