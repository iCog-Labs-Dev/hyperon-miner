!(register-module! ../../../../hyperon-miner/experiments)
! (import! &self eq_prob_update)
! (import! &db experiments:data:ugly_man_sodaDrinker)


(= (eq-prob-adapter $partition $pattern $db)
    
    (let $db_content (get-atoms $db) (eq-prob-func $partition $pattern $db_content))
)

! (eq-prob-adapter ((Inheritance $x $y) (Inheritance $x man) (Inheritance $z human)) (Inheritance $x $z) &db)