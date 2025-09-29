from itertools import combinations
import copy
from hyperon import MeTTa
from hyperon.ext import register_atoms
from hyperon.atoms import OperationAtom
import re
metta = MeTTa()

def parseFromExpresstion(metta, expresion, dimention):
    if dimention == 1:
        return [str(child).replace("#", "") for child in expresion.get_children()]
    elif dimention == 2:
        out = []
        for childExp in expresion.get_children():
            out.append([[str(child).replace("#", "")
                       for child in childExp.get_children()]])
        return out

def powerset_without_empty(blk):
    """Generate all non-empty subsets of a block"""
    result = []
    for i in range(1, len(blk) + 1):
        for combo in combinations(blk, i):
            result.append(list(combo))
    return result

def partitions(hs):
    """Generate all possible partitions of a sequence, preserving order"""
    if not hs:
        return [[]]    
    head = hs[0]
    rest_partitions = partitions(hs[1:])
    result = []    
    for partition in rest_partitions:
        # Add head to existing groups (at the front to preserve order)
        for i in range(len(partition)):
            new_partition = copy.deepcopy(partition)
            new_partition[i].insert(0, head)
            result.append(new_partition)        
        # Create new group with head
        new_partition = copy.deepcopy(partition)
        new_partition.append([head])
        result.append(new_partition)    
    return result

def sub_var(atom, var, replacement):
    """Substitute variable in a single atom"""
    if atom == var:
        return replacement
    # Handle nested lists recursively
    if isinstance(atom, list):
        return [sub_var(item, var, replacement) for item in atom]
    return atom

def replace_var_exp(exp, var, replacement):
    """Replace variable inside an expression (list)"""
    return [sub_var(atom, var, replacement) for atom in exp]

def erase(pattern, var, replacement):
    """Erasing variable by replacing with given value"""
    return replace_var_exp(pattern, var, replacement)

def is_variable(atom):
    """Check if an atom is a variable (starts with $)"""
    return isinstance(atom, str) and atom.startswith('$')

def unify_with_metta(l_blk, r_blk):
    def to_expr(blk):
        """Converts a nested list block into a MeTTa expression string."""
        if isinstance(blk, list):
            # If the block is a list, recursively convert its children
            # and wrap the result in parentheses.
            children_str = " ".join([to_expr(item) for item in blk])
            return f"({children_str})"
        else:
            # If it's a single atom, just return its string representation.
            return str(blk)
    l_expr = to_expr(l_blk)
    r_expr = to_expr(r_blk)
    

    code = f"! (unify {l_expr} {r_expr} pass fail)"
    result = metta.run(code)
    # Normalize: flatten and stringify
    flat_result = [str(item) for sub in result for item in sub]
    return "fail" not in flat_result


def replace_variables_with_indices(pattern):
    """Replace variables with De Bruijn-like indices for standardization"""
    var_map = {}
    index = 0
    
    def replace_in_structure(item):
        nonlocal index
        if isinstance(item, list):
            return [replace_in_structure(sub_item) for sub_item in item]
        elif is_variable(item):
            if item not in var_map:
                var_map[item] = f"deb-{index}"
                index += 1
            return var_map[item]
        else:
            return item
    return replace_in_structure(pattern)

def validate_unification(left_body, right_body):
    """Validate unification with variable indexing"""
    # Replace variables in right body with indices for standardization
    indexed_right_body = replace_variables_with_indices(right_body)
    # print("indexed_right_body:",indexed_right_body)
    # Use existing MeTTa unification logic
    return unify_with_metta(left_body, indexed_right_body)

def blocks_can_unify(l_blk, r_blk, var):
    """Check if two blocks can be unified relative to var"""
    return unify_with_metta(l_blk, r_blk)

def is_blk_syntax_more_abstract(l_blk, r_blk, var):
    """Check if l_blk is more abstract than r_blk with respect to var"""
    if var not in str(l_blk) or var not in str(r_blk):
        return False

    l_erased = erase(l_blk, var, "@eyob")
    r_erased = erase(r_blk, var, "@eyob")

    l_erased_flat = []
    def flatten(l):
        for el in l:
            if isinstance(el, list):
                flatten(el)
            else:
                l_erased_flat.append(el)
    flatten(l_erased)
    r_erased_flat = []
    def flatten(l):
        for el in l:
            if isinstance(el, list):
                flatten(el)
            else:
                r_erased_flat.append(el)
    flatten(r_erased)
    
    can_unify_result = blocks_can_unify(l_blk, r_blk, var)
    if can_unify_result:
        return validate_unification(l_erased, r_erased)
    return False

def is_blk_more_abstract(l_blk, r_blk, var):
    """Check if l_blk is more abstract than r_blk relative to var"""
    r_subsets = powerset_without_empty(r_blk)
    l_partitions = partitions(l_blk)
    # Step 3: Check each partition against each power set
    for lp in l_partitions:  # For each partition of left block
        for rs in r_subsets:  # For each subset of right block
            # Check if ALL parts of left partition can be unified with right subset
            all_parts_unifiable = True
            for lb in lp:  # For each part in left partition
                if not is_blk_syntax_more_abstract(lb, rs, var):
                    all_parts_unifiable = False
                    break
            
            if all_parts_unifiable:
                return True    
    return False


def normalize_pattern(p):
    if not isinstance(p, list):
        return [p]
    if len(p) == 0:
        return []
    if any(isinstance(el, list) for el in p):
        return p
    return [p]



def filter_more_abstract(patterns, pivot, var):
    """Keep only patterns that are MORE abstract than pivot."""
    if not patterns:
        return []
    head, *tail = patterns

    # Normalize shapes before comparing
    head_norm = normalize_pattern(head)
    pivot_norm = normalize_pattern(pivot)

    is_head_abstract = is_blk_more_abstract(head_norm, pivot_norm, var)
    # print("in filter-more", is_head_abstract, "head_norm=", head_norm, "pivot_norm=", pivot_norm)

    rest_filtered = filter_more_abstract(tail, pivot, var)
    if is_head_abstract:
        return [head] + rest_filtered
    else:
        return rest_filtered


def filter_less_abstract(patterns, pivot, var):
    """Keep only patterns that are NOT more-abstract than pivot."""
    if not patterns:
        return []
    head, *tail = patterns

    head_norm = normalize_pattern(head)
    pivot_norm = normalize_pattern(pivot)

    is_head_abstract = is_blk_more_abstract(head_norm, pivot_norm, var)
    # print("in filter-less", is_head_abstract, "head_norm=", head_norm, "pivot_norm=", pivot_norm)

    rest_filtered = filter_less_abstract(tail, pivot, var)
    if not is_head_abstract:
        return [head] + rest_filtered
    else:
        return rest_filtered

    
# =============================================================================
# Function: sort_by_abstraction
# -----------------------------------------------------------------------------
# Purpose:
#   Sorts a list of patterns based on abstraction level using is-blk-more-abstract
#   More abstract patterns come first in the sorted result
#
#
# Parameters:
#   patterns - List of patterns to sort
#   var - Variable to use for abstraction comparison
#
# Returns:
#   Sorted list where more abstract patterns appear first
#
# Example:
#   sort_by_abstraction((pattern1 pattern2 pattern3) var)
# =============================================================================

def sort_by_abstraction(patterns, var):
    """Sort patterns so that more abstract ones come first, using quicksort style."""
    if not patterns:
        return []
    
    if len(patterns) == 1:
        return patterns  # Single element list is already sorted
    
    pivot = patterns[0]
    rest = patterns[1:]
    
    more_abstract = filter_more_abstract(rest, pivot, var)
    less_abstract = filter_less_abstract(rest, pivot, var)
    
    sorted_less = sort_by_abstraction(less_abstract, var)
    sorted_more = sort_by_abstraction(more_abstract, var)
    
    return sorted_more + [pivot] + sorted_less



def get_variables_from_pattern(pattern):
    """Extract all variables from a pattern (list), returning a set of variable names."""
    vars_set = set()
    def extract_vars(item):
        if isinstance(item, list):
            for sub_item in item:
                extract_vars(sub_item)
        elif is_variable(item):
            vars_set.add(item)
    
    extract_vars(pattern)
    return vars_set


def is_variable_in_block(block, var):
    """Check if a variable appears anywhere in a block (list)."""
    if isinstance(block, list):
        for item in block:
            if is_variable_in_block(item, var):
                return True
    else:
        return block == var
    return False

def joint_variables(pattern, partition):
    """Find variables that appear in multiple blocks of partition"""
    # Get all variables from the pattern (equivalent to get_variables(pattern).varset)
    pattern_vars = get_variables_from_pattern(pattern)
    
    var_count = {}
    
    # For each variable in the pattern
    for var in pattern_vars:
        count = 0
        # Count how many blocks contain this variable
        for block in partition:
            if is_variable_in_block(block, var):
                count += 1
        var_count[var] = count
    
    # Return variables that appear in more than 1 block
    joint_vars = []
    for var, count in var_count.items():
        if count >= 1:  # appears in 2+ blocks
            joint_vars.append(var)
    
    return joint_vars

def connected_subpattern_with_var(block, var):
    # If the variable appears anywhere in the block, return the whole block
    if is_free_in_any_tree(block, var):
        return block
    return []

# def connected_subpattern_with_var(block, var):
#     if not is_free_in_any_tree(block, var):
#         return []
    
#     # Get all strongly connected components
#     components = get_components(block)
    
#     # Find the component containing the variable
#     for component in components:
#         if is_free_in_any_tree(component, var):
#             return component
    
#     return []

def connected_subpatterns_with_var(partition, var):
    var_partition = []
    for block in partition:
        connected_subpattern = connected_subpattern_with_var(block, var)
        if connected_subpattern:  # Only add non-empty results
            var_partition.append(connected_subpattern)
    
    return var_partition

def is_free_in_any_tree(block, var):
    """Check if variable is free in any clause in the block"""
    def is_var_in_item(item, var):
        if isinstance(item, list):
            return any(is_var_in_item(sub, var) for sub in item)
        return item == var
    
    if isinstance(block, list):
        return any(is_var_in_item(clause, var) for clause in block)
    return is_var_in_item(block, var)

# def get_components(clauses):
#     if not clauses:
#         return []
    
#     # Extract all variables from all clauses
#     def get_vars_from_clause(clause):
#         vars_set = set()
#         def extract_vars(item):
#             if isinstance(item, list):
#                 for sub in item:
#                     extract_vars(sub)
#             elif is_variable(item):
#                 vars_set.add(item)
#         extract_vars(clause)
#         return vars_set
    
#     # Build variable-to-clauses mapping
#     var_to_clauses = {}
#     clause_vars = {}
    
#     for i, clause in enumerate(clauses):
#         vars_in_clause = get_vars_from_clause(clause)
#         clause_vars[i] = vars_in_clause
        
#         for var in vars_in_clause:
#             if var not in var_to_clauses:
#                 var_to_clauses[var] = set()
#             var_to_clauses[var].add(i)
    
#     # Find connected components using union-find approach
#     components = []
#     visited = set()
    
#     for i, clause in enumerate(clauses):
#         if i in visited:
#             continue
            
#         # Start a new component
#         component = []
#         to_visit = [i]
        
#         while to_visit:
#             current = to_visit.pop()
#             if current in visited:
#                 continue
                
#             visited.add(current)
#             component.append(clauses[current])
            
#             # Find all clauses connected through shared variables
#             for var in clause_vars[current]:
#                 for connected_clause_idx in var_to_clauses[var]:
#                     if connected_clause_idx not in visited:
#                         to_visit.append(connected_clause_idx)
        
#         if component:
#             components.append(component)
#     # print("component:", components)
#     return components


# =============================================================================
# Function: process-blocks
# -----------------------------------------------------------------------------
# Purpose:
#   Processes blocks in sorted partition starting from index j=1
#   (skipping the first block as per the C++ algorithm)
#
# Parameters:
#   $sorted-partition - Partition sorted by abstraction
#   $var - Current variable being processed
#   $db - Database
#   $p - Current probability
#   $j - Current block index (starts at 1)
#
# Returns:
#   Updated probability after processing all blocks
# =============================================================================

def process_blocks(sorted_partition, var, db, p, j): 
    # Base case: if j >= partition_size, return p
    partition_size = len(sorted_partition)
    if j >= partition_size:
        return p
    
    # Get current block j
    j_blk = sorted_partition[j]
    
    # Find most specialized abstract block (find-most-specialized-abstract equivalent)
    i = find_most_specialized_abstract(sorted_partition, j_blk, var, j - 1)
    
    # Calculate count c
    if i >= 0:
        i_blk = sorted_partition[i]
        c = value_count(i_blk, var, db)
    else:
        # Use |U| = db.size() as fallback
        c = len(db)
    
    # Calculate new probability
    new_p = p / c if c > 0 else p
    
    # Recursive call to process next block
    return process_blocks(sorted_partition, var, db, new_p, j + 1)

def find_most_specialized_abstract(sorted_partition, j_blk, var, max_i):

    i = max_i
    while i >= 0:
        i_blk = sorted_partition[i]
        if is_blk_more_abstract(i_blk, j_blk, var):
            return i
        i -= 1
    return -1  # No abstract block found

def parseToExpression(strings):
    strings = strings.replace("[", "(").replace("]", ")").replace(
        ",", "").replace("\"", "").replace("'", "").replace("#", "")
    
    return strings
def value_count(blk, var, db):
    blk = parseToExpression(str(blk))
    # print("blk:", blk)
    db = parseToExpression(str(db))
    var = parseToExpression(str(var))
    count_value = metta.run(
        f""" 
        !(bind! &temp_db (new-space))
        (= (create-space $db_content)
            (let $atom (add-atom &temp_db $db_content))
        )
        ! (create-space {db})
        (= (value-count $blk $var $db) 
        (let $conj-blk (union-atom (,) $blk) (let*
        (  
        ; (() (println! ("conj-blk:" $conj-blk)))
        ($match-values (collapse (match $db $conj-blk $var)) )
        ($ground-value (unique-atom $match-values))
     
     ) (size-atom $ground-value))))
     
     ! (value-count {blk} {var} {db})
        """
    )
    value = len(count_value)
    return value
    
def eq_prob(metta, partition, pattern, db):
    # db_m = f"! (get-atoms {db})"
    parsed_db = parseFromExpresstion(metta, db, 1)
    parsed_partition = parseFromExpresstion(metta, partition, 2)
    parsed_pattern = parseFromExpresstion(metta, pattern, 1)
    p = 1
    # Calculate the probability of a variable taking the same value
    # across all blocks/subpatterns where that variable appears.
    joint_vars = joint_variables(parsed_pattern, parsed_partition)
    #print("joint vars:", joint_vars)
    for var in joint_vars:
        # Select all strongly connected subpatterns containing var
        var_partition = connected_subpatterns_with_var(parsed_partition, var)

        # For each variable, sort the partition so that abstract
        # blocks, relative to var, appear first.
        sorted_var_partition = sort_by_abstraction(var_partition, var)
        #print("sorted_var_partition:", sorted_var_partition)
        # Process blocks starting from j=1 (skip first block)
        # This implements the C++ loop: for (int j = 1; j < (int)var_partition.size(); j++)
        var_prob = process_blocks(sorted_var_partition, var, parsed_db, 1.0, 1)
        # Multiply the probability for this variable
        p *= var_prob
    
    return metta.parse_all(f"{p}")
# ============================
    # Import to metta 
# ============================

@register_atoms(pass_metta=True)
def eq_prob_reg(metta: MeTTa):

    # Define the operation atom with its parameters and function
    generateVariable = OperationAtom('eq-prob-func', lambda partition, pattern, db:  eq_prob(metta, partition, pattern, db),
                                   ['Expression', 'Expression',"Atom",'Expression'], unwrap=False)
    return {
        r"eq-prob-func": generateVariable
    }