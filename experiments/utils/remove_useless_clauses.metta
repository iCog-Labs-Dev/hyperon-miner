
(= (subtractions $list1 $list2)
    (if (== $list1 ())
        ()
        (let* (
                ($head1 (car-atom $list1))
                (true (println! (here in subtraction $head1 $list2)))
                ($tail1 (cdr-atom $list1))
                ($rest (subtractions $tail1 $list2))
                )
            (if (does_exist $head1 $list2)
                $rest
                (cons-atom $head1 $rest))
        )
    )
)

(= (filter_in_others $var $others)
    ((map-atom $others $x (if (== (get-metatype $x) Variable) (if (== $x $var) Pass $x) (if (== (get-metatype $x) Expression) (filter_in_others $var $x) $x)) ) $others)
)

(= (filter_foreach_var $var $others)
    (let* (
        ($other (superpose $others))
        (($filtered $pat) (eval (filter_in_others $var $other)))
        ($changed (call_replace ($filtered $pat)))
        ($uniq (unique-atom $changed))
        ($ov (if (== (size-atom $uniq) (size-atom ($filtered $pat))) $pat ()))
    )
    $ov
    )
)

(= (fold $unfiltered $acc)
    (if (== $unfiltered ())
        $acc
        (let*(
                ($head (car-atom $unfiltered))
                ($res (if (== $head ()) 
                            (fold (cdr-atom $unfiltered) $acc) 
                            (fold (cdr-atom $unfiltered) (union-atom $acc ($head)))))
                )
                $res
            )
    )
)
        
(= (remove_Abstract_clauses $pattern)
    (let*(
        ($unfolded (map-atom $pattern $clause (check_others $clause $pattern)))
        ($final (fold $unfolded ()))
        )
        $final
    )
)
(= (clause_others_check $clause $pattern)
    (let*(
        ($others (eval (subtraction-atom $pattern ($clause))))
        ($res (is_more_abstract_for_each_var $clause $others))
        )
        $res
    )
)

(= (check_others $clause $pattern)
    (let $res (clause_others_check $clause $pattern) (if (== $res False) $clause ()))
)

(= (is_more_abstract_for_each_var $clause $others)
    (let*
        (
            ($vars (get_variable_for_pattern $clause))
            ($result (is_more_abstractn $vars $others))
            ($trace (if (== $result False) Pass (collect_filtered_per_var $vars $others)))
            ($isAbstractForeachVar (checker $trace $clause))
        )
        $isAbstractForeachVar
    )
)

(= (checker $trace $clause)
    (if (== $trace ())
        True
        (if (== $trace Pass)
            False
            (let*(
                
                (($headvar $bool $headov) (car-atom $trace))
                
                (($tail) (cdr-atom $trace))
                ($fold (fold $headov ()))
                ($isAbstract (all_of $headvar $fold $clause))
                ($rem (if (== $isAbstract False) False (checker $tail $clause)))
            )$rem)
        )
    )
)

(= (all_of $var $ov $clause)
    (if (== $ov ())
        True
        (let*(
            ($head (car-atom $ov))
            ($isAbstract (is-blk-syntax-more-abstract ($clause) ($head) $var))
            ($result (if (== $isAbstract False)
                        False
                        (all_of $var (cdr-atom $ov) $clause)
                        ))
        )$result
        )
    )
)


(= (is_more_abstractn $vars $others)
      (if (== $vars ())
          True
          (let* (
              ($head (car-atom $vars))
              (($isMore $filtered $var) (is_more_abstract_for_var $head $others))
              ($next (if (== $isMore False)
                        False
                        (is_more_abstractn (cdr-atom $vars) $others)))
          )
          $next)))

(= (collect_filtered_per_var $vars $others)
  (if (== $vars ())
      ()
      (let* (
          ($head (car-atom $vars))
          (($isMore $filtered $var) (is_more_abstract_for_var $head $others))
          ($rest (collect_filtered_per_var (cdr-atom $vars) $others))
      )
      (($var $isMore $filtered) $rest))))


(= (is_more_abstract_for_var $var $others)
    (let* (
        ($filtered (collapse (filter_foreach_var $var $others)))
        ($isMoreAbstract (if (== (eval (unique-atom $filtered)) (())) False True))
    )
    ($isMoreAbstract $filtered $var)
    )
)

; =========================================================================================

(= (constant_clause_check $clause)
    (let $vars (get_variable_for_pattern $clause) (if (== $vars ()) () $clause))
)
(= (remove_constant_clauses $pattern)
    (let* (
        ($unfolded (map-atom $pattern $clause (constant_clause_check $clause)))
        ($final (fold $unfolded ()))
    )
    $final)
)

; ==========================================================================================

(= (is_clause_in_pat $clause $pattern) 
    (
        let* 
            (
                (($_ $head $tail) $pattern )
                ($headCanContinue (== (get-metatype $head) Expression))
                ($tailCanContinue (== (get-metatype $head) Expression))
                ($weHaveGot (or (== $clause $head) (== $clause $tail)))
            )

            (
                if $weHaveGot
                    True
                    (
                        if $headCanContinue
                            (
                                if $tailCanContinue
                                    (let ($a $b) (collapse (superpose ((is_clause_in_pat $clause $head) (is_clause_in_pat $clause $tail)))) (or $a $b))
                                    (is_clause_in_pat $clause $head)
                            )
                            ( 
                                if $tailCanContinue
                                    (is_clause_in_pat $clause $tail)
                                    False
                            ) 
                    )
            )
            
    )
)

(= (is_pat_in_otherpat $clause $others) 
  (if (== $others ())
        False
        (let*(
            
            ($head (car-atom $others)) 
            ($isinpat (is_clause_in_pat $clause $head))
            ($result (if (== $isinpat True)
                True
                (is_pat_in_otherpat $clause (cdr-atom $others))
            ))
        )$result
        )
    )
)

(= (clause_others_check_for_subtree $clause $pattern)
    (let*(   
        ($others (eval (subtraction-atom $pattern ($clause))))  
        ($res (is_pat_in_otherpat $clause $others))
        
        )
        (is_pat_in_otherpat $clause $others)
    )
)

(= (check_res $clause $pattern)
   (let $res (clause_others_check_for_subtree $clause $pattern) (if (== $res False) $clause ()))
)



(= (remove_redundant_subclause $pattern)
    (let*(
        ($unfolded (map-atom $pattern $clause (check_res $clause $pattern)))
        ($final (fold $unfolded ()))
        )
        $final
    )
)

; ==========================================================================================

(= (remove_useless_clauses $pattern)
    (let*(
        ($constant_removed (remove_constant_clauses $pattern))
        ($subtree_removed (remove_redundant_subclause $constant_removed))
        ($abstract_removed (remove_Abstract_clauses $subtree_removed))
    )
    $abstract_removed
    )
)

; !(remove_useless_clauses ((Inheritance $x lily) (Inheritance $x y) (Inheritance $x by)))
; !(remove_useless_clauses ((Inheritance $x c1) (Inheritance c2 $y) (Inheritance $x $y)))