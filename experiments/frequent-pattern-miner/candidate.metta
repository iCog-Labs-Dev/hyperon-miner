; ! (register-module! ../../experiments)
; !(import! &self experiments:utils:common-utils)
; !(import! &self experiments:frequent-pattern-miner:valuation)
; !(import! &self experiments:frequent-pattern-miner:shallow-abstractions)
; !(import! &self experiments:frequent-pattern-miner:specialization)
; !(import! &db experiments:data:small-ugly)
; ! (import! &self freq-pat)
; ! (bind! &dbspace (new-space))
; ! (bind! &cndpspace (new-space))
; ! (bind! &testspace (new-space))

! (import! &self freq-pat)
; ; ; ! (import! &self conj-exp)

; !(let $x (get-atoms &db) (add-atom &dbspace $x))

(= (candidatePattern $specializations $minsup $dbspace)
        (let* ( 
                (() (println! "==== Candidate Pattern started ====="))
                ( $specializedvar (replacev $specializations))
                (() (println! (here in candidatePattern $specializedvar)))
                ($result (sup-num $dbspace $specializedvar))
                (() (println! (here in candidatePattern $result)))
                ; ($rem (if  (>= $result $minsup) (remove-atom $cndpspace (CandidatePattern $specialized $result)) ())  )             
                ($add (if (>= $result $minsup) $specializedvar ()))
            ) 
        ; ($add $rem)
        $add
))

(= (miner () $dbspace $minsup)
        ()
)

(= (miner $pattern $dbspace $minsup)
        (let*(
                ($vals (collapse (valuation $pattern $dbspace)))
                (() (println! (here in miner $vals)))
                ; ($shallow_abstractions (shallow_abstractions $vals))
                ($shallow_abstractions (unique (shallow_abstractions $vals () 0)))
                (() (println! (here in miner $shallow_abstractions)))
                ($specialized (specialization $pattern $shallow_abstractions))
                ; (() (println! (here in miner $specialized)))
                ($candidates (candidatePattern $specialized $minsup $dbspace))
                ; (() (println! (here in miner $candidates)))
                (() (println! "==== Candidate Pattern ended ====="))
        )
        ; $specialized
        $candidates
        )
)

; !(miner (Inheritance $x $y) &dbspace 4)

(= (has_nested_expression_with_respect_to $parent $candidate)
   (if (== $parent ())
       False
       (let* (
              ($headP (if (== (get-metatype $parent) Variable) (car-atom ($parent)) (car-atom $parent)))
              (() (println! ($headP)))
              ($tailP (if (== (get-metatype $parent) Variable) (cdr-atom ($parent)) (cdr-atom $parent)))
              ($headC (if (== (get-metatype $parent) Variable) (car-atom ($candidate)) (car-atom $candidate)))
                  (() (println! ($headC)))
              ($tailC (if (== (get-metatype $parent) Variable) (cdr-atom ($candidate)) (cdr-atom $candidate)))
          )

          (if (== (get-metatype $headP) Variable)
              ;; Case 1: parent is a variable — check candidate
              (if (== (get-metatype $headC) Expression)
                  True
                  False)
              ;; Case 2: both are expressions — recurse
              (if (and (== (get-metatype $headP) Expression)
                       (== (get-metatype $headC) Expression))
                  (or (has_nested_expression_with_respect_to $headP $headC)
                      (has_nested_expression_with_respect_to $tailP $tailC))
                  ;; Otherwise just compare subparts
                  (has_nested_expression_with_respect_to $tailP $tailC)
              )
          )
       )
   )
)

(= (candidate-pattern-miner $initpat $dbspace $minsup $cndpspace)
        (let* (
                ($candidates (miner $initpat $dbspace $minsup))
                (() (println! (here in frequent-pattern-miner $candidates)))
                ($indexed (replace $candidates))
                (() (println! (here in frequent-pattern-miner indexed $indexed)))
                ($rem (if (== $indexed ()) () (remove-atom $cndpspace $indexed)))
                ($add (if (== $indexed ()) () (add-atom $cndpspace $indexed)))
                ($next (has_nested_expression_with_respect_to $initpat $candidates))
                (() (println! (here in frequent-pattern-miner next $next)))
                ($rec (if $next (candidate-pattern-miner $candidates $dbspace $minsup $cndpspace) ()))
            )
            $rec
        )
)

; !(candidate-pattern-miner $x &dbspace 4 &cndpspace)

; !(match &cndpspace $pattern $pattern)


; !(has_nested_expression_with_respect_to $x (Inheritance $X $Y))
; !(has_nested_expression_with_respect_to (Inheritance (link $X $Z) $Y) (Inheritance (link (link2 $A $b) $Z) $Y))
