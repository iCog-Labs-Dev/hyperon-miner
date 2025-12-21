 !(import! &self ../../utils/index_to_var)
 !(import! &self ../../utils/common-utils)
 !(import! &self ../candidate-patterns)


!(add-atom &dbspace (Inheritance Abe human))
!(add-atom &dbspace (Inheritance Rio human))
!(add-atom &dbspace (Inheritance Bob human))
!(add-atom &dbspace (Inheritance Mike human))

!(add-atom &specspace (SpecializationOf (Inheritance Z human) (Inheritance Z (S Z))))
!(add-atom &specspace (SpecializationOf (Inheritance Rio Z) (Inheritance Z (S Z))))
!(add-atom &specspace (SpecializationOf (Inheritance Abe Z) (Inheritance Z (S Z))))
!(add-atom &specspace (SpecializationOf (Inheritance Mike Z) (Inheritance Z (S Z))))

!(candidatePattern &dbspace &specspace 2 &cndpspace)

!(assertEqual (match &cndpspace $x $x) 
    (CandidatePattern (Inheritance Z human) 4))


