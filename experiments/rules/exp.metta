! (register-module! ../../experiments)
! (import! &self conjunction-expansion)
! (import! &self use-python)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:rules:freq-pat)
! (import! &self experiments:utils:index_to_var)
! (import! &self experiments:utils:blk-abstractness)
! (import! &self experiments:utils:gen_partition)

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
        ; ( (filter-atom $unfiltered $atom (eval (> (size-atom $atom) 0))))
; !(fold ((Inheritance Lily $Z1) (Inheritance Abe $Allen) ()) ())
; !(get-metatype ())
; (= (is_more_abstract_for_each_var $clause $others)
;     (let* (
;         ($vars (get_variable_for_pattern $clause))
;         ($var (superpose $vars))
;         ($filtered (collapse (filter_foreach_var $var $others)))
;         ($isMoreAbstract (if (== (eval (unique-atom $filtered)) (())) False True))
;         ($isMoreAbstract1 (if (== (eval (intersection-atom $isMoreAbstract (False))) ()) True False))
;     )
;     $isMoreAbstract
;     ; $filtered
;     )
; )

; (= (start $clause $others)
;     (let*
;         (
;             ($vars (get_variable_for_pattern $clause))
;             ($result (collapse (is_more_abstract $vars $others True)))
;         )
;         $result
;     )
; )
(= (remove_Abstract_clauses $pattern)
    (let*(
        ($unfolded (map-atom $pattern $clause (if (== (clause_others_check $clause $pattern) False) $clause ())))
        ; ($unfolded (map-atom $pattern $clause (clause_others_check $clause $pattern)))
        ($final (fold $unfolded ()))
        )
        $final
        ; $unfolded
    )
)
(= (clause_others_check $clause $pattern)
    (let*(
        ($others (eval (subtraction-atom $pattern ($clause))))
        ($res (start $clause $others))
        )
        $res
    )
)
(= (start $clause $others)
    (let*
        (
            ($vars (get_variable_for_pattern $clause))
            ($result (is_more_abstractn $vars $others))
            ($trace (if (== $result False) Pass (collect_filtered_per_var $vars $others)))
            ($isAbstractForeachVar (checker $trace $clause))
        )
        ; $result
        $isAbstractForeachVar
        ; $trace
    )
)

(= (checker $trace $clause)
    (if (== $trace ())
        True
        (if (== $trace Pass)
            False
            (let*(
                (() (println! (here $trace)))
                (($headvar $bool $headov) (car-atom $trace))
                (() (println! ($headvar $bool $headov)))
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

; !(checker (($x True ((Inheritance $x Allen) ())) (($y True (() (Inheritance Lily $y))) ())) (Inheritance $x $y))
; !(all_of $x  ((Inheritance $x Allen)) (Inheritance $x $y))
; !(is-blk-syntax-more-abstract ((Inheritance $x $y)) ((Inheritance $x Allen)) $x)

(= (is_more_abstractn $vars $others)
      (if (== $vars ())
          True
          (let* (
              ($head (car-atom $vars))
              (($isMore $filtered $var) (is_more_abstract_for_each_var $head $others))
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
          (($isMore $filtered $var) (is_more_abstract_for_each_var $head $others))
          ($rest (collect_filtered_per_var (cdr-atom $vars) $others))
      )
      (($var $isMore $filtered) $rest))))

(= (is_more_abstract () $others $precheck)
        ()
)

(= (is_more_abstract $vars $others $precheck)
    (if (== $precheck False)
        False
        (let* (
            ($head (car-atom $vars))
            (() (println! ($head)))
            ($tail (cdr-atom $vars))
            (($isMore $filtered $var) (is_more_abstract_for_each_var $head $others))
            (() (println! ($isMore $filtered $var)))
            ($isMoreAbstract1 (if (== $isMore False) (is_more_abstract $tail $others False) (is_more_abstract $tail $others True)))
        )
        (cons $isMoreAbstract1 ($filtered $var))
        ; $filtered
        )
    )
)
(= (is_more_abstract_for_each_var $var $others)
    (let* (
        ($filtered (collapse (filter_foreach_var $var $others)))
        ($isMoreAbstract (if (== (eval (unique-atom $filtered)) (())) False True))
    )
    ($isMoreAbstract $filtered $var)
    ; $filtered
    )
)
; !(start (Inheritance $Z1 $Allen) ((Inheritance Lily $Z1) (Inheritance Abe $Allen)))
; !(is_more_abstract_for_each_var $Allen ((Inheritance Lily $Allen) (Inheritance Abe $Z1)))

; (= (filter_in_others $vars1 $others)
;     (map-atom $vars1 $var (if (== (intersection-atom ($var) $others) ()) empty $var))
; )

; !(filter_in_others ($x $y $z) ($x $b $c))
; !(filter_in_others $x (Inheritance $x $b))


(= (constant_clause_check $clause)
    (let $vars (get_variable_for_pattern $clause) (if (== $vars ()) () $clause))
)
(= (remove_constant_clauses $pattern)
    (map-atom $pattern $clause (constant_clause_check $clause))
)
; !(remove_constant_clauses ((Inheritance Allen Z1) (Inheritance Lily $Z1) (Inheritance Abe $Z1)))

; !(unique-atom (() ()))
; !(== (eval (unique-atom (() ()))) (()))
(((() ((() (Inheritance Abe $Z1)) $Z1)) (((Inheritance Lily $Allen) ()) $Allen)))

;;;;;;;;;;;;;;;;;;;;;;;;;; subTreeDetector-In-Conjunctions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(remove_Abstract_clauses ((Inheritance $x $y) (Inheritance $Lily $y) (Inheritance $x $Allen)))
; !(start  (Inheritance $x $y) ((Inheritance $x Allen) (Inheritance Lily $y)))
