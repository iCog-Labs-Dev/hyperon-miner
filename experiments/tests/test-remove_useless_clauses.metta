! (register-module! ../../experiments)
! (import! &self experiments:utils:remove_useless_clauses)
! (import! &self experiments:rules:conjunction-expansion)
! (import! &self experiments:rules:use-python)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:rules:freq-pat)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:gen_partition)


!(assertEqual (remove_useless_clauses ((Inheritance $x ugly) (Inheritance Allen $y) (Inheritance $x $y))) ((Inheritance $x ugly) (Inheritance Allen $y)))
!(assertEqual (remove_useless_clauses ((Inheritance $x $y) (Inheritance $y $z) (Inheritance $z $w))) ((Inheritance $x $y) (Inheritance $y $z) (Inheritance $z $w)))
!(assertEqual (remove_useless_clauses ((Inheritance $x $y) (Inheritance $y $z) (Inheritance z w))) ((Inheritance $x $y) (Inheritance $y $z)))
!(assertEqual (remove_useless_clauses ((Inheritance $x (Inheritance $y $z)) (Inheritance $y $z) (Inheritance z w))) ((Inheritance $x (Inheritance $y $z))))
!(assertEqual (is_more_abstract_for_each_var (Inheritance $y $z) ((Inheritance $x $y) (Inheritance $z $w))) False)

