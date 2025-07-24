! (register-module! ../../../../hyperon-miner)
! (import! &self hyperon-miner:experiments:rules:candidate-patterns)
! (import! &self hyperon-miner:experiments:utils:common-utils)
! (import! &self hyperon-miner:experiments:rules:freq-pat)
! (bind! &specspace (new-space))
! (bind! &cndpspace (new-space))



 
! (add-reduct &self (= (get-space) (new-space)))
! (add-atom (get-space) (Inheritance Abe human))
! (add-atom (get-space) (Inheritance Rio human))
! (add-atom (get-space) (Inheritance Bob human))
! (add-atom (get-space) (Inheritance Mike human))

!(add-reduct &specspace (SpecializationOf (Inheritance Z human) (Inheritance Z (S Z))))
!(add-atom &specspace (SpecializationOf (Inheritance Rio Z) (Inheritance Z (S Z))))
!(add-atom &specspace (SpecializationOf (Inheritance Abe Z) (Inheritance Z (S Z))))
!(add-atom &specspace (SpecializationOf (Inheritance Mike Z) (Inheritance Z (S Z))))

!(candidatePattern (get-space) &specspace 2 &cndpspace)

!(assertEqual (match &cndpspace $x $x) 
    (CandidatePattern (Inheritance Z human)))


