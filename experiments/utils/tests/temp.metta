;!(import! &self ../common-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Unit Tests for common-utils ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(= (unify $space $pattern $then $else)
   (if (is-space $space)
       (let $temp (cut)
            (case (match $space $pattern $pattern)
                  (($pattern $then)
                   (Empty $else)))) (empty)))

(= (unify $a $b $then $else)
   (if (= $a $b)
       (eval $then)
       (eval $else)))




!(get-conjunct  (, A B))