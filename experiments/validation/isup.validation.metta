; ===============================
; Module & Utility Imports
; ===============================
!(register-module! ../../../hyperon-miner/experiments)

! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:bs-utils)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:eq-prob)
! (import! &self experiments:utils:customType)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:surp-utils)

! (import! &self experiments:surprisingness:isurp)
! (import! &self experiments:surprisingness:emp-prob)

! (import! &self experiments:truth-values:emp-tv)

  ! (import! &db experiments:data:ugly_man_sodaDrinker)
  ;commnet the above and uncommnet the below to work on coupled kb
  
; ! (import! &db experiments:data:nested_coupled:mock_coupled)



; ===============================
; isurp Validation 1
; ===============================
; !(isurp 
;    (,
;       (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker)
;    )
;    &db       ; database: ugly-man-soda-drinker
;    False     ; normalization: False
;    1         ; database ratio
; )
(assertEqual (isurp (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker) ) &db False 0.2) 1.9290123456790123e-5)

 !(assertEqual  (isurp (, (Inheritance (Person $x) man) (Inheritance (Person $x) ugly) (Inheritance (Person $x) sodaDrinker) ) &db False 0.2) 1.9290123456790123e-5)

; !(isurp 
   ; (,
   ;    (Inheritance (Person $x) man)
   ;    (Inheritance (Person $x) ugly)
   ;    (Inheritance (Person $x) sodaDrinker)
   ; )
;    &db       ; database: ugly-man-soda-drinker
;    False     ; normalization: False
;    0.2        ; database ratio
; )

; !(isurp 
;    (,
;       (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker)
;    )
;    &db       ; database: ugly-man-soda-drinker
;    False     ; normalization: False
;    0.2        ; database ratio
; )



; (1.2860082304526748e-6 3.858024691358025e-6 3.858024691358025e-6 3.858024691358025e-6) ;normal

; (3.858024691358025e-6 0.0011574074074074073 3.858024691358025e-6 3.858024691358025e-6) ;coupled

; !(ji-prob-est  (((Inheritance (Person $x) man)) ((Inheritance (Person $x) sodaDrinker)) ((Inheritance (Person $x) ugly))) (, (Inheritance (Person $x) man) (Inheritance (Person $x) ugly) (Inheritance (Person $x) sodaDrinker) ) &db 0.2 )

; !(sort-by-abstraction (((Inheritance (Person $x) man)) ((Inheritance (Person $x) sodaDrinker)) ((Inheritance (Person $x) ugly))) $x)


; !(sort-by-abstraction (((Inheritance (Person $x) man) (Inheritance (Person $x) sodaDrinker))  ((Inheritance (Person $x) ugly))) $x)

; !(connected-subpatterns-with-var (((Inheritance (Person $x) man)) ((Inheritance (Person $x) sodaDrinker)) ((Inheritance (Person $x) ugly))) $x)



; !((ji-prob-est  (((Inheritance $x man)) ((Inheritance $x sodaDrinker)) ((Inheritance $x ugly))) (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker) ) &db 0.2 ))

; !(generet-partition-without-pattern (, (Inheritance $x man) (Inheritance $x ugly) (Inheritance $x sodaDrinker) ))


; ===============================
; Parameters Info
; ===============================
; Pattern:This PR introduces changes to the surprisingness rule base. Based on validation results from the isurp-old implementation, several adjustments were made to ensure consistency and alignment with the functional implementation.

Key Changes

Refactored multiple rules to align with the functional implementation of isurp-old.

Removed dependency on the isurp-old functional implementation.

Added and configured a dedicated test file for validation.
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
; !(isurp 
;    (,
;       (Inheritance $x man)
;       (Inheritance $x ugly)
;       (Inheritance $x sodaDrinker)
;    )
;    &db       ; database: ugly-man-soda-drinker
;    True     ; normalization: True
;    1         ; database ratio
; )

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
; !(isurp 
;    (,
;       (Inheritance $x man)
;       (Inheritance $x ugly)
;    )
;    &db       ; database: ugly-man-soda-drinker
;    False     ; normalization: False
;    1         ; database ratio
; )

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



