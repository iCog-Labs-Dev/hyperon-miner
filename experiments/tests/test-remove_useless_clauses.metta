!(import! &self ../utils/index_to_var)
!(import! &self ../utils/common-utils)
!(import! &self ../utils/blk-abstractness)
!(import! &self ../utils/partition-metta)
!(import! &self ../frequent-pattern-miner/conjunction-expansion)
!(import! &self ../utils/remove_useless_clauses)


!(assertEqual (remove_useless_clauses ((Inheritance $x ugly) (Inheritance Allen $y) (Inheritance $x $y))) ((Inheritance $x ugly) (Inheritance Allen $y)))
!(assertEqual (remove_useless_clauses ((Inheritance $x $y) (Inheritance $y $z) (Inheritance $z $w))) ((Inheritance $x $y) (Inheritance $y $z) (Inheritance $z $w)))
!(assertEqual (remove_useless_clauses ((Inheritance $x $y) (Inheritance $y $z) (Inheritance z w))) ((Inheritance $x $y) (Inheritance $y $z)))
!(assertEqual (remove_useless_clauses ((Inheritance $x (Inheritance $y $z)) (Inheritance $y $z) (Inheritance z w))) ((Inheritance $x (Inheritance $y $z))))
