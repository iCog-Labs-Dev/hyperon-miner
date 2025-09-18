!(register-module! ../../experiments)
; !(register-module!  ../../../../chaining)

; !(import! &self experiments:miner:freq-miner)
!(import! &self experiments:rules:conj-exp)
!(import! &self experiments:rules:freq-pat)
!(import! &self experiments:rules:use-python)
!(import! &self experiments:utils:variable-combinations)

! (import! &self experiments:utils:common-utils)
! (import! &self experiments:rules:build-specialization)
! (import! &self experiments:rules:conjunction-expansion)

; ! (import! &dbspace experiments:data:ugly_man_sodaDrinker)
! (import! &dbspace experiments:data:small-ugly)
; ! (import! &dbspace experiments:data:sample-data)



;; config kb : load the chainer , rules , system-proofs ....
; !(import! &self  chaining:dtl:backward:curried)
!(import! &temp   experiments:miner:freq-miner-rules)
!(import! &self  experiments:miner:system-proofs)

;;create new space for kb
!(bind! &kb (new-space)) 
!(bind! &db (new-space)) 

!(let ($link $x $y) (get-atoms &dbspace) (add-atom &db ($link $x $y)))



;;copy atoms from temp space to kb to remove unnecessary atoms from the space
!(let $atoms  (get-atoms &temp) (add-reduct &kb $atoms) )

(: -> (-> Atom Atom Type))

(= (init-miner $db $kb $ms $surp $db-ratio)
    (         let* (  
                 (() (add-atom $kb (: msT (ms-threshold $ms))))
                 (() (add-atom $kb (: dbref (db-ref $db))))
                 (() (add-atom $kb (: dbr (db-ratio $db-ratio))))
                 (() (add-atom $kb (surp-mod $surp)))
                 (() (add-atom $kb (db-ratio $db-ratio)))
                 (() (add-atom $kb (db-size (db_size $db))))
                 (() (add-atom &self (kb-ref $kb)))
                 (() (add-atom $kb (db-ref $db)))
                )()))
-----------------------------------------------------------------
;; abstract patterns 
-----------------------------------------------------------------
;; extracts abstract patterns from the db
(= (abstract $depth $kb)
   (let* (
    (() (println! "==== Extracting abstract patterns =====") )
    ($res (syn $kb $depth (: $prf (AbstractPattern $x)))) 
    ($rem (remove-atom $kb $res))
    ($add (add-reduct $kb $res))
    ) 
    $res
    )
)

--------------------------------------------------
;; specialization
--------------------------------------------------
;;Generates the specializations of the abstract patterns
(= (specialization $depth $kb)

   (let* (
    (() (println! "==== Generating specializations  =====") )
    ($resy (syn $kb $depth (: $prf (specializationOf $aptrn $sptrn))))
    ($rem (remove-atom $kb $resy))
    ($add (add-atom $kb $resy))
    ) 
    $resy
    )
) 

--------------------------------------------------
;; support 
-------------------------------------------------
;; Annotate the support of specialized patterns
(= (support $depth $kb)
   (let* (
    (() (println! "==== Computing support =====") )
    ($res (syn $kb $depth (: $prf (supportOf $sptrn $cnt))))
    ($rem (remove-atom $kb $res))
    ($add (add-reduct $kb $res))
    ) 
    $res
    )
)

-----------------------------------------------
;; candidate
-----------------------------------------------
;; select patterns with min-sup as candidate pattern
(= (candidate $depth $kb)
   (let*(
    (() (println! "==== Selecting Candidate Patterns =====") )
    ($res (syn $kb $depth (: $prf (candidatePattern $x $cnt)))) 
    ($rem2 (remove-atom $kb $res))
    ($add2 (add-reduct $kb $res))
    )
    $res
    )
)

---------------------------------------------------
;; conjunction
---------------------------------------------------
;; expand conjunctions for as many clauses as needed
(= (conjunction $depth $kb $rec $maxrec) 
    (let*
        (
        (() (println! "==== Doing conjunction =====") )
        ($prevrec (- $rec 1))
        ($re (collapse (remove-atom $kb (: maxClauses (maxClauses $prevrec)))))
        ($add (collapse (add-atom $kb (: maxClauses (maxClauses $rec)))))
        ($res (collapse (syn $kb $depth (: $prf (candidatePattern $ptrn $cnt)))))
        ($red (collapse (add-reduct $kb (superpose $res))))
        )
    (if (> (+ $rec 1) $maxrec) $red (conjunction $depth $kb (+ $rec 1) $maxrec))
    )
)

------------------------------------------------------
;; format
------------------------------------------------------
;;format the patterns and add them to the knowledge base with their support
(= (format $depth $kb)
   (collapse 
   (let*(
    (() (println! "==== Formatting patterns  =====") )
    ($res (syn $kb $depth (: $prf (hasSupport $ptrn $cnt)))) 
    ($rem2 (remove-atom $kb $res))
    ($add2 (add-reduct $kb $res))
    )
    $res
    ))
)


--------------------------------------------------
;; frequent-miner
--------------------------------------------------
;; pipeline for the frequent patter mining 
(= (frequent-miner $db $kb $number-of-conjuct True) 
( 
     let*  ( 
        (() (println! "==== Frequent Miner Started =====") )
         ($re (collapse (abstract (fromNumber 5) $kb)))
         ($res (collapse (specialization (fromNumber 5) $kb)))
         ($resu (collapse (support (fromNumber 3) $kb)))
         ($atom (: candidate (-> (minsup $ptrn $cnt) (-> (replace_variables $ptrn) (candidatePattern $ptrn $cnt)))))
         ($add (add-atom $kb $atom))
         ($result (collapse (candidate (fromNumber 5) $kb)))
         ($rem (remove-atom $kb $atom))
         ($results (collapse (conjunction (fromNumber 18) $kb 1 (- $number-of-conjuct 1))))
         ($resultf (collapse (format (fromNumber 4) $kb)))
      ) ()
)
)
(= (frequent-miner $db $kb $number-of-conjuct False) 
( 
     let*  ( 
        (() (println! "==== Frequent Miner Started =====") )
         ($re (collapse (abstract (fromNumber 5) $kb)))
         ($res (collapse (specialization (fromNumber 7) $kb)))
         ($resu (collapse (support (fromNumber 3) $kb)))
         ($atom (: candidate (-> (minsup $ptrn $cnt) (-> (replace_variables $ptrn) (candidatePattern $ptrn $cnt)))))
         ($add (add-atom $kb $atom))
         ($result (collapse (candidate (fromNumber 5) $kb)))
         ($rem (remove-atom $kb $atom))
      ) ()
)
)

(=(min-sup) 4)
(=(surp-mode ) nisurp-old)
(=(db-ratio) 0.5)

(= (cog-mine $db $kb $ms $surp $db-ratio $limit) (
    let* (
             (() (init-miner $db $kb $ms $surp $db-ratio)) 
             (() (frequent-miner $db $kb $limit True))
            ;  (() (init-surp $kb &res $surp))           
    )
    ;; return all atoms in &res
    ; (match &res $x $x)
    (match $kb $x $x)
))
; (= (init-miner $db $kb $ms)
;     (         let* (  
;                  (() (add-atom $kb (: msT (ms-threshold $ms))))
;                  (() (add-atom $kb (: dbref (db-ref $db))))
;                  (() (add-atom $kb (: dbr (db-ratio $db-ratio))))
;                  (() (add-atom &self (kb-ref $kb)))
;                  (() (add-atom $kb (db-ref $db)))
;                 )()))




; (=(min-sup) 2)
; (=(surp-mode) jsdsurp)
; (=(db-ratio) 0.5)
! (cog-mine &db &kb (min-sup) (surp-mode) (db-ratio) 3)
(= (test_ABAB $db $kb $ms $limit $cnjexp)
    (let*(
        (() (init-miner $db $kb $ms))
        ($dbadd1 (add-atom $db (Inheritance A B)))
        ($dbadd2 (add-atom $db (Inheritance B C)))
        ($dbadd5 (add-atom $db (Implication (Inheritance A B) (Inheritance A B))))
        ($dbadd6 (add-atom $db (Implication (Inheritance B C) (Inheritance B C))))
         ($res (frequent-miner $db $kb $limit $cnjexp))
        ($dbrem1 (remove-atom $db (Inheritance A B)))
        ($dbrem2 (remove-atom $db (Inheritance B C)))
        ($dbrem5 (remove-atom $db (Implication (Inheritance A B) (Inheritance A B))))
        ($dbrem6 (remove-atom $db (Implication (Inheritance B C) (Inheritance B C))))
        ($cnd (match $kb (: $prf (candidatePattern $ptrn $cnt)) $ptrn))
    )
$cnd
    )
)

; !(test_ABAB &db &kb 2 2 False)
















