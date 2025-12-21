; -----------------------------------------------------------------
;; abstract patterns 
; -----------------------------------------------------------------
;; extracts abstract patterns from the db
(= (abstract $depth $kb)
   (let* (
    (true (println! "==== Extracting abstract patterns =====") )
    ($res (syn $kb $depth (: $prf (AbstractPattern $x)))) 
    ($rem (remove-atom $kb $res))
    ($add (add-atom $kb $res))
    ) 
    $res
    )
)

; --------------------------------------------------
;; specialization
; --------------------------------------------------
;;Generates the specializations of the abstract patterns
(= (specialization $depth $kb)

   (let* (
    (true (println! "==== Generating specializations  =====") )
    ($resy (syn $kb $depth (: $prf (specializationOf $aptrn $sptrn))))
    ($rem (remove-atom $kb $resy))
    ($add (add-atom $kb $resy))
    ) 
    $resy
    )
) 

; --------------------------------------------------
;; support 
; -------------------------------------------------
;; Annotate the support of specialized patterns
(= (support_ $depth $kb)
   (let* (
    (true (println! "==== Computing support =====") )
    ($res (syn $kb $depth (: $prf (supportOf $sptrn $cnt))))
    ($rem (remove-atom $kb $res))
    ($add (add-atom $kb $res))
    ) 
    $res
    )
)

; -----------------------------------------------
;; candidate
; -----------------------------------------------
;; select patterns with min-sup as candidate pattern
(= (candidate $depth $kb)
   (let*(
    (true (println! "==== Selecting Candidate Patterns =====") )
    ($res (syn $kb $depth (: $prf (candidatePattern $x $cnt)))) 
    ($rem2 (remove-atom $kb $res))
    ($add2 (add-atom $kb $res))
    )
    $res
    )
)

; ---------------------------------------------------
;; conjunction
; ---------------------------------------------------
;; expand conjunctions for as many clauses as needed
(= (conjunction $depth $kb $rec $maxrec) 
    (let*
        (
        (true (println! "==== Doing conjunction =====") )
        ($prevrec (- $rec 1))
        ($re (collapse (remove-atom $kb (: maxClauses (maxClauses $prevrec)))))
        ($add (collapse (add-atom $kb (: maxClauses (maxClauses $rec)))))
        ($res (collapse (syn $kb $depth (: $prf (candidatePattern $ptrn $cnt)))))
        ($red (collapse (let $final (superpose $res) (superpose ((remove-atom $kb $final) (add-atom $kb $final))))))
        )
    (if (> (+ $rec 1) $maxrec) $red (conjunction $depth $kb (+ $rec 1) $maxrec))
    )
)

; ------------------------------------------------------
;; format
; ------------------------------------------------------
;;format the patterns and add them to the knowledge base with their support
(= (format $depth $kb)
   (let* (
    (true (println! "==== Formatting patterns  =====") )
    ($res (syn $kb $depth (: $prf (hasSupport $ptrn $cnt)))) 
    ($rem2 (remove-atom $kb $res))
    ($add2 (add-atom $kb $res))
    )
    $res
    )
)


; --------------------------------------------------
;; frequent-miner
; --------------------------------------------------
;; pipeline for the frequent patter mining 
(= (frequent-miner $db $kb $number-of-conjuct True) 
( 
     let*  ( 
        (true (println! "==== Frequent Miner Started =====") )
         ($re (collapse (abstract (fromNumber 5) $kb)))
         ($res (collapse (specialization (fromNumber 7) $kb)))
         ($resu (collapse (support_ (fromNumber 3) $kb)))
         ($atom (: candidatep (-> (minsup $ptrn $cnt) (-> (replace_variables $ptrn) (candidatePattern $ptrn $cnt)))))
         ($add (add-atom $kb $atom))
         ($result (collapse (candidate (fromNumber 5) $kb)))
         ($rem (remove-atom $kb $atom))
         ($results (collapse (conjunction (fromNumber 19) $kb 1 (- $number-of-conjuct 1))))
         ($resultf (collapse (format (fromNumber 6) $kb)))
      ) ()
)
)
(= (frequent-miner $db $kb $number-of-conjuct False) 
( 
     let*  ( 
        (true (println! "==== Frequent Miner Started =====") )
         ($re (collapse (abstract (fromNumber 5) $kb)))
         ($res (collapse (specialization (fromNumber 7) $kb)))
         ($resu (collapse (support_ (fromNumber 3) $kb)))
         ($atom (: candidatep (-> (minsup $ptrn $cnt) (-> (replace_variables $ptrn) (candidatePattern $ptrn $cnt)))))
         ($add (add-atom $kb $atom))
         ($result (collapse (candidate (fromNumber 5) $kb)))
         ($rem (remove-atom $kb $atom))
      ) ()
)
)






