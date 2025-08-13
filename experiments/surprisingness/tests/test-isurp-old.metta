! (register-module! ../../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:binomialMetta)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:support_helper)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:surprisingness:isurp-old)

! (import! &db experiments:data:ugly_man_sodaDrinker)






; ! (add-reduct &self (= (get-space) (new-space)))

; ! (add-atom (get-space) (Inheritance A B))
; ! (add-atom (get-space) (Inheritance B C))
; ! (add-atom (get-space) (Inheritance D E))
; ! (add-atom (get-space) (Inheritance E F))


;;;;;;;;;;;
;; Tests ;;
;;;;;;;;;;;
; !(assertEqual (isurp-old (, $x $y) (get-space)  False) 1)
; !(assertEqual (isurp-old (, (Inheritance $x man)
;    (Inheritance $x ugly)
;    (Inheritance $x sodaDrinker)) &db False) 0.00014607068574401343)

!(assertEqual (isurp-old (, (Inheritance $x man)
   (Inheritance $x ugly)
   (Inheritance $x sodaDrinker)) &db True) 0.999707773232028)




