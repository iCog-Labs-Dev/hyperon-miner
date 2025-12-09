
; ---------------------------------
;; candidatePattern
; ---------------------------------
;get candidate patterns based on theri support
;; 1. get the specialized pattern
;; 2. calculate the support of the pattern
;; 3. store as a candidate if the support is greater than the minimum support
;(: (candidatePattern (-> space space Number space Atom)))
; (= (candidatePattern  $dbspace $spezspace $minsup $cndpspace)
;     (match $spezspace (SpecializationOf $specialized $pattern)
;         (let* ( 
;                 ( $specializedvar (replacev $specialized))
;                 ($result (sup-eval $dbspace $specializedvar $minsup))
;             )
;         (if  $result
;             (add-atom $cndpspace (CandidatePattern $specialized))
;             ()
;         )
; )))

; (= (candidatePattern  $dbspace $spezspace $minsup $cndpspace)
;     (match $spezspace (SpecializationOf $specialized $pattern)
;         (let* ( 
;                 ( $specializedvar (replacev $specialized))
;                 ($result (sup-num $dbspace $specializedvar))
;             )
;         (if  (>= $result $minsup)
;             (add-atom $cndpspace (CandidatePattern $specialized $result))
;             ()
;         )
; )))

(= (candidatePattern $dbspace $spezspace $minsup $cndpspace)
    (match $spezspace (SpecializationOf $specialized $pattern)
        (let* ( 
                (true (println! ("==== Candidate Pattern started =====", $specialized)))
                ($specializedvar (replacev $specialized))
                ($result (sup-num $dbspace $specializedvar))
                (true (println! (here in candidatePattern $result)))
                ($rem (if  (>= $result $minsup) (remove-atom $cndpspace (CandidatePattern $specialized $result)) ())  )             
                ($add (if (>= $result $minsup) (add-atom $cndpspace (CandidatePattern $specialized $result)) ()))
            ) 
        $add
)))
