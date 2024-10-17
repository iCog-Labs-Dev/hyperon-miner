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
 ;  *   (, (Inheritance X Y) (Inheritance X Y))
 ;  *
 ;  * It will also only include patterns with minimum support ms
 ;  * according to db, and perform alpha-conversion when necessary.
 ;  *
 ;  * mv is the maximum number of variables allowed in the resulting
 ;  *    patterns.
 ;  *
 ;  */

! (register-module! ../../experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self conj-exp)

 ; The starting point for the conjunction expansion. It passes
 ; the Alpha Converted pattern (if necessary) to the expand_conjunction functions.
 ; if it passes the minimum variable check

(= (expand_conjunction $cnjtion $pattern $db $ms $mv $es)
    (let* (
            ($apat (let $alpha_vars
                    (alpha_convert (get_variables_for_tree $pattern) (get_variables_for_tree $cnjtion))
                    (let $extract (substitute $pattern $alpha_vars) (car-atom $extract)))))
        (if (> (let* (
                        ($temp (get_variables_for_tree $pattern))
                        ($temp2 (get_variables_for_tree $cnjtion)))
                    (+ (count-atom-element  $temp) (count-atom-element  $temp2))) $mv)
            (if $es
                (expand_conjunctin_es_rec $cnjtion $apat $db $ms)
                (expand_conjunction_rec $cnjtion $apat $db $ms))
            ())
    )
)

(= (count-atom-element $atom) (if (== $atom ()) 0 (+ 1 (count-atom-element (cdr-atom $atom)))))

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

 ;! (get_variables_for_tree  (Inheritance (Human $X) (Inheritance $Y (Human $Z))))

(= (substitute $pattern $variables)
    (if (== $variables ())
        ()
        (if (== $pattern ())
            (substitute $pattern (cdr-atom $variables))
            (let* (
                    ($head (car-atom $pattern))
                    ($tail (cdr-atom $pattern)))

                (if (== (get-metatype $head) Expression)
                    (case $head
                        ( ( ($link $x $y) (concatTuple
                                    (substitute $head $variables)
                                    (substitute $tail (let $temp (cdr-atom $variables) (cdr-atom $temp)))))
                            ( ($link $x ) (concatTuple
                                    (substitute $head $variables)
                                    (substitute $tail (cdr-atom $variables))))))

                    (if (== (get-metatype $head) Variable)
                        (concatTuple ( (car-atom $variables)) (substitute $tail (cdr-atom $variables)))
                        ( (concatTuple ($head) (substitute $tail $variables)))))))
    )
)

 ;! (substitute (Inheritance (Human $X) (Inheritance $Y (Human $Z))) ($A $B $C))

 ;############################################################
 ;###############   alpha convert  ###########################
 ;############################################################

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

 ; ! (address_conflict ($A $B $F $A $F) ($A $C $D $F))

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

 ;! (alpha_convert ($A $B $F $A $F) ($A $C $D $F))
 ; ! (alpha_convert ($A $B $C ) ($X $Y $Z))

 ;#############################################################
 ;############   alpha convert end  ###########################
 ;#############################################################

(= (expand_conjunction_rec $cnjtion $apat $db $ms)
    (let $npat (expand_conjunction_connect $cnjtion $apat (get_variables_for_tree $cnjtion) (get_variables_for_tree $apat))
        (checker $db (let $single (collapse $npat) (car-atom $single)) $ms))
)

(= (expand_conjunction_connect $cnjtion $pattern $cv $pv)
    (let $list (replace_pattern $cnjtion $pattern (combine_lists $cv $pv)) (remove_alpha_similar $list))
)

(= (replace_pattern $cnjtion $pattern $pv2cv)
    (if (== $pv2cv ())
        ()
        ( (, $cnjtion (let $exp (substitute $pattern (car-atom $pv2cv)) (car-atom $exp)))
            (replace_pattern $cnjtion $pattern (cdr-atom $pv2cv)))
    )
)

(= (checker $db () $ms) ())
(= (checker $db ($x $xs) $ms)
    (if (support_evaluation $db $x $ms)
        ($x (checker $db $xs $ms))
        (checker $db $xs $ms)
    )
)

(= (support_evaluation $db $pattern $ms)
    (let $sup (counter $db $pattern)
        (if (>= $sup $ms)
            True
            False)
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

(= ( expand_conjunction_disconnect $cnjtion $pattern ) (
        let* (
            ($cnjtion_vars (get_variables_for_tree $cnjtion))
            ($pat_vars  (get_variables_for_tree $pattern))
            ($acvar (alpha_convert $pat_vars $cnjtion_vars))
            ($acpat (let $pat (substitute $pattern $acvar) (car-atom $pat)))
            ($npat (append_pat $cnjtion $acpat))
            ($nclause (remove_redundant_subclauses $npat))
        ) $nclause
))

(= ( append_pat $pat $conj) ( , $pat $conj))

 ; ! (expand_conjunction_disconnect (INHERITANCE_LINK $X $Y) (LIST_LINK $X $B))

 ;##############
 ;# Test cases #
 ;##############

 ;Populate the Atomspace with some data

(INHERITANCE_LINK A B)
(LIST_LINK A B)
(LIST_LINK A C)
(LIST_LINK B C)
(INHERITANCE_LINK A D)
(INHERITANCE_LINK X Y)
(LIST_LINK Y C)
(INHERITANCE_LINK X D)

 ;(expand_conjunction_inputs cnjtion pattern db ms mv es)
! (expand_conjunction (INHERITANCE_LINK $X $Y) (LIST_LINK $X $B) &self 1 2 False)
 ; ! (match &self (, (INHERITANCE_LINK $X $Y) (LIST_LINK $A $Y)) (, (INHERITANCE_LINK $X $Y) (LIST_LINK $A $Y))) ; This is alpha similar to (X Y) (X Y) COMB