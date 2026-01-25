# Pattern Miner (PeTTa Edition)

## Description

This project is a port of the classic Pattern Miner to **PeTTa**, a high-performance interpreter for the MeTTa language. The Pattern Miner is designed to discover frequent and surprising patterns within large hypergraphs (Atomspaces), which is essential for inference, learning, and cognitive architectures.

Following the original logic from OpenCog Classic and its Hyperon/MeTTa port, this version is optimized to run in the PeTTa environment.

## How it works (Simplified)
Imagine you have a giant web of data (like a knowledge graph).
1. **Find Frequent Stuff**: The miner looks for connections that appear often (e.g., "People often drink soda").
2. **Find Surprising Stuff**: It then looks for things that are unexpected or rare relative to what we know (e.g., "A specific person who usually hates sugar is drinking soda" might be surprising).

It does this in two main steps:
1. **Frequent Pattern Mining**:
   - Finds basic recurring links.
   - Combines them into larger patterns.
   - Filters out rare ones.
2. **Surprisingness Scoring** (Optional):
   - Takes the frequent patterns.
   - Calculates how "surprising" they are using probability math.

## Getting Started with PeTTa

This project requires **PeTTa**. For installation instructions and setup guides, please refer to the official PeTTa repository:
- [**PeTTa Repository & Setup Guide**](https://github.com/trueagi-io/PeTTa/tree/main)

## Running the Code

### How to Run on Your Data

We have provided a starter script `run_miner.metta` in the root directory.

1.  **Open `run_miner.metta`** and find the dataset import line:
    ```metta
    !(import! &db experiments/data/ugly_man_sodaDrinker)
    ```
    Change this path to point to your own `.metta` dataset.

2.  **Adjust Parameters** (optional):
    You can change the minimum support (frequency) or pattern depth in the miner call:
    ```metta
    ;; (pattern-miner output input min-support depth mode normalization db-ratio conj-exp)
    !(pattern-miner &res &db 3 0 none none none True)
    ```


3.  **Run with PeTTa**:
    Assuming you have the PeTTa `run.sh` script (from the PeTTa repository):
    ```bash
    sh /path/to/petta/run.sh run_miner.metta
    ```


## Project Structure
- `experiments/pattern-miner`: The main entry point for mining.
- `experiments/frequent-pattern-miner`: Logic for finding frequent itemsets/links.
- `experiments/surprisingness`: Logic for calculating how surprising a pattern is.
- `experiments/validation`: Tests and validation files to prove correctness.

