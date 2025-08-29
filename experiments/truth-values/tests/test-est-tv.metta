! (register-module! ../../../../hyperon-miner/experiments)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:emp-prob)
! (import! &self experiments:truth-values:emp-tv)
! (import! &db experiments:data:ugly_man_sodaDrinker)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:customType)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:truth-values:est-tv)





(assertEqual (ji-est-tv &db 60 (,(Inheritance $x ugly) (Inheritance $x man) (Inheritance $x sodaDrinker)) 
   (
(((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly))) 
(((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) 
(((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) 
(((Inheritance $x man)) ((Inheritance $x sodaDrinker)) ((Inheritance $x ugly)))
  ) 
)

((STV 0.0 0.0001979229795046239) 
 (STV 0.0 0.0001979229795046239) 
 (STV 0.0 0.0001979229795046239) 
 (STV 4.6296296296296274e-5 0.0006976744186046506))
)

(assertEqual 
 (pro_prob_without_joint &db (((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly))))
 (0 0.001979229795046239)
)

(assertEqual 
   (joint-variables (,(Inheritance $x ugly) (Inheritance $x man) (Inheritance $x sodaDrinker)) (((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly))))
   ($x)
)

!(prob-with-joint &db 60 (((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly))) ($x) 1)