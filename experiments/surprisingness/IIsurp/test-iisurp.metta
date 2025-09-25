! (register-module! ../../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:binomialMetta)
! (import! &self experiments:utils:beta-dist)

! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
; ! (import! &self experiments:utils:customType)
; ! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:surprisingness:IIsurp:IIsurp-old)
! (import! &self experiments:surprisingness:IIsurp:Sub-conc-prob)

! (import! &db experiments:data:super-sub-iisurp:iisurp_kb)
 ! (import! &dbc experiments:data:nested_coupled:mock_coupled)
 ! (import! &dbn experiments:data:nested_coupled:true_nested)







; !( IIsurp-old (, (Inheritance $x child) (Inheritance $x student) (Inheritance $x gamer)) &db False)

!(get-prob-func human &db (Inheritance $x child) ( (Inheritance $x child) (Inheritance $x student) (Inheritance $x gamer)) 4495 )

; !(pow-math 0.5 0.5)
;  !(coherence human &db Inheritance)

; !(pairwise-coherence-list (Liam Mia Noah Ava Zoe Leo Aria Max Ella Omar Abe Allen Bob Carlos David Ethan  ) () 0 16 &db Inheritance)

; !(coherence human &db Inheritance)

; !(fun ((Liam Noah) (Mia Noah) (Noah Noah) (Liam Mia) (Mia Mia) (Noah Mia) (Liam Liam) (Mia Liam) (Noah Liam)) ())

; !(cart-helper-set 2 (Liam Mia Noah Ava Zoe Leo Aria Max Ella Omar Abe Allen Bob Carlos David Ethan Frank George Theo Victor Hannah Irene Julia Olivia Priya Rosa Uma Nora Sam Quinn Kai Wren Tessa OmarA Yuki) ())


; !(collapse (match &db (Inheritance $x human) $x))
