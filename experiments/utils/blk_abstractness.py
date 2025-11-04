
"""
Block Abstractness Utilities (Python port of MeTTa definitions)

This script provides tools to:
- Replace variables in patterns with constants (@eyob by default).
- Check if variables exist inside patterns.
- Perform unification of pattern structures.
- Compare two blocks/patterns to decide if one is more abstract than the other.
- Handle simple set/membership utilities.

September 2025
"""

from hyperon import MeTTa
from hyperon.atoms import ExpressionAtom

# -------------------------------
# Variable replacement utilities
# -------------------------------

def erase(pattern: ExpressionAtom, var: str, metta: MeTTa) -> ExpressionAtom:
    """
    Replace variable `var` with constant '@eyob' in the pattern.
    """
    sexpr = str(pattern).replace(var, "@eyob")
    parsed = metta.parse_all(sexpr)
    return parsed[0] if parsed else pattern

def is_blk_more_abstract(l_blk: ExpressionAtom, r_blk: ExpressionAtom, var: str, metta: MeTTa) -> bool:
    """
    Returns True if l_blk is more abstract than r_blk w.r.t variable var.
    Uses Hyperon's unify instead of manual unification.
    """
    
    if metta is None:
        raise ValueError("A MeTTa instance must be provided")

    # Replace var with constant in both patterns
    l_ground = erase(l_blk, var, metta)
    r_ground = erase(r_blk, var, metta)

    # Attempt unification using Hyperon
    try:
        return metta.unify(l_ground, r_ground)
    except Exception:
        return False


# def erase(pattern: ExpressionAtom, var: str, metta: MeTTa = None) -> ExpressionAtom:
#     """Replace `var` with constant '@eyob' inside pattern."""
#     return replace_var(pattern, var, "@eyob", metta)

def replace_var(expr: ExpressionAtom, var: str, replacement: str, metta: MeTTa = None) -> ExpressionAtom:
    """Replace all occurrences of `var` in `expr` with `replacement`."""
    return collapse(replace_var_exp(superpose(expr), var, replacement, metta))
    
def replace_var_exp(exp: ExpressionAtom, var: str, replacement: str, metta: MeTTa = None) -> ExpressionAtom:
    """Recursive replacement of variables in an ExpressionAtom."""
    if not isinstance(exp, ExpressionAtom):
        return sub_var(exp, var, replacement)

    children = exp.get_children()
    replaced_children = [
        replace_var_exp(c, var, replacement, metta) if isinstance(c, ExpressionAtom)
        else sub_var(c, var, replacement)
        for c in children
    ]

    if metta:
        # rebuild ExpressionAtom via s-expression parsing
        sexpr = "(" + " ".join(str(c) for c in replaced_children) + ")"
        parsed = metta.parse_all(sexpr)
        return parsed[0] if parsed else exp
    return exp

def sub_var(atom, var: str, replacement: str):
    """Replace atom if it exactly matches var, else return unchanged."""
    return replacement if str(atom) == var else atom

def superpose(expr: ExpressionAtom) -> ExpressionAtom:
    return expr  # placeholder

def collapse(expr: ExpressionAtom) -> ExpressionAtom:
    return expr  # placeholder

# -------------------------------
# Variable existence
# -------------------------------

def var_exist_exp(exp: ExpressionAtom, var: str) -> bool:
    """Check if var exists directly in exp (single expression)."""
    return any(str(c) == var for c in exp.get_children())

def is_var_exist(exp_list, var: str) -> bool:
    """Check if var exists anywhere in a pattern (list of ExpressionAtom)."""
    if not exp_list: return False
    if var_exist_exp(exp_list[0], var): return True
    return is_var_exist(exp_list[1:], var)

# -------------------------------
# Unification
# -------------------------------

def can_unify(l_body, r_body) -> bool:
    """Check if two ExpressionAtom lists can unify."""
    if len(l_body) != len(r_body): return False
    if not l_body and not r_body: return True
    return can_unify_expr(l_body[0], r_body[0]) and can_unify(l_body[1:], r_body[1:])

def can_unify_expr(left: ExpressionAtom, right: ExpressionAtom) -> bool:
    """Check unification of two ExpressionAtoms with functor + arguments."""
    left_children = left.get_children()
    right_children = right.get_children()
    if left_children[0] != right_children[0]: return False
    return can_unify_ground(left_children[1], right_children[1]) and \
           can_unify_ground(left_children[2], right_children[2])

def can_unify_ground(g1, g2) -> bool:
    """Ground unification: exact match or variable."""
    return g1 == g2 or is_variable(g1) or is_variable(g2)

def is_variable(atom) -> bool:
    """Check if atom string is a variable (starts with $)."""
    return str(atom).startswith("$")

def validate_unification(left, right, metta: MeTTa = None) -> bool:
    """Replaces variables in right body and checks unification with left."""
    indexed = replace_var(right, "$x", "@eyob", metta)
    return can_unify(left, indexed)

# -------------------------------
# Abstractness
# -------------------------------

def is_blk_syntax_more_abstract(l_pat, r_pat, var: str = None, metta: MeTTa = None) -> bool:
    """
    Check if left pattern is more abstract than right w.r.t var.
    Both l_pat and r_pat are ExpressionAtom instances or lists of them.
    """
    if not (is_var_exist([l_pat], var) and is_var_exist([r_pat], var)):
        return False
    l_body, r_body = erase(l_pat, var, metta), erase(r_pat, var, metta)
    return can_unify([l_body], [r_body]) and validate_unification([l_body], [r_body], metta)

# -------------------------------
# Membership / Set utils
# -------------------------------

def is_membership(elem, lst):
    """Check if element exists in list."""
    return elem in lst

def merge_list(l1, l2):
    """Merge two lists and remove duplicates."""
    return unique_list(l1 + l2)

def unique_list(lst):
    """Return list with duplicates removed (preserves order)."""
    seen, out = set(), []
    for x in lst:
        if x not in seen:
            seen.add(x)
            out.append(x)
    return out

# -------------------------------
# Demo
# -------------------------------

def main():
    print("=== Demo: Pattern Abstractness ===")
    metta = MeTTa()

    # Example patterns
    left = metta.parse_all("((Man $x Eyob) (Student $x Newyork))")[0]
    right = metta.parse_all("((Man John Eyob) (Student John Newyork))")[0]

    # Replace variable in left
    replaced = erase(left, "$x", metta)
    print("After erase:", replaced)

    # Abstractness check
    print("Is left more abstract than right?",
          is_blk_syntax_more_abstract(left, right, "$x", metta))

    # Membership/merge utils demo
    print("Membership test:", is_membership("a", ["a", "b", "c"]))
    print("Merged unique list:", merge_list(["a", "b"], ["b", "c", "d"]))

    
    right = metta.parse_all("((Man $x Eyob) (Student $x Newyork))")[0]
    left = metta.parse_all("((Man John Eyob) (Student John Newyork))")[0]

    print("Is left more abstract than right?",
          is_blk_more_abstract(left, right, "$x", metta))

if __name__ == "__main__":
    main()
