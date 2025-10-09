
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
(= (support_ $depth $kb)
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
   (let* (
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
(= (frequent-miner $db $kb $number-of-conjuct) 
( 
     let*  ( 
        (() (println! "==== Frequent Miner Started =====") )
         ($re (collapse (abstract (fromNumber 5) $kb)))
         ($res (collapse (specialization (fromNumber 5) $kb)))
         ($resu (collapse (support_ (fromNumber 3) $kb)))
         ($atom (: candidate (-> (minsup $ptrn $cnt) (-> (replace_variables $ptrn) (candidatePattern $ptrn $cnt)))))
         ($add (add-atom $kb $atom))
         ($result (collapse (candidate (fromNumber 5) $kb)))
         ($rem (remove-atom $kb $atom))
         ($results (collapse (conjunction (fromNumber 18) $kb 1 (- $number-of-conjuct 1))))
         ($resultf (collapse (format (fromNumber 6) $kb)))
      ) ()
)
)

















