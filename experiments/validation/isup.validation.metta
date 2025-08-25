; ===============================
; Module & Utility Imports
; ===============================
!(register-module! ../../../hyperon-miner/experiments)

! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)

! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:surp-utils)

! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:emp-prob)

! (import! &self experiments:truth-values:emp-tv)

! (import! &db experiments:data:ugly_man_sodaDrinker)



; ===============================
; isurp Validation 1
; ===============================
!(isurp 
   (,
      (Inheritance $x man)
      (Inheritance $x ugly)
      (Inheritance $x sodaDrinker)
   )
   &db       ; database: ugly-man-soda-drinker
   False     ; normalization: False
   1         ; database ratio
)

; ===============================
; Parameters Info
; ===============================
; Pattern:
;   (, (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker))

; Corpus:
;   &db -> ugly-man-soda-drinker

; Normalization: False
; Database Ratio: 1


; ===============================
; Results
; ===============================
; Our implementation (isurp result with the above parameters): 1.92901e-05
; OpenCog miner implementation (isurp result with the above parameters):  1.92901e-05

 

; ===============================
; isurp Validation 2
; ===============================
!(isurp 
   (,
      (Inheritance $x man)
      (Inheritance $x ugly)
      (Inheritance $x sodaDrinker)
   )
   &db       ; database: ugly-man-soda-drinker
   True     ; normalization: True
   1         ; database ratio
)

; ===============================
; Parameters Info
; ===============================
; Pattern:
;   (, (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker))

; Corpus:
;   &db -> ugly-man-soda-drinker

; Normalization: True
; Database Ratio: 1


; ===============================
; Results
; ===============================
; Our implementation (isurp result with the above parameters): 0.8333333333333334
; OpenCog miner implementation (isurp result with the above parameters):  0.833333

 

; ===============================
; isurp Validation 3
; ===============================
!(isurp 
   (,
      (Inheritance $x man)
      (Inheritance $x ugly)
   )
   &db       ; database: ugly-man-soda-drinker
   False     ; normalization: False
   1         ; database ratio
)

; ===============================
; Parameters Info
; ===============================
; Pattern:
;   (, (Inheritance $x man)
;       (Inheritance $x ugly))
;      

; Corpus:
;   &db -> ugly-man-soda-drinker

; Normalization: False
; Database Ratio: 1


; ===============================
; Results
; ===============================
; Our implementation (isurp result with the above parameters): 0.000925925925925926
; OpenCog miner implementation (isurp result with the above parameters):  0.000925926



