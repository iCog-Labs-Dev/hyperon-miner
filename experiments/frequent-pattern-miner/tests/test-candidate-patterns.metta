 !(import! &self ../../utils/index_to_var)
 !(import! &self ../../utils/common-utils)
!(import! &self ../../utils/mork-interface)
 !(import! &self ../candidate-patterns)


!(add-atom-custom &dbspace (Inheritance Abe human))
!(add-atom-custom &dbspace (Inheritance Rio human))
!(add-atom-custom &dbspace (Inheritance Bob human))
!(add-atom-custom &dbspace (Inheritance Mike human))

!(add-atom-custom &specspace (SpecializationOf (Inheritance Z human) (Inheritance Z (S Z))))
!(add-atom-custom &specspace (SpecializationOf (Inheritance Rio Z) (Inheritance Z (S Z))))
!(add-atom-custom &specspace (SpecializationOf (Inheritance Abe Z) (Inheritance Z (S Z))))
!(add-atom-custom &specspace (SpecializationOf (Inheritance Mike Z) (Inheritance Z (S Z))))

!(candidatePattern &dbspace &specspace 2 &cndpspace)

!(assertEqual (match-custom &cndpspace $x $x) 
    (CandidatePattern (Inheritance Z human) 4))


