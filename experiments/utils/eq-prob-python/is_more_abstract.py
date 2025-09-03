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
