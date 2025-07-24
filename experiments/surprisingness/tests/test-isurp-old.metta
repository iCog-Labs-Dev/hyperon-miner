! (register-module! ../../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:binomialMetta)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:surprisingness:isurp-old)
! (import! &db experiments:data:ugly_man_sodaDrinker)







;;;;;;;;;;;
;; Tests ;;
;;;;;;;;;;;
;; Test old normalized I-Surprisingess for the ugly male soda drinker
!(isurp-old (, (Inheritance $x human) (Inheritance $x sodaDrinker) (Inheritance $x man)) &db  True)
;!(isurp-old (,(Inheritance $x man) (Inheritance $x ugly)) &db  True)


