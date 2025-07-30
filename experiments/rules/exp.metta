!(import! &self conjunction-expansion)
!(import! &self use-python)

(= (filter_in_others $var $others)
    ((map-atom $others $x (if (== (get-metatype $x) Variable) (if (== $x $var) Pass $x) (if (== (get-metatype $x) Expression) (filter_in_others $var $x) $x)) ) $others)
)

(= (filter_foreach_var $clause $others)
    (let* (
        ($vars (get_variable_for_pattern $clause))
        ($var (superpose $vars))
        ($other (superpose $others))
        (($filtered $pat) (eval (filter_in_others $var $other)))
        ($changed (call_replace ($filtered $pat)))
        ($uniq (unique-atom $changed))
        ($ov (if (== (size-atom $uniq) (size-atom ($filtered $pat))) $pat ()))
    )
    $ov
    )
)

; !(filter_foreach_var (Inheritance Allen $Z1) ((Inheritance Lily $c) (Inheritance Abe $Z1)))

; (= (filter_in_others $vars1 $others)
;     (map-atom $vars1 $var (if (== (intersection-atom ($var) $others) ()) empty $var))
; )

; !(filter_in_others ($x $y $z) ($x $b $c))
; !(filter_in_others $x (Inheritance $x $b))