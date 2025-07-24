; !(register-module! ../../experiments)

; ; !(import! &self experiments:miner:miner-utils)
; !(import! &self experiments:rules:conj-exp)
; !(import! &self experiments:rules:freq-pat)
; !(import! &self experiments:rules:use-python)
; !(import! &self experiments:utils:variable-combinations)
; ! (import! &self experiments:utils:common-utils)
; ! (import! &self experiments:rules:build-specialization)
; ! (import! &self experiments:rules:conjunction-expansion)

; ; ! (import! &dbspace experiments:data:ugly_man_sodaDrinker)
; ! (import! &dbspace experiments:data:small-ugly)



; ;; config kb : load the chainer , rules , system-proofs ....
; ; !(import! &self  chaining:dtl:backward:curried)
; !(import! &temp  experiments:miner:freq-miner-rules)
; !(import! &self  experiments:miner:system-proofs)

; ;;create new space for kb
; !(bind! &kb (new-space)) 
; !(bind! &db (new-space)) 

; !(let ($link $x $y) (get-atoms &dbspace) (add-atom &db ($link $x $y)))
; !(let $atoms  (get-atoms &temp) (add-atom &kb $atoms) )


; ; !(add-atom &kb (: candidate (candidatePattern (Inheritance Z ugly))))
; ; ; !(add-atom &kb (: candidate (candidatePattern ())))
; ; !(add-atom &kb (: candidate (candidatePattern (Inheritance Z sodaDrinker))))
; (: -> (-> Atom Atom Type))




;; Initializers
;;initialize the necessary input parameters in the KB,
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

;;abstract patterns
(= (abstract $depth $kb)
 
   (let* (
    ($res (syn $kb $depth (: $prf (AbstractPattern $x))))
                    (() (println! (Initializing the miner with the following parameters:)))

    ($rem (remove-atom $kb $res))
    ($add (add-reduct $kb $res))
    ) 
    $res
    )
)

;;specialization of abstract patterns
(= (specialization $depth $kb)

   (let* (
    ($resy (syn $kb $depth (: $prf (specializationOf $aptrn $sptrn))))
    ($rem (remove-atom $kb $resy))
    ($add (add-atom $kb $resy))
    
    ) 
    $resy
    )
) 

;; support of specialized patterns
(= (support $depth $kb)
   (let* (
    ($res (syn $kb $depth (: $prf (supportOf $sptrn $cnt))))
    ($rem (remove-atom $kb $res))
    ($add (add-reduct $kb $res))
    ) 
    $res
    )
)

;;candidate patterns
(= (candidate $depth $kb)
   
   (let*(
    ($atom (: candidate (-> (minsup $ptrn) (-> (replace_variables $ptrn) (candidatePattern $ptrn)))))
    ($add (add-atom $kb $atom))
    ($res (syn $kb $depth (: $prf (candidatePattern $x)))) 
    ($rem (remove-atom $kb $atom))
    ($rem2 (remove-atom $kb $res))
    ($add2 (add-reduct $kb $res))
    )
    $res
    )
)

;; expand conjunctions for as many clauses as needed
(= (conjunction $depth $kb $rec $maxrec) 
    (let*
        (
        ($prevrec (- $rec 1))
        ($re (collapse (remove-atom $kb (: maxClauses (maxClauses $prevrec)))))
        ($add (collapse (add-atom $kb (: maxClauses (maxClauses $rec)))))
        ($res (collapse (syn $kb $depth (: $prf (candidatePattern $y)))))
        ($red (collapse (add-reduct $kb (superpose $res))))
        )
    (if (> (+ $rec 1) $maxrec) $red (conjunction $depth $kb (+ $rec 1) $maxrec))
    )
)

;;format the patterns and add them to the knowledge base with their support
(= (format $depth $kb)
   (collapse 
   (let*(
    ($res (syn $kb $depth (: $prf (hasSupport $ptrn $cnt)))) 
    ($rem2 (remove-atom $kb $res))
    ($add2 (add-reduct $kb $res))
    )
    $res
    ))
)



(= (frequent-miner $db $kb $maxclauses $limit) 
( 
     let*  ( 
         ($re (collapse (abstract (fromNumber 5) $kb)))
         ($res (collapse (specialization (fromNumber 5) $kb)))
         ($resu (collapse (support (fromNumber 3) $kb)))
         ($result (collapse (candidate (fromNumber 5) $kb)))
         ($results (collapse (conjunction (fromNumber 16) $kb $maxclauses $limit)))
         ($resultf (collapse (format (fromNumber 3) $kb)))
      ) ()
)
)



;; new space to store the init-surp results
!(bind! &res (new-space))

---------------------------------------------------------------------------
;; initializes the necessary input parameters in the KB
;;configures and runs the frequent pattern miner with conjunction expansion
;;proceeds to surprisingness pattern mining using the backward chainer 
;;Store the chainer result in to the &res (new space)
----------------------------------------------------------------------------
(= (cog-mine $db $kb $ms $surp $db-ratio $maxclauses $limit) (
    let* (
             (() (init-miner $db $kb $ms $surp $db-ratio)) 
             (() (frequent-miner $db $kb $maxclauses $limit))
            ;  (() (init-surp $kb &res $surp))           
    )
    ;; return all atoms in &res
    ; (match &res $x $x)
    (match $kb $x $x)
))


; (=(min-sup) 2)
; (=(surp-mode) jsdsurp)
; (=(db-ratio) 0.5)

; ! (cog-mine &db &kb (min-sup) (surp-mode) (db-ratio) 1 1)

; !(syn &kb Z (: $prf (substitute_variables (link $nx $ny) ($valx $valy) ($subptrn $remaining))))

; !(init-miner &db &kb (min-sup) (surp-mode) (db-ratio))

; !(conjunction (fromNumber 13) &kb 1 2)



; (syn &kb Z (: $prf (clause_count $ptrn $cnt)))










