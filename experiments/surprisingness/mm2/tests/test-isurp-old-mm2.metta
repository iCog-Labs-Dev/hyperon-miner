;; ── TEST CASE 1: Basic Dataset (ugly_man_sodaDrinker) ─────────────────────
;; Input facts:
(INPUT SURP-MODE isurp-old)
(INPUT NORMALIZATION True)

;; The zero in the input tuple is ignored; the full-pattern support is counted from the DB.
(INPUT INDEXED-PATTERN (((Inheritance (var 0) man)
                         (Inheritance (var 0) ugly)
                         (Inheritance (var 0) sodaDrinker)) 0))


;; Runner loads 60 DB-FACT rows. Expected pattern support: 5.
;; Expected denominator: C(60,3)=34220.
