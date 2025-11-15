; /**
 ;  * Given cnjtion and pattern, consider all possible connections
 ;  * (a.k.a linkages) and expand cnjtion accordingly. For instance if
 ;  *
 ;  * cnjtion = (Inheritance X Y)
 ;  * pattern = (Inheritance Z W)
 ;  *
 ;  * return
 ;  *
 ;  *   (, (Inheritance X Y) (Inheritance X W))
 ;  *   (, (Inheritance X Y) (Inheritance Z X))
 ;  *   (, (Inheritance X Y) (Inheritance Y W))
 ;  *   (, (Inheritance X Y) (Inheritance Z Y))
 ;  *
 ;  * It will also only include patterns with minimum support ms
 ;  * according to db, and perform alpha-conversion when necessary.
 ;  *
 ;  * mv is the maximum number of variables allowed in the resulting
 ;  *    patterns.
 ;  *
 ;  */

; ! (register-module! ../../../hyperon-miner)
; ! (import! &self hyperon-miner:experiments:utils:variable-combinations)
; ! (import! &self hyperon-miner:experiments:utils:common-utils)
; ; ! (import! &self hyperon-miner:experiments:utils:index_to_var)
; ; ! (import! &self hyperon-miner:experiments:utils/variable-combinations)
; ; ! (import! &self hyperon-miner:experiments:utils/common-utils)
; ! (import! &self hyperon-miner:metta-log:frequent-pattern-miner:index_To_ver_log)
; ! (import! &self hyperon-miner:metta-log:frequent-pattern-miner/index_To_ver_log)

; ! (import! &self conj-exp)
; ! (import! &self freq-pat)

; !(combine_lists ($a $b $c) ($X $Y $Z))
 ; The starting point for the conjunction expansion. It passes
 ; the Alpha Converted pattern (if necessary) to the expand_conjunction functions.
 ; if it passes the minimum variable check

; (= (expand_conjunction $cnjtion $pattern $db $ms $mv $es)
;     (if $es
;         (expand_conjunctin_es_rec $cnjtion $pattern $db $ms)
;         (expand_conjunction_rec $cnjtion $pattern $db $ms)
;     )
; )
(= (expand_conjunction $cnjtion $pattern $db $ms)
     (let* (
            ($pattern_vars (get_variable_for_pattern $pattern))
            (() (println! (pattern-vars ~ $pattern_vars)))
            ($cnjtion_vars (get_variable_for_pattern $cnjtion))
            (() (println! (cnjtion-vars ~ $cnjtion_vars)))
             ($alpha_vars (address_conflict $pattern_vars $cnjtion_vars () ()))
             (() (println! (alpha-converted-vars ~ $alpha_vars)))
             ($apat (substitute $pattern $alpha_vars))
         )
         (expand_conjunction_rec $cnjtion $apat $db $ms)
     )
    ; (if $es
    ;     (expand_conjunctin_es_rec $cnjtion $pattern $db $ms)
        ; (expand_conjunction_rec $cnjtion $pattern $db $ms)
    ; )
)
(= (count-atom-element $atom) (if (== $atom ()) 0 (+ 1 (count-atom-element (cdr-atom $atom)))))


(= (find_value $keys $vals $var)
    (if (or (== $keys ()) (== $vals ()))
        ()
    (let* (
        ($key (car-atom $keys))
        ($val (car-atom $vals))
        ($keytail (cdr-atom $keys))
        ($valtail (cdr-atom $vals))
        ($res (if (== $key $var) ($val) (find_value $keytail $valtail $var)))
        (() (println! (here in find_value $res)))
    )
    $res
    ))
)

(= (does_exist $lead $list_vars)
    (if (== $list_vars ())
        False
        (let* (
                (() (println! (here in does_exist $lead, $list_vars)))
                ($head (car-atom $list_vars))
                (() (println! (here in does_exist $head)))
                (() (println! (here in does_exist $lead)))
                ($tail (cdr-atom $list_vars))
                ($check (== $lead ($head)))
                (() (println! (here in does_exist $check)))
            )
            (if $check
                True
            (does_exist $lead $tail))
        )
    )
)

(= (address_conflict $pattern_vars $cnjtion_vars $seen_keys $seen_vals)
    (if (== $pattern_vars ())
        ()
        (let* (
                ($head (car-atom $pattern_vars))
                (() (println! (here in address_conflict $head)))
                ($tail (cdr-atom $pattern_vars))
                ($var (gen_random_var))
                (() (println! (here in address_conflict $var)))
                ($newhead (cons-atom $head ()))
                ($exist (does_exist $newhead $cnjtion_vars))
                (() (println! (here in address_conflict $exist)))
                ($cur (if $exist
                            (if (does_exist ($head) $seen_keys)
                                ((find_value $seen_keys $seen_vals $head) $seen_keys $seen_vals)
                                (($var) (cons-atom $head $seen_keys) (cons-atom $var $seen_vals)))
                            (($head) (cons-atom $head $seen_keys) (cons-atom $head $seen_vals))))
                ; ($cur (if (does_exist $head $cnjtion_vars)
                ;             (if (does_exist $head $seen_keys)
                ;                 ((find_value $seen_keys $seen_vals $head) $seen_keys $seen_vals)
                ;                 (($var) (cons-atom $head $seen_keys) (cons-atom $var $seen_vals)))
                ;             (($head) (cons-atom $head $seen_keys) (cons-atom $head $seen_vals))))
                (($val $seen_key $seen_val) $cur)
                (() (println! (here in address_conflict $val)))
                (() (println! (here in address_conflict $seen_key)))
                (() (println! (here in address_conflict $seen_val)))
                ($rest (address_conflict $tail $cnjtion_vars $seen_key $seen_val))
                (() (println! (here in address_conflict $rest)))
        )
                (concatTuple $val $rest)
        )
    )
)






(= (alpha_convert $pattern_vars $cnjtion_vars)
    (let $converted (address_conflict $pattern_vars $cnjtion_vars () ()) $converted)
)

(= (get_variables_for_tree $pattern)
    (if (== $pattern ())
        ()
        (let* (
                ($head (car-atom $pattern))
                ($tail (cdr-atom $pattern)))

            (if (== (get-metatype $head) Expression)
                (concatTuple (get_variables_for_tree $head)
                    (get_variables_for_tree $tail))
                (if (== (get-metatype $head) Variable)
                    (concatTuple
                        ($head)
                        (get_variables_for_tree $tail))

                    (get_variables_for_tree $tail))))
    )
)

; ; !(substitute_for_tree (link $x $y) ($a $b))
; !(substitute_for_tree ($LIST_LINK (INHERITANCE_LINK (INHERITANCE_LINK $S $K) (INHERITANCE_LINK $n $m)) (INHERITANCE_LINK (INHERITANCE_LINK $g $t) (INHERITANCE_LINK $p $r))) ($R-D1737102179 $A $b $c $d $e $f $h $g)) 
 
;; Wrapper: returns only the substituted tree, ignores leftover subs
; = (substitute $pattern $sub)
;    (car-atom (substitute_for_tree $pattern $sub))
( = ( real-substitute-func $thePattern $setOfVariables $accumulator)
    (   
        if (== $thePattern ())
            ($accumulator $setOfVariables) ;;;``;;; end of expression ;;;
            (let* 
                (
                    ($head (car-atom $thePattern)) 
                    ($tail (cdr-atom $thePattern)) 
                    ($headType (get-metatype $head))
                    ($firstVariable (if (== $setOfVariables ()) () (car-atom $setOfVariables)))
                    ($restVariables (if (== $setOfVariables ()) () (cdr-atom $setOfVariables)))
                ) 
                (if (and (== $headType Variable) (not (== $setOfVariables ())))
                        ( real-substitute-func $tail $restVariables ( union-atom $accumulator ($firstVariable) ) )
                        (   
                            if (== $headType Expression)  
                                ;; work for this expression and return the corrected expression here
                                ( let* (
                                        ( $returnedValue (real-substitute-func $head $setOfVariables ()) )
                                        ( $textPart      ((car-atom $returnedValue)))
                                        ( $variablePart   (cdr-atom $returnedValue) )
                                        ( $leftVariable  (car-atom $variablePart))
                                        ( () (println! (returnedValue ~ $returnedValue , textPart ~ $textPart , left over variable ~ $leftVariable)) )
                                    ) 
                                    (let
                                            $fullHistory (union-atom $accumulator $textPart) 
                                            ;; work for the rest of the pattern with the leftover substituting variables
                                            ( real-substitute-func $tail $leftVariable $fullHistory )
                                    )
                                    
                                ) 
                                (let 
                                        $joined (union-atom $accumulator ($head)) 
                                        ( real-substitute-func $tail $setOfVariables $joined )

                                )
                                
                        )
                )
            )
    
    )
)

( = (substitute $pattern $setOfVariables) 
    (
        let 
            $answer (real-substitute-func $pattern $setOfVariables ()) 

            (car-atom $answer)
    )   
)




(= (get_variable_for_pattern $pattern)
    (case ($pattern) (
            ( (()) ())
            (  (($x))
                (if (== (get-metatype $x) Variable)
                    ($x)
                () ;; Not actually a variable
            ))
    ( (  ($link $x $y))
        (let* (
                ( $subx (if ( == ( get-metatype $x ) Expression) (get_variable_for_pattern $x) (get_variable_for_pattern ($x))))
                ( $suby (if (== (get-metatype $y) Expression) (get_variable_for_pattern $y) (get_variable_for_pattern ($y))))
            )
        (concatTuple $subx $suby)
    )
)
( ( ($link $x))
    (let* (
            ( $subx (if ( == ( get-metatype $x ) Expression) (get_variable_for_pattern $x) (get_variable_for_pattern ($x))))
        )
    $subx
)
)
)
)
)
; !(get_variables_for_tree  (link (link (link $s $k) (link $n $m)) (link (link $g $t) (link $p $r))))





; (= (substitute $pattern $variables)
;     (case ($pattern $variables) (
;             ((() $variables) ())
;              ; ( ( ($pattern) () ) $pattern)
;             ((($x) $variables)
;                 (if (== (get-metatype $x) Variable)
;                     (if (== $variables ())
;                         ($x $variables)
;                         ((car-atom $variables) (cdr-atom $variables)) ;; Substitute
;                     )
;                 ($x $variables) ;; Not actually a variable
;             ))
;             ((($link $x $y) $variables)
;                 (let* (
;                         (() (println! (($link $x $y) $variables)))
;                         (($sublink $remains) (if (== (get-metatype $link) Expression) (substitute $link $variables) (substitute ($link) $variables)))
;                         ; (() (println! ($sublink $remains)))
;                         (($subx $remaining) (if (== (get-metatype $x) Expression) (substitute $x $remains) (substitute ($x) $remains)))
;                         ; (() (println! ($subx $remaining)))
;                         (($suby $final) (if (== (get-metatype $y) Expression) (substitute $y $remaining) (substitute ($y) $remaining)))
;                         ; (() (println! ($suby $final)))
;                     )
;                     (($sublink $subx $suby) $final)
;                 )
;             )
;             ((($link $x) $variables)
;                 (let* (
;                         ( ($sublink $remains) (if (== (get-metatype $link) Expression) (substitute $link $variables) (substitute ($link) $variables)))
;                         ( ($subx $remaining) (if (== (get-metatype $x) Expression) (substitute $x $remains) (substitute ($x) $remains)))
;                     )
;                 ( ($sublink $subx) $remaining)
;             ))
;         )
;     )
; )


(= (expand_conjunction_rec $cnjtion $apat $db $ms)
    (let $npat (expand_conjunction_connect $cnjtion $apat (get_variable_for_pattern $cnjtion) (get_variable_for_pattern $apat))
         (checker $db $npat $ms)
        ; $npat
    )
)

(= (expand_conjunction_connect $cnjtion $pattern $cv $pv)
    (let $list (replace_pattern $cnjtion $pattern (combine_lists $cv $pv))
        $list
    )
)
(= (replace_pattern $cnjtion $pattern ())
    ()
)
(= (replace_pattern $cnjtion $pattern $pv2cv)
    (let* (
            (() (println! ($cnjtion , $pattern , $pv2cv)))
            ($exp (substitute $pattern $pv2cv))
            (() (println! $exp))
            ($new_cnjtion (, $cnjtion $exp))
            (() (println! $new_cnjtion))
        )
        $new_cnjtion
    )
)
; !(replace_pattern (INHERITANCE_LINK $X $Y) (INHERITANCE_LINK $Z $W) (superpose (($Z $X) ($Y $W))))

(= (checker $db $pattern $ms) 
    (let*
    (
        ($conjuncts (get-conjuncts $pattern))
        (() (println! $conjuncts))
        ($flat (cons-atom , $conjuncts))
        (() (println! $flat))
        ; ($result (sup-eval $db $flat $ms))
        ($result (sup-eval-log $db $flat $ms))
        (() (println! $result))
        ($final (if $result $pattern ()))
        (() (println! $final))
    )
   $final
    )
)


(= (remove_alpha_similar $list)
    (remove_alpha_similar_helper $list ())
)

(= (remove_alpha_similar_helper ($listHead $listTail) $seen_list)
    (if (== $listTail ())
        ()
        (let* (
                ($matched (collapse (match &self $listHead $listHead)))
                ($seen_list_new (concatTuple ($matched) $seen_list)))
            (if (or (== $matched ()) (does_exist $matched $seen_list)) ;(or (== $matched ()) )but supp evaluation will check this
                (remove_alpha_similar_helper $listTail $seen_list)
                ( $listHead (remove_alpha_similar_helper $listTail $seen_list_new))))
    )
)

(= (expand_conjunction_es_rec $cnjtion $apat $db $ms)
    (pass)
)

; (= (remove_conjuncts_with_redundant_clauses $conjunction) 
;     (let* (
;         ($conjuncts (get-conjuncts $conjunction))
;         (() (println! $conjuncts))
;         ($uselessrem (remove_useless_clauses $conjuncts))
;         (() (println! $uselessrem))
;         ($debconj (replace $uselessrem))
;         (() (println! $debconj))
;         ($unique_conjuncts (unique-atom $debconj))
;         (() (println! $unique_conjuncts))
;         )
;     (if (== (size-atom $conjuncts) (size-atom $unique_conjuncts))
;         $conjunction
;         ()
;     )
;     )
; )

============For running without remove_useless_Clauses=================
(= (remove_conjuncts_with_redundant_clauses $conjunction) 
    (let* (
        ($conjuncts (get-conjuncts $conjunction))
        (() (println! $conjuncts))
        ($unique_conjuncts (unique-atom $conjuncts))
        (() (println! $unique_conjuncts))
        (() (println! (size-atom $conjuncts)))
        (() (println! (size-atom $unique_conjuncts)))
        )
    (if (== (size-atom $conjuncts) (size-atom $unique_conjuncts))
        $conjunction
        ()
    )
    )
)
=========================================================================



(= ( expand_conjunction_disconnect $cnjtion $pattern ) (
        let* (
            ($cnjtion_vars (get_variables_for_tree $cnjtion))
            ($pat_vars  (get_variables_for_tree $pattern))
            ($acvar (alpha_convert $pat_vars $cnjtion_vars))
            ($acpat (let $pat (substitute $pattern $acvar) (car-atom $pat)))
            ($npat (append_pat $cnjtion $acpat))
            ($nclause (remove_redundant_subclauses $npat))
        ) $acvar
))

(= ( append_pat $pat $conj) ( , $pat $conj))

; (Inheritance Allen sodaDrinker)
; (Inheritance Lily sodaDrinker)
; (Inheritance Cason sodaDrinker)
; (Inheritance Abe sodaDrinker)

; (Inheritance Lily ugly)
; (Inheritance Allen ugly)
; (Inheritance Abe ugly)
; (Inheritance Cason ugly)

; (Inheritance Lily man)
; (Inheritance Allen man)
; (Inheritance cason man)
; (Inheritance Abe man)

; ; (CandidatePattern (Inheritance $x $y) 12)
; ; (CandidatePattern (Inheritance $l ugly) 4)
; ; (CandidatePattern (Inheritance $s sodaDrinker) 4)
; ; (CandidatePattern (Inheritance $t man) 4)
; (CandidatePattern (Inheritance Z (S Z)) 12)
; (CandidatePattern (Inheritance Z ugly) 4)
; (CandidatePattern (Inheritance Z sodaDrinker) 4)
; (CandidatePattern (Inheritance Z man) 4)
; !(match &self $pattern $pattern)

; !(expand_conjunction (Inheritance $X $Y) (Inheritance $Z $W) &self 4)

------------------------------------------------
;; do-conjunct
------------------------------------------------
;; function to expand the conjunctions of the patterns and create conjunctions of any amount of clauses

;; parameters:
;; $db: the database that is loaded and cleaned of the stdlib functions.
;; $cndb: the candidate patterns space
;; $conjunct: the conjunctions part of the pattern
;; $ms: minimum support
;; (S $K)/ Z: a debruijin index to check if we are in the last iteration of the recursion.

;steps:
;; 1: get the matches of the candidate patterns in the database
;; 2: expand the conjunctions with the matches and the database
;; 3: replace the variables with the debruijin index
;; 4: remove any redundant clauses from the conjunctions
;; 5: if we are in the last iteration of the recursion, return the conjunctions else call the function again with the new conjunctions and the debruijin index.

; returns:
; a superpose of conjunctions that satisfy the minimum support and are not redundant.
;(: do-conjunct space space conj_pattern Number debruijin-index Atom)

; (= (do-conjunct $db $cndb $coming_conj  $ms Z)
;     (if (== $coming_conj ())
;         ()
;     (let* (
;         (() (println! ("==== Build conjunction with depth 0 ====" $coming_conj)))
;         ($conjunct (replacev $coming_conj))
;         ($matches (match $cndb (CandidatePattern $pattern $cnt) (replacev $pattern)))
;         ($listconj (expand_conjunction $conjunct $matches $db $ms 2 False))
;         (() (println! ("====list_conj" $listconj)))
;         ($fitlered (remove_conjuncts_with_redundant_clauses $listconj))
;         (() (println! ("==== Filtered conjunctions ====" $fitlered)))
;         ($final (replace $fitlered))

;     )
;     $final
;     ))
; )

; (= (do-conjunct $db $cndb $coming_conj $ms (S $K))
;     (if (== $coming_conj ())
;         ()
;     (let* (
;         (() (println! ("==== Build conjunction with depth greater than 0 =====" $coming_conj)))
;         ($conjunct (replacev $coming_conj))
;         ($matches (match $cndb (CandidatePattern $pattern $cnt) (replacev $pattern)))
;         ($listconj (expand_conjunction $conjunct $matches $db $ms 2 False))
;         ($fitlered (remove_conjuncts_with_redundant_clauses $listconj))
;         ($conj (do-conjunct $db $cndb $fitlered $ms $K))
;     )
;     $conj
;     ))
; )

; !(do-conjunct &db &cndb (, (Inheritance $X $Y) (Inheritance $Z $W)) 2 Z)
(= (converter $x)
    (let $res (replace $x) $res)
)
================To Run without using remove_useless_clauses=========================
(= (do-conjunct $db $cndb $coming_conj $ms Z)
    (if (== $coming_conj ()) ()
    (let* (
        (() (println! ("==== Build conjunction with depth 0 ====" $coming_conj)))
        ($conjunct (replacev $coming_conj))
        (() (println! ("==== Conjunct after replacev ====" $conjunct)))
        ($matches (match $cndb (CandidatePattern $pattern $cnt) (replacev $pattern)))
        ($listconj (expand_conjunction $conjunct $matches $db $ms))
        (() (println! ("====list_conj" $listconj)))
        ($debconj (converter $listconj))
        (() (println! ("==== Debconjunctions ====" $debconj)))
        ($fitlered (remove_conjuncts_with_redundant_clauses $debconj))
        (() (println! ("==== Filtered conjunctions ====" $fitlered)))
    )
    $fitlered
    ))
)

(= (do-conjunct $db $cndb $coming_conj $ms (S $K))
    (if (== $coming_conj ())
        ()
    (let* (
        (() (println! ("==== Build conjunction with depth greater than 0 =====" $coming_conj)))
        ($conjunct (replacev $coming_conj))
        (() (println! ("==== Conjunct after replacev ====" $conjunct)))
        ($matches (match $cndb (CandidatePattern $pattern $cnt) (replacev $pattern)))
        ($listconj (expand_conjunction $conjunct $matches $db $ms))
        (() (println! ("====list_conj" $listconj)))
        ($debconj (converter $listconj))
        (() (println! ("==== Debconjunctions ====" $debconj)))
        ($fitlered (remove_conjuncts_with_redundant_clauses $debconj))
        (() (println! ("==== Filtered conjunctions ====" $fitlered)))
        ($varconj (replacev $fitlered))
        ($conj (do-conjunct $db $cndb $varconj $ms $K))
    )
    $conj
    ))
)
===================================================================================

--------------------------------------------
;;  formatter
--------------------------------------------
;; function to format the patterns with thier support annotation.
;; 1: get the matches of the conjunctions in the database
;; 2: sort the conjunctions with a custom sorting function and get only the unique conjunctions from the sorte results
;; 3: create a flattened conjunction  using cons-atom with the sorted conjunctions and ,.
;; 4: add the results to the knowledge base with their support
;(: formatter (-> space space Atom ))

(= (formatter $conjspace $dbspace) 
    (let* (
        (() (println! "==== Formating  started ====="))
        ($sorted (unique (match $conjspace $pattern (let $conj (get-conjuncts $pattern) (sort $conj)))))
        (() (println! $sorted))
        ($res (cons-atom , $sorted))
        ($var (replacev $res))
        ($sup (sup-num $dbspace $var))
        ($final (supportOf $var $sup))
    )
    $final
)
)


-----------------------------------------------
;; conjunct 
-----------------------------------------------
;; function to extract candidate patterns and call do-conjunct 
;(: conjunct (-> space space space Number Number Atom))

(= (conjunct $dbspace $cndpspace $conjspace $minsup $depth )   
     (match $cndpspace (CandidatePattern $pattern $cnt)
                   (let* (
                        (() (println! ("==== Conjuntion expansion started" $pattern)))
                        ($conj  (do-conjunct $dbspace $cndpspace  $pattern $minsup (fromNumber $depth)))
                        ($reduct (if (== $conj ()) () (add-reduct $conjspace $conj)))
                        )
                        $reduct
                        ; $conj
                    )
        ))

; !(conjunct &self &self &self 3 0)
; !(substitute (Inheritance $var1 $sodaDrinker) ($var0 $var2))
; !(real-substitute-func (Inheritance $var1 sodaDrinker) ($var0) ()) 
; !(replace (, (Inheritance $var0 var1) (Inheritance $var1 var2)))

; (= (checking $coming $conj $pv)
;     (if (== $coming_conj ())
;         ()
;     (let* (
;         ($sub (substitute $conj $pv))
;         (() (println! ("==== Substitute ====" $sub)))
;         ($coming_conj (, $coming $sub))
;         (() (println! ("==== Coming conjunctions ====" $coming_conj)))
;         ($debconj (replace $coming_conj))
;         (() (println! ("==== Debconjunctions ====" $debconj)))
;     )
;     $debconj
;     ))
; )


; !(checking (Inheritance $var0 $var1) (Inheritance $var0 $var1) ($var0))
; !(substitute (Inheritance $var0 $var1) ($var0 $var2))