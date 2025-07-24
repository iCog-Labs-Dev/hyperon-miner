
(=(is-number $x) 
   (== (get-type $x) Number) 
)

(= (count-sup $db $ptrn)
    (let $result (collapse (match $db $ptrn $ptrn))
         (size-atom $result)
    )
)

(= (handle-nested-exp $p)
    (if (not (== (get-metatype $p) Expression))
        $p
        (let* (
                (() (println! (Handling nested expression: $p)))
                ( ($link $x $y) $p)
                ( $nx (collapse (handle-nested-exp $x)))
                ( $ny (collapse (handle-nested-exp $y)))
            )
        (superpose (
                ($link (superpose $nx) $w)
                ($link $z (superpose $ny))
                ($link $x $u)
                ($link $k $y)
                $d
                ($link $g $o)
                ($link (superpose $nx) (superpose $ny))
            )
    )
)

)
)


(= (get-clauses $cnj) (
  unify (, $ncnj $ptrn) $cnj (let $result (get-clauses $ncnj) (cons-atom $ptrn $result) ) ($cnj)
))

;; define system proofs 
------------------------------------------------------------------
;; System proof for ⍃
;; if conclusion equals (⍃ $X $Y), then return (: CPU (⍃ $X $Y)) 
;; if $x and $Y are fully grounded and (< $X $Y)
------------------------------------------------------------------
(= (syn $kb $_ (: $prf (⍃ $X $Y))) 
    (if (and (and (is-number $X) (is-number $Y)) (<= $X $Y))
          (: CPU (⍃ $X $Y))
             (empty)))
----------------------------------------------------------------------------
;; system proof  to calculate the emp-tv for the given pattern. 
;; The database is queried here because, when it was placed in the premises, 
;; it caused infinite results in CPUEMP.
----------------------------------------------------------------------------
(= (syn $kb $_ (: $prf (emp-cpu $ptrn  $emp ))) 
    (let $dbb (match $kb (db-ref $db) $db)
    (: CPUEMP (emp-cpu $ptrn  (emp-tv (flatten $ptrn) $dbb ))) ) 
)

-----------------------------------------------------------------------------
;; system proof  to calculate the est-tv for the given pattern. 
;; The database is queried here because, when it was placed in the premises, 
;; it caused infinite results in CPUEST.
-----------------------------------------------------------------------------
(= (syn $kb $_ (: $prf (est-cpu  $ptrn $emp $est))) 
    (let $dbb (match $kb (db-ref $db) $db)
    (: CPUEST (est-cpu $ptrn $emp (do-ji-tv-est $dbb (flatten $ptrn) $emp))) ) 
)


-----------------------------------------------------------------------------
(= (syn $kb $_ (: $prf (prob-cpu  $pattern $prob))) 
    (let $dbb (match $kb (db-ref $db) $db)
    (: CPUPROB (prob-cpu  $pattern (prob $pattern  $dbb) ))
    ) 
)

-----------------------------------------------------------------------------
;; system proof to calculate the partitions for the given pattern.
(= (syn $kb $_ (: $prf (partition-cpu  $pattern $partitions))) 
    (let $partitions (generet-partition-without-pattern $pattern)
    (: CPUPARTN (partition-cpu  $pattern $partitions)) ) 
)

----------------------------------------------------------------------------
;; min max estimation of the pattern for isurp old
(= (syn $kb $_ (: $prf (est-prob-cpu  $pattern $partitions $emin-emax))) 
    (let $dbb (match $kb (db-ref $db) $db)
    (: CPUESTPROB (est-prob-cpu   $pattern $partitions (min-max (isurp-old_  $partitions $dbb)))) ) 
)

-------------------------------------------------------------------------
;; calculates the distance between the estimate value and emperical value
(= (syn $kb $_ (: $prf (dst-cpu $x $y $dst))) 
    (let $dst (- $x $y)
    (: CPUDST (dst-cpu  $x $y $dst)) ) 
)

-------------------------------------------------------------------------
;; create the minimum relation 
(= (syn $kb $_ (: $prf (minimum $x $y $z)))
         (let $min (min $x $y)
               (: MINIMUMCPU  (minimum $x $y $min))))

-------------------------------------------------------------------------
;; division relation 
(= (syn $kb $_ (: $prf (divide $x $y $z)))
         (let $div (// $x $y)
               (: DIVIDECPU (divide $x $y $div))))

------------------------------------------------------------------------
;;equality checker relation 
(= (syn $kb $_ (: $prf (equals $X $Y))) 
    (if (and (and (is-number $X) (is-number $Y)) (== $X $Y))
          (: CPUequals (equals $X $Y))
             (empty)))

---------------------------------------------------------------------
(= (syn $kb $_ (: $prf (⍄ $X $Y))) 
    (if (and (and (is-number $X) (is-number $Y)) (> $X $Y))
          (: CPU (⍄ $X $Y))
             (empty))) 

==============================================================================
;;frequent pattern miner system proofs
==============================================================================

;; system proof to get the unique links from the database
(= (syn $kb $_ (: $prf (uniqueLink $pattern $cnt))) 
    (let* (
        ($db (match $kb (db-ref $db) $db))
        ($uniquelink (collapse (unique (match $db ($link $x $y) $link)) ) )
        ($sup (superpose $uniquelink))
        )
    (if (== (size-atom $uniquelink) 0)
          (empty)
             (: CPUUnique (uniqueLink ($sup $a $b) (count-sup $db ($sup $a $b))))
             ))
    )

---------------------------------------------------------------------------
;; system proof to replace variables with debruijn index
(= (syn $kb $_ (: $prf (replace_variables $ptrn)))
    (let* (
        ($new_ptrn (call_replace $ptrn))
        )
    (if (== $new_ptrn ())
          (empty)
             (: CPUReplacevar (replace_variables $new_ptrn))
        )    
    )
)

-----------------------------------------------------------------------------
;; system proof to count support
(= (syn $kb $_ (: $prf (sup_count $ptrn $count)))
    (let* (
        ($db (match $kb (db-ref $db) $db))
        ($new_ptrn (collapse (match $db $ptrn $ptrn)))
        ($count (size-atom $new_ptrn))
    )
     (: CPUCounter (sup_count $ptrn $count))
    )
)

-----------------------------------------------------------------------------
;;system proof to replace debruijn index with variables
(= (syn $kb $_ (: $prf (replace_index $ptrn $res)))
    (let* (
        ($new_ptrn (call_replacev $ptrn))
        )
    (if (== $new_ptrn ())
          (empty)
             (: CPUReplaceindex (replace_index $ptrn $new_ptrn))
        )    
    )
)

-----------------------------------------------------------------------------
;; system proof to get variables of a pattern
(= (syn $kb $_ (: $prf (get_variables $ptrn $vars)))
    (let* (
        ($vars (get_variable_for_pattern $ptrn))
        )
    (if (== $ptrn ())
          (empty)
             (: CPUGetPatternVariables (get_variables $ptrn $vars))
        )    
    )
)

-----------------------------------------------------------------------------
;; system proof to combine variable of two patterns
(= (syn $kb $_ (: $prf (combine_variables $vars1 $vars2 $comb)))
    (let* (
        ($comb (combine_lists $vars1 $vars2))
        )
    (if (== $comb ())
          (empty)
             (: CPUCombineVariables (combine_variables $vars1 $vars2 $comb))
        )    
    )
)

-----------------------------------------------------------------------------
;; system proof to substitute variables in a pattern by another variables
(= (syn $kb $_ (: $prf (substitute_variables $pattern $vars $subpattern)))
    (let* (
        ($subpattern (substitute $pattern $vars))
        )
    (if (== $subpattern ())
          (empty)
             (: CPUSubstituteVariables (substitute_variables $pattern $vars $subpattern))
        )    
    )
)

-----------------------------------------------------------------------------
;;system proof to count the number of clauses in a pattern
(= (syn $kb $_ (: $prf (clause_count $ptrn $cnt)))
    (let* (
        ($clauses (get-clauses $ptrn))
        ($cnt (size-atom $clauses))
        )
    (if (== $cnt 0)
          (empty)
             (: CPUCount (clause_count $ptrn $cnt))
        )    
    )
)

-----------------------------------------------------------------------------
;; system proof to clean conjunction with redundant clauses
(= (syn $kb $_ (: $prf (conjunction_clean $conjunction)))
    (let* (
        ($conjuncts (get-conjuncts $conjunction))
        ($unique_conjuncts (unique-atom $conjuncts))
        )
    (if (== (size-atom $conjuncts) (size-atom $unique_conjuncts))
        (: CPUConjunctionClean (conjunction_clean $conjunction))
        (empty)
    )
    )
)

------------------------------------------------------------------------------
;; system proof to handle depth
(= (syn $kb $_ (: $prf (depth-handler $p $np)))
    (let
     $np (handle-nested-exp $p)
    (if (== $np ())
          (empty)
             (: CPUHandleNestedExp (depth-handler $p $np))
        )    
    )
)

------------------------------------------------------------------------------
;; system proof to get valuation set of a pattern
(= (syn $kb $_ (: $prf (valuation $type ($link $x $y) $val)))
    (let* (
        ($db (match $kb (db-ref $db) $db))
        ( $valx (collapse (unique (match $db ($link $x $y) $x))))
        ( $valy (collapse (unique (match $db ($link $x $y) $y))))
        )
    (if (== $type X)
        (if (== ($valx $valy) ())
          (empty)
             (: CPUHandleValuation (valuation $type ($link $x $y) (superpose $valx)))
        )  
        (if (== $type Y)
            (if (== ($valy $valx) ())
              (empty)
                 (: CPUHandleValuation (valuation $type ($link $x $y) (superpose $valy)))
            )
            (empty)
        )
    )  
    )
)            
==============================================================================
;; chainner 
==============================================================================
;; Base case
(= (syn $kb $_ (: $prf $ccln)) (match $kb (: $prf $ccln) (: $prf $ccln)))

;; Recursive step
(= (syn $kb (S $k) (: ($prfabs $prfarg) $ccln))
   (let* (
     ((: $prfabs (-> $prms $ccln)) (syn $kb $k (: $prfabs (-> $prms $ccln))))
          (() (println! (Next prims : $prms)))
          ((: $prfarg $prms) (syn $kb $k (: $prfarg $prms)))
          )
     (: ($prfabs $prfarg) $ccln)))


     

; ;; Base case.  For now it terminates at exactly iteration Z to avoid
; ;; collecting too many redundant results.
; (= (isyn $kb $depth Z $query) $query)

;; Iterative step
(= (isyn $kb $depth (S $k) $query)
   (let* (
      (() (println! (have called)))
      ($cres (collapse (syn $kb $depth $query)))
          (() (println! (cres: $cres)))
          ($dummy (add-atoms-nodup $kb $cres))
          )
     (isyn $kb $depth $k (superpose $cres))))

(= (collapser $kb $depth  $query)
   (let* (
      (() (println! (have called)))
      ($cres (collapse (syn $kb $depth $query)))
      (() (println! (cres: $cres)))
          )
     $cres))





    