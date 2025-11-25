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

; ! (register-module! ../../experiments)
; ! (import! &self experiments:utils:common-utils)
! (import! &self conj-exp)
! (import! &self freq-pat)

 ; The starting point for the conjunction expansion. It passes
 ; the Alpha Converted pattern (if necessary) to the expand_conjunction functions.
 ; if it passes the minimum variable check

(= (expand_conjunction $cnjtion $pattern $db $ms $ac)
    (if $ac
        (let* (
            ($cnjtion_vars (get_variable_for_pattern $cnjtion))
            ($pattern_vars (get_variable_for_pattern $pattern))
            ($alpha_converted (alpha_convert $pattern_vars $cnjtion_vars))
            ($apattern (substitutec $pattern $alpha_converted))
        )
        (expand_conjunction_rec $cnjtion $apattern $db $ms)
        )
        (expand_conjunction_rec $cnjtion $pattern $db $ms)
    )
)


(= (get_variable_for_pattern $pattern)
    (if (== $pattern ())
        ()
        (let* (
                ($head (car-atom $pattern))
                ($tail (cdr-atom $pattern)))

            (if (== (get-metatype $head) Expression)
                (concatTuple (get_variable_for_pattern $head)
                    (get_variable_for_pattern $tail))
                (if (== (get-metatype $head) Variable)
                    (concatTuple
                        ($head)
                        (get_variable_for_pattern $tail))

                    (get_variable_for_pattern $tail))))
    )
)




(= (substitutec $pattern $sub)
   (if (== $pattern ())
       (() $sub) ;; base case: empty
       (let* (
               ($head (if (== (get-metatype $pattern) Variable) (car-atom ($pattern)) (car-atom $pattern)))
               ($tail (if (== (get-metatype $pattern) Variable) (cdr-atom ($pattern)) (cdr-atom $pattern)))
               ;; process head
               (($newhead $after-head-subs)
                  (if (== (get-metatype $head) Variable)
                      (if (== $sub ())
                          ($head $sub) ;; no subs left
                          ((car-atom $sub) (cdr-atom $sub)))
                      (if (== (get-metatype $head) Expression)
                          ;; nested list → recurse, passing whole $sub
                          (substitutec $head $sub)
                          ;; constant atom
                          ($head $sub))
                  )
               )

               (($newtail $remaining)
                  (substitutec $tail $after-head-subs))
             )
         ((cons-atom $newhead $newtail) $remaining)
       )
   )
)

 
 ==============  alpha convert  =======================

(= (alpha_convert  $pattern_vars $cnjtion_vars)
    (extract_values (consolidate_keys (address_conflict $pattern_vars $cnjtion_vars)))
)

(= (address_conflict $pattern_vars $cnjtion_vars)
    (if (== $pattern_vars ())
        ()
        (let* (
                ($head (car-atom $pattern_vars))
                ($tail (cdr-atom $pattern_vars)))
            (if (does_exist $head $cnjtion_vars)
                (concatTuple ( ($head (generateRandomVar))) (address_conflict $tail $cnjtion_vars ))
                (concatTuple ( ($head $head)) (address_conflict $tail $cnjtion_vars))))
    )
)

(= (does_exist $var $list_vars)
    (if (== $list_vars ())
        False
        (if (== $var (car-atom $list_vars))
            True
            (does_exist $var (cdr-atom $list_vars)))
    )
)


(= (consolidate_keys $input_list)
    (let* (
            ($result ())
            ($seen_keys ()))
        (consolidate_helper $input_list $result $seen_keys)
    )
)

(= (consolidate_helper $input_list $result $seen_keys)
    (if (== $input_list ())
        $result
        (let* (
                ($pair (car-atom $input_list))
                ($key (car-atom $pair))
                ($value (cdr-atom $pair)))
            (if (does_exist $key $seen_keys)
                (consolidate_helper (cdr-atom $input_list)
                    (concatTuple ( ($key (let $temp (get_value $key $result) (car-atom $temp)))) $result)
                    $seen_keys)
                (let* (
                        ($new_result (let $temp (cons-atom $key $value) (cons-atom $temp $result)))
                        ($new_seen_keys (cons-atom $key $seen_keys)))
                    (consolidate_helper (cdr-atom $input_list) $new_result $new_seen_keys))))
    )
)

(= (get_value $key $list)
    (if (== $list ())
        ()
        (if (== $key (let $temp (car-atom $list) (car-atom $temp)))
            (let $temp2 (car-atom $list) (cdr-atom $temp2))
            (get_value $key (cdr-atom $list)))
    )
)

(= (extract_values $input_list)
    (extract_helper $input_list ())
)

(= (extract_helper $input_list $values)
    (if (== $input_list ())
        $values
        (let* (
                ($pair (car-atom $input_list))
                ($value (cdr-atom $pair))
                ($tail (cdr-atom $input_list)))
            (extract_helper $tail (cons-atom (car-atom $value) $values)))
    )
)

 ================= alpha convert end ================================

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
            (() (println! (here in replace_pattern $pv2cv)))
            ($sup (superpose $pv2cv))
            (() (println! (here in replace_pattern $sup)))
            ($exp (substitutec $pattern $sup))
            ($new_cnjtion (, $cnjtion (car-atom $exp)))
        )
        $new_cnjtion
)
)

(= (checker $db $pattern $ms) 
    (let*
    (
        ($conjuncts (get-conjuncts $pattern))
        ($flat (cons-atom , $conjuncts))
        ($result (sup-eval $db $flat $ms))
        ($final (if $result $pattern ()))
    )
   $final
    )
)


(= (remove_conjuncts_with_redundant_clauses $conjunction) 
    (let* (
        ($conjuncts (get-conjuncts $conjunction))
        ($uselessrem (remove_useless_clauses $conjuncts))
        ($debconj (replace $uselessrem))
        ($unique_conjuncts (unique-atom $debconj))
        )
    (if (== (size-atom $conjuncts) (size-atom $unique_conjuncts))
        $conjunction
        ()
    )
    )
)

============For running without remove_useless_Clauses=================
; (= (remove_conjuncts_with_redundant_clauses $conjunction) 
;     (let* (
;         ($conjuncts (get-conjuncts $conjunction))
;         ($unique_conjuncts (unique-atom $conjuncts))
;         )
;     (if (== (size-atom $conjuncts) (size-atom $unique_conjuncts))
;         $conjunction
;         ()
;     )
;     )
; )
=========================================================================

 
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

(= (do-conjunct $db $cndb $coming_conj $ms Z)
    (if (== $coming_conj ())
        ()
    (let* (
        (() (println! ("==== Build conjunction with depth 0 ====" $coming_conj)))
        ($conjunct (replacev $coming_conj))
        ($matches (match $cndb $pattern (replacev $pattern)))
        ($listconj (expand_conjunction $conjunct $matches $db $ms False))
        ($fitlered (remove_conjuncts_with_redundant_clauses $listconj))
        ($final (replace $fitlered))

    )
    $final
    ))
)

(= (do-conjunct $db $cndb $coming_conj $ms (S $K))
    (if (== $coming_conj ())
        ()
    (let* (
        (() (println! ("==== Build conjunction with depth greater than 0 =====" $coming_conj)))
        ($conjunct (replacev $coming_conj))
        ($matches (match $cndb $pattern (replacev $pattern)))
        ($listconj (expand_conjunction $conjunct $matches $db $ms False))
        ($fitlered (remove_conjuncts_with_redundant_clauses $listconj))
        ($conj (do-conjunct $db $cndb $fitlered $ms $K))
    )
    $conj
    ))
)
================To Run without using remove_useless_clauses=========================
; (= (do-conjunct $db $cndb $coming_conj  $ms Z)
;     (if (== $coming_conj ()) ()
;     (let* (
;         (() (println! ("==== Build conjunction with depth 0 ====" $coming_conj)))
;         ($conjunct (replacev $coming_conj))
;         ($matches (match $cndb $pattern (replacev $pattern)))
;         ($listconj (expand_conjunction $conjunct $matches $db $ms False))
;         (() (println! ("====list_conj" $listconj)))
;         ($debconj (replace $listconj))
;         ($fitlered (remove_conjuncts_with_redundant_clauses $debconj))
;         (() (println! ("==== Filtered conjunctions ====" $fitlered)))
;     )
;     $fitlered
;     ))
; )

; (= (do-conjunct $db $cndb $coming_conj $ms (S $K))
;     (if (== $coming_conj ())
;         ()
;     (let* (
;         (() (println! ("==== Build conjunction with depth greater than 0 =====" $coming_conj)))
;         ($conjunct (replacev $coming_conj))
;         ($matches (match $cndb $pattern (replacev $pattern)))
;         ($listconj (expand_conjunction $conjunct $matches $db $ms False))
;         ($debconj (replace $listconj))
;         ($fitlered (remove_conjuncts_with_redundant_clauses $debconj))
;         ($varconj (replacev $fitlered))
;         ($conj (do-conjunct $db $cndb $varconj $ms $K))
;     )
;     $conj
;     ))
; )
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

(= (formatter $conjspace $cndpspace $dbspace $cnj) 
    (if $cnj
        (let* (
            (() (println! "==== Formating  started ====="))
            ($sorted (unique (match $conjspace $pattern (sort_conj $pattern))))
            ($res (cons-atom , $sorted))
            ($var (replacev $res))
            ($sup (sup-num $dbspace $var))
            ($final (supportOf $var $sup))
        )
        $final
        )
        (let* (
            (() (println! "==== Formating  started ====="))
            ($res (match $cndpspace $pattern $pattern))
            ($var (replacev $res))
            ($sup (sup-num $dbspace $var))
            ($final (supportOf $var $sup))
        )
        $final
        )

    )
)


-----------------------------------------------
;; conjunct 
-----------------------------------------------
;; function to extract candidate patterns and call do-conjunct 
;(: conjunct (-> space space space Number Number Atom))

(= (conjunct $dbspace $cndpspace $conjspace $minsup $depth)   
                   (let* (
                        ($pattern (match $cndpspace $patterns $patterns))
                        (() (println! ("==== Conjuntion expansion started" $pattern)))
                        ($conj  (do-conjunct $dbspace $cndpspace  $pattern $minsup (fromNumber $depth)))
                        ($reduct (if (== $conj ()) () (add-reduct $conjspace $conj)))
                        )
                        $reduct
                    )
        )