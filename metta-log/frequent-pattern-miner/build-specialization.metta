; ! (register-module! ../../../hyperon-miner)
; ! (import! &db hyperon-miner:experiments:data/sample-data)
; ; ! (import! &db hyperon-miner:experiments:data/ugly_man_sodaDrinker)
; ; ! (import! &self hyperon-miner:experiments:frequent-pattern-miner/freq-pat)
; ! (import! &self hyperon-miner:experiments:utils:index_to_var)

; ! (bind! &kb (new-space))
; ! (bind! &dbspace (new-space))
; ; ! (bind! &testspace (new-space))
; ! (bind! &specspace (new-space))
; ; ! (bind! &cndpspace (new-space))
; ; ! (bind! &aptrnspace (new-space))
; ; ! (bind! &conjspace (new-space))

; !(let ($link $x $y) (get-atoms &db) (add-atom &dbspace ($link $x $y)))

---------------------------------------
;; depth-handler
---------------------------------------
;; function to handle the depth of the pattern
;; 1. check if the pattern is an expression
;; 2. if it is not an expression, return the pattern
;; 3. if it is an expression, destructure the pattern and handle the depth of the pattern by recursively getting all 
;; combinations of the variables and symbols of the pattern
;(: depth-handler (-> Pattern Atom))
(= (depth-handler $p)
    (if (not (== (get-metatype $p) Expression))
       $p
        (case $p
            (
                (($type $x) ($type $x))
                (($link $x $y) 
                                (let* (
                                    ( ($link $x $y) $p)
                                    ( $nx (collapse (depth-handler $x)))
                                    ( $ny (if (== $x $y) $nx (collapse (depth-handler $y))))
                                )
                                (superpose (
                                        ($link (superpose $nx) $w)
                                        ($link $z (superpose $ny))
                                        ($link $x $u)
                                        ($link $k $y)
                                        $d
                                        (if (== $x $y) ($link $g $g) ($link $g $o))
                                        ($link (superpose $nx) (superpose $ny))
                                    ))) 
                )))
                ))

; !(depth-handler (Inheritance Z Z))
-------------------------------------------------------------------------------
; build-specialization
-------------------------------------------------------------------------------
; function to build the specialization of a pattern and add it to the specialization space
; - get the valuation of the pattern by destructuring the pattern
; - abstract the pattern and handle patterns with depth
; - build the specialization
; - add the specialization to the specialization space
;(: build-specialization (-> Pattern SpaceType SpaceType Atom))
; (: build-specialization (-> Pattern SpaceType SpaceType Any))
(= (build-specialization ($link $x $y) $dbspace $specspace) 
            (let*
                (  
                     (() (println! "==== Build specialization started ====="))
                    ( ($link $x1 $y1) (replacev ($link $x $y)))                            ; replacev is a function that replaces index with variables
                    (() (println! ("Pattern after replacev: " ($link $x1 $y1))))
                    ( ($subx $suby) (match $dbspace ($link $x1 $y1) ($x1 $y1)))            ; getting the substitution /valuation of the pattern
                    ($shabx (depth-handler $subx))                                    ;handle depth in the x node
                    ($shaby (if (== $subx $suby) $shabx (depth-handler $suby)))                                    ; handle depth in the y node   
                    ; (() (println! (shab-⍃ ($shabx $shaby))))  
                                                                                 
                    ; ($spec1 (SpecializationOf ($link $x1 $y) ($link $x $y))) ;build the specialization and change the variables to indexs 
                    ($rep (replace ($link $shabx $vary)))
                    ($rep2 (replace ($link $varx $shaby)))
                    ($rep3 (replace ($link $shabx $shaby)))
                    (() (println! ("Specialization: " $rep))) ;build the specialization and change the variables to indexs
                    (() (println! ("Specialization: " $rep2))) ;build the specialization and change the variables to indexs
                    (() (println! ("Specialization: " $rep3))) ;build the specialization and change the variables to indexs
                    ($spec1 (SpecializationOf $rep ($link $x $y))) ;build the specialization and change the variables to indexs 
                    ($spec2 (SpecializationOf $rep2 ($link $x $y))) ;build the specialization and change the variables to indexs
                    ($spec3 (SpecializationOf $rep3 ($link $x $y)))
                    ; (() (println! ("Specialization: " $spec1))) ;build the specialization and change the variables to indexs
                    ; (() (println! ("Specialization: " $spec2))) ;build the specialization and change the variables to indexs
                    ; (() (println! ("Specialization: " $spec3))) ;build the specialization and change the variables to indexs
                )
            (
                superpose (
                    ; (remove-atom $specspace $spec1) ; remove the old specialization to avoid redundancy
                    (add-atom $specspace $spec1) ; add the new specialization
                    ; (remove-atom $specspace $spec2)
                    (add-atom $specspace $spec2)
                    ; (remove-atom $specspace $spec3)
                    (add-atom $specspace $spec3)
                )

        )
)
)
; !(replace (Inheritance $v1 $v2))
; !(build-specialization (Inheritance Z (S Z)) &dbspace &specspace)
; !(match &specspace (SpecializationOf $p $q) ($p $q))

