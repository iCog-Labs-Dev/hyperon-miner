!(register-module! ../../experiments)
!(register-module!  ../../../chaining)

!(import! &self experiments:miner:miner)
!(import! &self experiments:miner:miner-utils)
!(import! &self experiments:rules:conj-exp)
!(import! &self experiments:rules:freq-pat)
!(import! &self experiments:rules:use-python)



;; import utils and rules files 
! (import! &self experiments:rules:isurp)
! (import! &self experiments:rules:isurp-old)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:rules:build-specialization)
! (import! &self experiments:rules:conjunction-expansion)

! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:rules:est-tv)
! (import! &self experiments:rules:emp-tv)
! (import! &self experiments:rules:emp-prob)
! (import! &self experiments:rules:jsd)
! (import! &self experiments:utils:emp-tv-bs)
! (import! &self experiments:utils:bs-utils)
! (import! &self experiments:utils:util-jsd)
; ! (import! &dbspace experiments:data:ugly_man_sodaDrinker)
! (import! &dbspace experiments:data:small-ugly)



;; config kb : load the chainer , rules , system-proofs ....
!(import! &self  chaining:dtl:backward:curried)
!(import! &temp   experiments:miner:miner-rules)
!(import! &self  experiments:miner:system-proofs)

;;create new space for kb
!(bind! &kb (new-space)) 
!(bind! &db (new-space)) 

!(let ($link $x $y) (get-atoms &dbspace) (add-atom &db ($link $x $y)))

; (= (abstract $dbspace $minsup $kb)
;             (let* (
;                     ($linkunique (unique (match $dbspace ($link $x $y) $link)))
;                     ($result (sup-eval $dbspace ($linkunique $z $t) $minsup))
;                 )
;             (if (== $result True)
;                 (superpose (
;                         (remove-atom $kb ((: AbstractPattern (AbstractPattern ($linkunique Z (S Z))))))
;                         (add-atom $kb ((: AbstractPattern (AbstractPattern ($linkunique Z (S Z))))))
;                     ))
;             empty
;         )
; )

; )


;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-atom &kb $atoms) )
;!(chain (get-atoms &temp) $atoms (add-atom &kb $atoms))

; (= (candidate $kb) ( 
;      let*  ( 
;         (() (add-atom $kb (: candidateP  (candidatePattern (Inheritance $x human) ))))
;         (() (add-atom $kb (: candidateP  (candidatePattern (Inheritance $y sodaDrinker) ))))
;         ) ()
; ))


;; define parameters 
(=(min-sup) 6)
(=(surp-mode ) jsdsurp)
(=(db-ratio) 0.5)
; !(add-atom &kb (: msT (ms-threshold 2)))
; !(add-atom &kb (: SUP (supportOf $ptrn 5)))

!(init-miner &db &kb (min-sup) (surp-mode) (db-ratio))
; !(candidate &kb)

; !(syn &kb Z (: $prf (replace_index (Inheritance Z (S Z)))))
; !(collapse (abstract (fromNumber 4) &kb))
; !(collapse (specialization (fromNumber 3) &kb))
; !(collapse (support (fromNumber 4) &kb))
; !(collapse (candidate (fromNumber 5) &kb))
; !(collapse (conjunction (fromNumber 5) &kb))

; !(abstract &db (min-sup) &kb)

; !(match &db (,(Inheritance $x sodaDrinker) (Inheritance $x ugly)) (,(Inheritance $x sodaDrinker) (Inheritance $x ugly)))
;; test the cog-miner
;; without sorting 
; ! (cog-mine &db &kb (min-sup) (surp-mode) (db-ratio))

;; with sorting 
;! (let $res (collapse (cog-mine &db &kb (min-sup) (surp-mode) (db-ratio))) (surp-sorting $res))

; !(syn &kb Z (: $prf (equals 2 2)))

!(add-atom &kb (: candidate (candidatePattern (Inheritance Z ugly))))
!(add-atom &kb (: candidate (candidatePattern (Inheritance Z sodaDrinker))))
; !(add-atom &kb (: candidate (candidatePattern (Inheritance Allen Z))))
; !(add-atom &kb (: candidate (candidatePattern (Inheritance Cason Z))))



; !(abstract (fromNumber 4) &kb)
; !(specialization (fromNumber 3) &kb)
; !(support (fromNumber 4) &kb)
; !(candidate (fromNumber 5) &kb)
!(conjunction (fromNumber 10) &kb 1 2)
; !(conjunction-clean (fromNumber 4) &kb)

!(match &kb $x $x)
; !(syn &kb Z (: $prf (clause_count (, (,(Inheritance Z sodaDrinker) (Inheritance Z ugly)) (Inheritance Z ugly)) $cnt)))








;;Dummies

;!(match &kb $x $x)

;!(get-metatype (@doc random-int (@desc "Returns random int number from range defined by two numbers (first and second argument)")))

;;add the rb ref to the kb 
;;!(add-atom &kb (rb-ref &rb))





;! (let $res (collapse (cog-mine &db &kb (min-sup) (surp-mode) (db-ratio))) $res)

(: Grounded Type)
(: check Grounded)
(=(check $v) (> $v 3))

;!(chain (> 2 3) $v (not $v))
;! (not (== 2 3))
;!(filter-atom (1 2 2 4) $v (chain  (eval (check $v)) $x  (not $x))) will give (3 4)
;!(chain   $x  (not $x))

;!(filter-atom (1 2 3 4) $v (eval (> $v 3)))

;!(eval (not (eval (check 4))))

;!(get-type check)


