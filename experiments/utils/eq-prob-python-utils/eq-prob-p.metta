! (import! &self eq_prob_update)


(= (eq-prob-adapter $partition $pattern $db)
    
    (let $db_content (collapse (get-atoms $db)) (eq-prob-func $partition $pattern $db_content))
)


