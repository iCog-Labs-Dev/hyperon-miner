from itertools import combinations
import copy
from hyperon import MeTTa

metta = MeTTa()

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
    print("code:", code)
    result = metta.run(code)
    print("result:", result)
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
    print("indexed_right_body:",indexed_right_body)
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

# ============================
    # Import to metta 
# # ============================
