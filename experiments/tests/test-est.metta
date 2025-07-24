! (register-module! ../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:rules:est-tv)
! (import! &self experiments:rules:emp-tv)
! (import! &kb experiments:data:ugly_man_sodaDrinker)

! (bind! square (py-atom numpy.square (-> Number Number)))



!(do-ji-tv-est  &db (,(Inheritance $x sodaDrinker) (Inheritance $x human) (Inheritance $x woman)) $emp)





    


