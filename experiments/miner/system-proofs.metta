; !(register-module! ../rules)
; !(import! &self rules:freq-pat)
; (: tuple-count (-> %Undefined% Number))
; (= (tuple-count $atom) (size-atom $atom))

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


(=(is-numb $x) 
   (== (get-type $x) Number) 
)

;; define system proofs 
------------------------------------------------------------------
;; System proof for ⍃
;; if conclusion equals (⍃ $X $Y), then return (: CPU (⍃ $X $Y)) 
;; if $x and $Y are fully grounded and (< $X $Y)
------------------------------------------------------------------
(= (syn $kb $_ (: $prf (⍃ $X $Y))) 
    (if (and (and (is-numb $X) (is-numb $Y)) (<= $X $Y))
          (: CPU (⍃ $X $Y))
             (empty)))

(= (syn $kb $_ (: $prf (equals $X $Y))) 
    (if (and (and (is-numb $X) (is-numb $Y)) (== $X $Y))
          (: CPUequals (equals $X $Y))
             (empty)))


(= (syn $kb $_ (: $prf (⍄ $X $Y))) 
    (if (and (and (is-number $X) (is-number $Y)) (> $X $Y))
          (: CPU (⍄ $X $Y))
             (empty))) 
             
                        

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



(= (syn $kb $_ (: $prf (sup_count $ptrn $count)))
    (let* (
        ($db (match $kb (db-ref $db) $db))
        ($new_ptrn (collapse (match $db $ptrn $ptrn)))
        ($count (size-atom $new_ptrn))
    )
     (: CPUCounter (sup_count $ptrn $count))
    )
)
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
(= (syn $kb $_ (: $prf (depth-handler $p $np)))
    (let
     $np (handle-nested-exp $p)
    (if (== $np ())
          (empty)
             (: CPUHandleNestedExp (depth-handler $p $np))
        )    
    )
)

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
;; Proof for prunning
; (= (syn $kb $_ (: PRUNEPRF (valid-conj $p1 $p2))) 
;     (if (prune? (, $p1 $p2))
;         (empty)
;         (: PRUNEPRF (valid-conj $p1 $p2))))


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
    (: CPUPROB (prob-cpu  $pattern (prob $pattern  $dbb) )) ) 
)

-----------------------------------------------------------------------------
;; system proof to calculate the partitions for the given pattern.
(= (syn $kb $_ (: $prf (partition-cpu  $pattern $partitions))) 
    (let $partitions (generet-partition-without-pattern $pattern)
    (: CPUPARTN (partition-cpu  $pattern $partitions)) ) 
)

(= (syn $kb $_ (: $prf (est-prob-cpu  $pattern $partitions $emin-emax))) 
    (let $dbb (match $kb (db-ref $db) $db)
    (: CPUESTPROB (est-prob-cpu   $pattern $partitions (min-max (isurp-old_  $partitions $dbb)))) ) 
)


(= (syn $kb $_ (: $prf (dst-cpu $x $y $dst))) 
    (let $dst (- $x $y)
    (: CPUDST (dst-cpu  $x $y $dst)) ) 
)



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

;; Base case.  For now it terminates at exactly iteration Z to avoid
;; collecting too many redundant results.
(= (isyn $kb $depth Z $query) $query)

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
      ($dummy (add-atoms-nodup $kb $cres))
      (() (println! (cres: $cres)))
          )
     $cres))



;; Backward chainer/synthesizer
(: syn (-> $a                           ; Knowledge base space
           Nat                          ; Maximum depth
           $b                           ; Query
           $b))                         ; Result


 
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

;; Base case.  For now it terminates at exactly iteration Z to avoid
;; collecting too many redundant results.
(= (isyn $kb $depth Z $query) $query)

;; Iterative step
(= (isyn $kb $depth (S $k) $query)
   (let* (
      (() (println! (have called)))
      ($cres (collapse (syn $kb $depth $query)))
          (() (println! (cres: $cres)))
          ($dummy (add-atoms-nodup $kb $cres)))
     (isyn $kb $depth $k (superpose $cres))))

(= (collapser $kb $depth  $query)
   (let* (
      (() (println! (have called)))
      ($cres (collapse (syn $kb $depth $query)))
      (() (println! (cres: $cres)))
          )
     $cres))
