
! (register-module! ../../../hyperon-miner/experiments)

! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:emp-prob)
! (import! &self experiments:truth-values:emp-tv)
! (import! &self experiments:truth-values:est-tv)
! (import! &self experiments:truth-values:emp-tv)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:miner-utils)
! (import! &kb experiments:data:ugly_man_sodaDrinker)



; ===============================
; do_emp_tv Validation 1
; ===============================
(assertEqual (do_emp_tv
   (,
      (Inheritance $x ugly)
      (Inheritance $x man)
      (Inheritance $x sodaDrinker)
   )
   &kb        ; knowledge base: ugly-man-soda-drinker
   1          ; database ratio
) (EMPTV 2.3148148148148147e-5, 0.09963099630996311))

; ===============================
; Parameters Info
; ===============================
; Pattern:
;   (, (Inheritance $x ugly)
;       (Inheritance $x man)
;       (Inheritance $x sodaDrinker))

; Corpus:
;   &kb -> ugly-man-soda-drinker

; Database Ratio: 1

; ===============================
; Results
; ===============================
; Our implementation (Hyperon do_emp_tv result with the above parameters): 
;   EMPTV (2.3148148148148147e-5, 0.09963099630996311)
;
; OpenCog miner implementation (do_emp_tv result with the above parameters): 
;   STV (2.31481e-05, 0.099631)




; ===============================
; do_emp_tv Validation 2
; ===============================
(assertEqual (do_emp_tv
   (,
      (Inheritance $x ugly)
      (Inheritance $x man)
   )
   &kb        ; knowledge base: ugly-man-soda-drinker
   1          ; database ratio
) (EMPTV 0.001388888888888889, 0.08181818181818183))

; ===============================
; Parameters Info
; ===============================
; Pattern:
;   (, (Inheritance $x ugly)
;       (Inheritance $x man))

; Corpus:
;   &kb -> ugly-man-soda-drinker

; Database Ratio: 1

; ===============================
; Results
; ===============================
; Our implementation (Hyperon do_emp_tv result with the above parameters): 
;   EMPTV (0.001388888888888889, 0.08181818181818183)
;
; OpenCog miner implementation (do_emp_tv result with the above parameters): 
;   STV (0.00138889, 0.0818182)






; ===============================
; do_emp_tv Validation 3
; ===============================
(do_emp_tv
   (,
      (Inheritance $x ugly)
      (Inheritance $x woman)
   )
   &db        ; knowledge base: ugly-man-soda-drinker
   0.02          ; database ratio
)

; ===============================
; Parameters Info
; ===============================
; Pattern:
;   (, (Inheritance $x ugly)
;       (Inheritance $x woman))

; Corpus:
;   &db -> ugly-man-soda-drinker

; Database Ratio: 0.02

; ===============================
; Results
; ===============================
; Our implementation (Hyperon do_emp_tv result with the above parameters): 
;   stv 0 0.0001249843769528809
;
; OpenCog miner implementation (do_emp_tv result with the above parameters): 
;   (stv 0 0.000124984)





; ===============================
; do_emp_tv Validation 4
; ===============================
!(do_emp_tv
   (,
      (Inheritance $x ugly)
      (Inheritance $x woman)
      (Inheritance $x sodaDrinker)
   )
   &db        ; knowledge base: ugly-man-soda-drinker
   0.02          ; database ratio
)

; ===============================
; Parameters Info
; ===============================
; Pattern:
;   (, (Inheritance $x ugly)
;       (Inheritance $x woman)
;       (Inheritance $x sodaDrinker))

; Corpus:
;   &db -> ugly-man-soda-drinker

; Database Ratio: 0.02

; ===============================
; Results
; ===============================
; Our implementation (Hyperon do_emp_tv result with the above parameters): 
;   (stv 0.0 0.09963099630996311)
;
; OpenCog miner implementation (do_emp_tv result with the above parameters): 
;   (stv 0 0.099631)