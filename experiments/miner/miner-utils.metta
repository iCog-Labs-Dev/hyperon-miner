
;;;;;;;;;;;;; Sorting function for surprisingness ;;;;;;;;;;;;;

;(: insert_N (-> $a (List $a) (List $a)))
(= (insert_N $x Nil) (Cons $x Nil))
(= (insert_N $x (Cons $head $tail))
   (let ((: $prf ($lable $patrn $value)) (: $Tprf ($Tlable $Tpatrn $Tvalue))) ($x $head)
    ( if (> $value $Tvalue)
       (Cons $x (Cons $head $tail))
       (Cons $head (insert_N $x $tail)))))

;; Sorts a list of patterns by their surprisingness value using insertion sort.
;(: sort_surp_list (-> (List $a) (List $a)))
(= (sort_surp_list Nil) Nil)
(= (sort_surp_list (Cons $head $tail)) (insert_N $head (sort_surp_list $tail)))




;;;;;;; sort surprising patterns ;;;;;;;;;;
;;convert the collapsed (tuples) pattern to list
;;sort the list
;;convert to tuple and return sorted surprising patterns in decreasing order

;;patterns must be collapsed before passed to the surp-sorting
(=(surp-sorting $patterns) (
   chain (tuple_to_list $patterns) $ptrn (
        chain (sort_surp_list $ptrn) $res (list_to_tuple $res))
))




(=(is-number $x) 
   (== (get-type $x) Number) 
)

(= (conj? $p)
    (case $p
    (((, $clause1 $clause2) True)
     ($_ False))))