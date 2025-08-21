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








!(isurp (, (Inheritance $x man)
   (Inheritance $x ugly)
   (Inheritance $x sodaDrinker)) &db False 1)

; !(ji_prob_est_interval (, (Inheritance $x man)
;    (Inheritance $x ugly)
;    (Inheritance $x sodaDrinker)) &db 1)

; !(do-ji-prob ((((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man) (Inheritance $x ugly)) ((Inheritance $x sodaDrinker))) (((Inheritance $x man)) ((Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (((Inheritance $x man)) ((Inheritance $x sodaDrinker) (Inheritance $x ugly)))) (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) $db 1)

; !(generet-partition-without-pattern (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)))

; ((ji-prob-est (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) &db 1) )
; !(eq-prob (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) $db )

; (assertEqual (emp-prob-pbs (, (Inheritance $x man)   (Inheritance $x ugly)
;    (Inheritance $x sodaDrinker)) &db 3.858024691358025e-6 1) 2.3148148148148147e-5)



; !(emp-prob (, (Inheritance $x man)   (Inheritance $x ugly) (Inheritance $x sodaDrinker)) db)

; !(sup-num $db (, (Inheritance $x man)   (Inheritance $x ugly) (Inheritance $x sodaDrinker)))


; !(joint-variables (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))))

; !(get-var (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker)))

; !(filter-joint-vars ($x) (((Inheritance $x man) (Inheritance $x sodaDrinker)) ((Inheritance $x ugly))))


; !(let* (($var (car-atom ($x)))) (println "Variable: " $var))