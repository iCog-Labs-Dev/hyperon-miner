 !(import! &self ../../utils/index_to_var)
 !(import! &self ../../utils/common-utils)
 !(import! &self ../valuation)
 !(import! &self ../shallow-abstractions)
 !(import! &self ../specialization)
 !(import! &self ../candidate)


!(add-atom &dbspace (Inheritance Abe human))
!(add-atom &dbspace (Inheritance Rio human))
!(add-atom &dbspace (Inheritance Bob human))
!(add-atom &dbspace (Inheritance Mike human))

!(candidate-pattern-miner $x &dbspace 2 &cndpspace)
!(assertEqual (collapse (match &cndpspace $x $x)) ((Inheritance Z human) (Inheritance Z (S Z))))


