! (register-module! ../../experiments)
! (import! &self experiments:utils:remove_useless_clauses)
! (import! &self experiments:frequent-pattern-miner:conjunction-expansion)
! (import! &self experiments:frequent-pattern-miner:use-python)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:frequent-pattern-miner:freq-pat)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:gen_partition)


!(assertEqual (remove_useless_clauses ((Inheritance $x ugly) (Inheritance Allen $y) (Inheritance $x $y))) ((Inheritance $x ugly) (Inheritance Allen $y)))
!(assertEqual (remove_useless_clauses ((Inheritance $x $y) (Inheritance $y $z) (Inheritance $z $w))) ((Inheritance $x $y) (Inheritance $y $z) (Inheritance $z $w)))
!(assertEqual (remove_useless_clauses ((Inheritance $x $y) (Inheritance $y $z) (Inheritance z w))) ((Inheritance $x $y) (Inheritance $y $z)))
!(assertEqual (remove_useless_clauses ((Inheritance $x (Inheritance $y $z)) (Inheritance $y $z) (Inheritance z w))) ((Inheritance $x (Inheritance $y $z))))


