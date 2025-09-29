from eq_prob_update import *


# l_blk = [['Human', '$x', 'assd'], ["Human", "$x", "$y"]]
# r_blk = [['Human', '$x', '$s'],["Human", "$x", "$y"]]
# var = "$x"

# pattern = ["Human", "$x", "$y", "Likes", "$x", "$z"]
partition = [
    [["Human", "$x", "$y"], ["Smart", "$y"]],      # Block 1: $x, $y
    [["Human", "$x", "$z"]],      # Block 2: $x, $z  
    [["Human", "$y"]]             # Block 3: $y
]

# print("is Left Block more abstract:", is_blk_more_abstract(l_blk, r_blk,var))
# print("Sorted by abstraction:", sort_by_abstraction(l_blk + r_blk, var)) 
# print("The Joint Variable: ", joint_variables(pattern, partition))
print(connected_subpatterns_with_var(partition, "$x"))