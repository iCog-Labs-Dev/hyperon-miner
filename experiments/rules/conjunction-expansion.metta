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

! (register-module! ../../experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:variable-combinations)
; ! (import! &self conj-exp)

 ; The starting point for the conjunction expansion. It passes
 ; the Alpha Converted pattern (if necessary) to the expand_conjunction functions.
 ; if it passes the minimum variable check

(= (expand_conjunction $cnjtion $pattern $db $ms $mv $es)
     ; (let* (
     ;         ($alpha_vars (alpha_convert (get_variables_for_tree $pattern) (get_variables_for_tree $cnjtion)))
     ;         ($extract (substitute $pattern $alpha_vars))
     ;         ($apat (car-atom $extract))
     ;     )

     ; ($apat (let $alpha_vars
     ;         (alpha_convert (get_variables_for_tree $pattern) (get_variables_for_tree $cnjtion))
     ;         (let $extract (substitute $pattern $alpha_vars) (car-atom $extract)))))
     ; (if (> (let* (
     ;                 ($temp (get_variables_for_tree $pattern))
     ;                 ($temp2 (get_variables_for_tree $cnjtion)))
     ;             (+ (count-atom-element  $temp) (count-atom-element  $temp2))) $mv)
     ; )
    (if $es
        (expand_conjunctin_es_rec $cnjtion $pattern $db $ms)
        (expand_conjunction_rec $cnjtion $pattern $db $ms)
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

;  ! (get_variables_for_tree  (LIST_LINK (INHERITANCE_LINK (INHERITANCE_LINK (INHERITANCE_LINK $S $K) (INHERITANCE_LINK $n $m)) (INHERITANCE_LINK (INHERITANCE_LINK $S $K) (INHERITANCE_LINK $n $m))) (INHERITANCE_LINK (INHERITANCE_LINK $g $t) (INHERITANCE_LINK $p $r))))


(= (get_variable_for_pattern $pattern)
    (case ($pattern) (
            ( (()) ())
             ; ( ( ($pattern) () ) $pattern)
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
         ; ( ($subx $remaining))
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


(= (substitute $pattern $variables)
    (case ($pattern $variables) (
            ( ( () $variables) ())
             ; ( ( ($pattern) () ) $pattern)
            ( ( ($x) $variables)
                (if (== (get-metatype $x) Variable)
                    (if (== $variables ())
                        ($x $variables)
                        ( (car-atom $variables) (cdr-atom $variables)) ;; Substitute
                    )
                ($x $variables) ;; Not actually a variable
            ))
    ( (  ($link $x $y) $variables)
        (let* (
                ( ($sublink $remains) (if ( == ( get-metatype $link ) Expression) (substitute $link $variables) (substitute ($link) $variables)))
                ( ($subx $remaining) (if ( == ( get-metatype $x ) Expression) (substitute $x $remains) (substitute ($x) $remains)))

                ( ($suby $final) (if (== (get-metatype $y) Expression) (substitute $y $remaining) (substitute ($y) $remaining)))
            )
        ( ($sublink $subx $suby) $final)
    )
)
( ( ($link $x) $variables)
    (let* (
            ( ($sublink $remains) (if ( == ( get-metatype $link ) Expression) (substitute $link $variables) (substitute ($link) $variables)))
            ( ($subx $remaining) (if ( == ( get-metatype $x ) Expression) (substitute $x $remains) (substitute ($x) $remains)))
        )
    ( ($sublink $subx) $remaining)
)
)
)
)
)

;  ! (substitute ($LIST_LINK (INHERITANCE_LINK (INHERITANCE_LINK $S $K) (INHERITANCE_LINK $n $m)) (INHERITANCE_LINK (INHERITANCE_LINK $g $t) (INHERITANCE_LINK $p $r))) ($R-D1737102179 $A $b $c $d $e $f $h))

 
 ;############################################################
 ;###############   alpha convert  ###########################
 ;############################################################

(= (alpha_convert  $pattern_vars $cnjtion_vars)
    (extract_values (consolidate_keys (address_conflict $pattern_vars $cnjtion_vars)))
)

 ; ! (get_variables_for_tree (INHERITANCE_LINK $X $Y))
 ; ! (get_variables_for_tree (LIST_LINK $A $B))
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


 ;#############################################################
 ;############   alpha convert end  ###########################
 ;#############################################################

(= (expand_conjunction_rec $cnjtion $apat $db $ms)
    (let $npat (expand_conjunction_connect $cnjtion $apat (get_variable_for_pattern $cnjtion) (get_variable_for_pattern $apat))
         (checker $db $npat $ms)
        ;  $npat
    )
)

(= (expand_conjunction_connect $cnjtion $pattern $cv $pv)
    (let $list (replace_pattern $cnjtion $pattern (combine_lists $cv $pv))
        ; (remove_alpha_similar $list)
        $list
    )
)
(= (replace_pattern $cnjtion $pattern ())
    ()
)
(= (replace_pattern $cnjtion $pattern $pv2cv)
    (let* (
            ; ($sup (superpose $pv2cv))
            ; ($exp (substitute $pattern $sup))
            ($exp (substitute $pattern $pv2cv))
            ($new_cnjtion (, $cnjtion (car-atom $exp)))
        )
        $new_cnjtion
)
)

(= (checker $db $pattern $ms) 
    (if (sup-eval $db $pattern $ms)
        $pattern
        empty
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

    



(= (remove_conjuncts_with_redundant_clauses $conjunction) 
    (let* (
        ($conjuncts (get-conjuncts $conjunction))
        ($unique_conjuncts (unique-atom $conjuncts))
        )
    (if (== (size-atom $conjuncts) (size-atom $unique_conjuncts))
        $conjunction
        ; (remove_conjuncts_with (unique $conjunction))
        ()
    )
    )
)


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

 ; ! (expand_conjunction_disconnect (INHERITANCE_LINK A $X) (LIST_LINK $X B))
;  !(expand_conjunction (Inheritance $x human) (Inheritance $y sodaDrinker) &db 2 2 False)


 ;##############
 ;# Test cases #
 ;##############

 ;Populate the Atomspace with some data

; (INHERITANCE_LINK A B)
; (LIST_LINK A B)
; (LIST_LINK A C)
; (LIST_LINK B C)
; (INHERITANCE_LINK A D)
; (INHERITANCE_LINK X Y)
; (LIST_LINK Y C)
; (INHERITANCE_LINK X D)

 ;(expand_conjunction_inputs cnjtion pattern db ms mv es)
; !(expand_conjunction (,(INHERITANCE_LINK $X $Y) (LIST_LINK A $D)) (LIST_LINK $G $F) &self 5 2 False)
