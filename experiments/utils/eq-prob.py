"""
Hyperon-based utility script for pattern mining
Includes: variable extraction, abstraction sorting, more/less abstract filtering,
joint variable detection, and probability computation.

August 2025
"""

from hyperon import *
from hyperon.ext import register_atoms
from hyperon.atoms import ExpressionAtom
from typing import List

# -------------------------
# Utility Functions
# -------------------------

def is_var_exist(exp: ExpressionAtom, var: str) -> bool:
    """Recursively check if a variable exists in an ExpressionAtom."""
    if hasattr(exp, "get_children"):
        return any(is_var_exist(c, var) for c in exp.get_children())
    return str(exp).startswith("$") and str(exp) == var

def connected_subpattern_with_var(block: ExpressionAtom, var: str) -> ExpressionAtom:
    """Return block if it contains the variable, else None."""
    return block if is_var_exist(block, var) else None

def filter_blocks_with_var(partition: List[ExpressionAtom], var: str) -> List[ExpressionAtom]:
    """Filter blocks in partition that contain the variable."""
    return [b for b in partition if connected_subpattern_with_var(b, var)]

def connected_subpatterns_with_var(partition: List[ExpressionAtom], var: str) -> List[ExpressionAtom]:
    """Return all blocks from partition that contain the variable."""
    return filter_blocks_with_var(partition, var)


def extract_vars_and_concretes(block: ExpressionAtom):
    """
    Recursively extract all variables (starting with $) and concretes (non-variable strings) 
    from a block in a single traversal.
    """
    variables, concretes = set(), set()

    if hasattr(block, "get_children"):
        for c in block.get_children():
            v, c_set = extract_vars_and_concretes(c)
            variables |= v
            concretes |= c_set
    else:
        s = str(block)
        if s.startswith("$"):
            variables.add(s)
        else:
            concretes.add(s)

    return variables, concretes


def count_variables_and_concretes(block: ExpressionAtom):
    """Return tuple (num_variables, num_concretes) in a block."""
    variables, concretes = extract_vars_and_concretes(block)
    return len(variables), len(concretes)


# =============================================================================
# Block abstraction comparison
# =============================================================================
def is_blk_more_abstract(l_blk: ExpressionAtom, r_blk: ExpressionAtom, var: str = None):
    """
    Returns True if l_blk is more abstract than r_blk.
    More abstract = more variables OR (same variables and fewer concretes)
    """
    l_vars, l_concs = count_variables_and_concretes(l_blk)
    r_vars, r_concs = count_variables_and_concretes(r_blk)
    return l_vars > r_vars or (l_vars == r_vars and l_concs < r_concs)

def filter_more_abstract(patterns: List[ExpressionAtom], pivot: ExpressionAtom, var: str = None) -> List[ExpressionAtom]:
    """Return patterns more abstract than pivot."""
    return [p for p in patterns if is_blk_more_abstract(p, pivot, var)]

def filter_less_abstract(patterns: List[ExpressionAtom], pivot: ExpressionAtom, var: str = None) -> List[ExpressionAtom]:
    """Return patterns less abstract than pivot."""
    return [p for p in patterns if not is_blk_more_abstract(p, pivot, var)]

def sort_by_abstraction(patterns: List[ExpressionAtom], var: str = None) -> List[ExpressionAtom]:
    """Sort patterns by abstraction using pivot-based recursion."""
    if not patterns:
        return []
    if len(patterns) == 1:
        return patterns

    pivot = patterns[0]
    rest = patterns[1:]

    more_abstract = filter_more_abstract(rest, pivot, var)
    less_abstract = filter_less_abstract(rest, pivot, var)

    sorted_more = sort_by_abstraction(more_abstract, var)
    sorted_less = sort_by_abstraction(less_abstract, var)

    return sorted_more + [pivot] + sorted_less

def find_most_specialized_abstract(sorted_partition: List[ExpressionAtom], j_blk: ExpressionAtom, start_idx: int) -> int:
    """Find index of most specialized block more abstract than j_blk."""
    for i in range(start_idx, -1, -1):
        if is_blk_more_abstract(sorted_partition[i], j_blk):
            return i
    return -1

    
# -------------------------
# Probability Functions
# -------------------------

def value_count(blk: ExpressionAtom, var: str, db: List[ExpressionAtom]) -> int:
    """
    Count unique values a variable takes in database given a block.
    Equivalent to (value-count $blk $var $db) in MeTTa.
    """
    values = set()
    for entry in db:
        if matches(entry, blk): 
            val = get_value(entry, blk, var)
            if val is not None:
                values.add(str(val))
    return max(1, len(values))


def matches(entry: ExpressionAtom, blk: ExpressionAtom) -> bool:
    """
    Check if all concretes in blk match entry; ignore variables.
    Equivalent to unification of blk against entry, ignoring vars.
    """
    entry_ch = entry.get_children() if hasattr(entry, "get_children") else []
    blk_ch = blk.get_children() if hasattr(blk, "get_children") else []

    if len(entry_ch) != len(blk_ch):
        return False

    for e1, e2 in zip(entry_ch, blk_ch):
        if not str(e2).startswith("$"):  
            if str(e1) != str(e2):
                return False
    return True


def get_value(entry: ExpressionAtom, blk: ExpressionAtom, var: str):
    """Return the concrete value bound to var in entry."""
    entry_ch = entry.get_children() if hasattr(entry, "get_children") else []
    blk_ch = blk.get_children() if hasattr(blk, "get_children") else []

    for e1, e2 in zip(entry_ch, blk_ch):
        if str(e2) == var:
            return e1
    return None


def process_blocks(sorted_partition: List[ExpressionAtom], var: str,
                   db: List[ExpressionAtom], p: float = 1.0, j: int = 1) -> float:
    """Recursive processing of sorted blocks to compute probability."""
    if j >= len(sorted_partition):
        return p

    j_blk = sorted_partition[j]
    i = find_most_specialized_abstract(sorted_partition, j_blk, j - 1)

    if i >= 0:
        c = value_count(sorted_partition[i], var, db)
    else:
        c = len(db)

    return process_blocks(sorted_partition, var, db, p / c, j + 1)


def calculate_prob_for_vars(vars_: List[str], partition: List[ExpressionAtom],
                            db: List[ExpressionAtom], p: float = 1.0) -> float:
    """Compute cumulative probability for a list of variables."""
    if not vars_:
        return p

    var = vars_[0]
    remaining = vars_[1:]

    var_partition = connected_subpatterns_with_var(partition, var)
    print(f"Processing var {var} with partition {var_partition}")

    sorted_partition = sort_by_abstraction(var_partition, var)
    print(f"Sorted partition for var {var}: {sorted_partition}")

    new_p = process_blocks(sorted_partition, var, db, p)
    print(f"Probability after processing var {var}: {new_p}")

    return calculate_prob_for_vars(remaining, partition, db, new_p)


def eq_prob(partition: List[ExpressionAtom], pattern: ExpressionAtom,
            db: List[ExpressionAtom]) -> float:
    """
    Compute probability of variables in pattern being equal across partition.
    """
    joint_vars = [str(e) for e in pattern.get_children()
                  if str(e).startswith("$")]
    print("Joint variables:", joint_vars)
    return calculate_prob_for_vars(joint_vars, partition, db)


# -------------------------
# Joint Variables
# -------------------------

def joint_variables(pattern: ExpressionAtom, partition: List[ExpressionAtom]) -> List[str]:
    """Return variables that appear in multiple blocks."""
    vars_ = [str(e) for e in pattern.get_children() if str(e).startswith("$")]
    return [v for v in vars_ if count_blocks_with_var(v, partition) > 1]

def count_blocks_with_var(var: str, partition: List[ExpressionAtom]) -> int:
    """Count number of blocks containing a variable."""
    return sum(1 for blk in partition if is_var_exist(blk, var))

def intersection_vars(vars1: List[str], vars2: List[str]) -> List[str]:
    """Return intersection of two variable lists."""
    return [v for v in vars1 if v in vars2]

# -------------------------
# Helper for Pretty Printing
# -------------------------

def pretty_blocks(blocks: List[ExpressionAtom]):
    """Return list of string representations for ExpressionAtom blocks."""
    return [str(b) for b in blocks]

# -------------------------
# main with examples
# -------------------------

def main():
    metta = MeTTa()

    x, y, z = "$x", "$y", "$z"

    partition = [
        metta.parse_all(f"(Human {x} {y})")[0],
        metta.parse_all(f"(Human {x} {y} Chala)")[0],
        metta.parse_all(f"(Animal Dog {y})")[0],
        metta.parse_all(f"(Human Abebe Chala)")[0]
    ]

    pattern = metta.parse_all(f"(Human {y})")[0]

    db = [
        metta.parse_all("(Human Alice Mary)")[0],
        metta.parse_all("(Human Bob John)")[0],
        metta.parse_all("(Human Charlie Chala)")[0]
    ]

    print("Blocks with variable x:", pretty_blocks(connected_subpatterns_with_var(partition, x)))
    print("Sorted partition (abstraction):", pretty_blocks(sort_by_abstraction(partition, y)))
    print("More abstract than pivot:", pretty_blocks(filter_more_abstract(partition, pattern, x)))
    print("Less abstract than pivot:", pretty_blocks(filter_less_abstract(partition, pattern, x)))
    print("Probability:", eq_prob(partition, pattern, db))
    print("Joint variables:", joint_variables(pattern, partition))
    print("Intersection:", intersection_vars(["$x", "$y"], ["$y", "$z"]))

if __name__ == "__main__":
    main()
