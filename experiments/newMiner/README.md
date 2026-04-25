# New Miner

This directory contains experimental implementations for a new pattern miner.

## Files
- `newMain.metta`: The main entry point for the new miner.
- `remove.metta`: Rules or utilities for removing redundant patterns or clauses.
- `utils.metta`: Common utility functions used by the miner.

## Usage
Run the miner using the runner script from the root/PeTTa directory:
```bash
sh run.sh 'c:/Users/Vertx/Desktop/coding/Metta/hyperon-miner/experiments/newMiner/newMain.metta'
```

## Architecture

The New Miner uses a **Top-Down Combinatorial Specialization** approach. Rather than building up concrete conjunctions by adding links one-by-one, it generates abstract structural shapes and progressively instantiates them with concrete values from the knowledge base.

### 1. Abstract Pattern Generation
The process begins in `abstractPattern`, which generates a purely variable-based structure with a specific number of clauses (e.g., `(, (Inheritance $x $y) (Inheritance $x $z))`). This "skeleton" is first checked against the database to see if the general shape has enough minimum support (`$ms`).

### 2. Variable Valuation
If the abstract pattern meets the minimum support, the miner queries the database using `match` to find all actual values that can satisfy the variables in that specific shape. These valuations are grouped and structured per variable (`structureValues`).

### 3. Combinatorial Specialization
The `mainSpecializer` function iterates through the structured variable valuations. It takes the abstract pattern and replaces variables with concrete values (e.g., setting `$x` to `Bob` or `$y` to `man`) one step at a time. 

### 4. Validation and Filtering
After a variable is specialized, the new partially instantiated conjunct is passed to the `conjunctChecker`. The checker rejects patterns based on three primary criteria:
- **Redundancy:** It checks if the conjunct space (`cnjSpace`) already contains this pattern (`is_member`).
- **Connectedness (`main-func`):** Evaluated primarily by `nolawi.metta`, it ensures the elements of the conjunction remain connected. It checks for and rejects patterns that are broken into disjoint or unbound sub-graphs.
- **Minimum Support:** It runs `sup-evalCustom` to guarantee the newly specialized pattern still meets the `$ms` threshold.
- **Abstract Filters:** Finally, it verifies that no untended generalized abstract clauses linger unnecessarily.

If the pattern passes these checks, it is recursively passed down to specialize the remaining variables. This ensures early pruning of invalid bindings while exhaustively mining the valid combinatorics.

### Why this approach? (The A Priori Advantage)
Incremental Conjunction Expansion (bottom-up) breaks the *a priori* property because a combined conjunction can sometimes yield more matches than its individual parts, causing valid patterns to be accidentally pruned. Our **Top-Down Combinatorial Specialization** fixes this by evaluating the full abstract shape first. Because the abstract shape represents the absolute maximum possible support for that structure, any variable instantiation is a strict specialization. This restores the *a priori* property, allowing us to safely and aggressively prune branches without missing complex multi-clause patterns.

```text
[ Abstract Pattern Generation ]  e.g., (, (Inheritance $x $y) (Inheritance $y $z))
              |
              v
[ Support Check (A Priori Bound) ] ---> (Fails? Prune entire structural shape)
              |
              v
[ Variable Valuation via Match ] ---> (Find all DB values mapping to variables)
              |
              v
[ Combinatorial Specialization ] ---> (Iteratively bind variables: $x -> Bob)
              |
              v
[ Conjunct Checker & Filter ] ------> (Fails min support/redundancy? Prune branch)
              |
              v
[ Valid Mined Concrete Patterns ]
```
