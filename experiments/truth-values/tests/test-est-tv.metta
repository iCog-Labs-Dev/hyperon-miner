! (register-module! ../../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
; ! (import! &self experiments:utils:customType)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:truth-values:emp-tv)
! (import! &kb experiments:data:ugly_man_sodaDrinker)

! (bind! square (py-atom numpy.square (-> Number Number)))



!(do-ji-tv-est  &kb (,(Inheritance $x ugly) (Inheritance $x man) (Inheritance $x sodaDrinker)))





    


