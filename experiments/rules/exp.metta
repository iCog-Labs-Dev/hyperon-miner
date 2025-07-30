
(= (filter_in_others $vars1 $others)
    (map-atom $vars1 $var (if (== (intersection-atom ($var) $others) ()) empty $var))
)

!(filter_in_others ($x $y $z) ($x $b $c))
