

;;;;;;;;;;;;;;;;;;;;
;; Surprisingness ;;
;;;;;;;;;;;;;;;;;;;;


; (=(add-subpatterns () $space) ())
; (=(add-subpatterns $partition $space)(
;     let* ((($head $tail) (decons-atom $partition))
;            ($subpattern (mk-body $head))
;            ($dummy (add-subpatterns $tail $space))
;             )
;             (cons-atom $subpattern $dummy)
; ))


(=(add-subpatterns $partition $space)
    (collapse (mk-body (superpose $partition)))
      
)



(=(get-subpatterns $pattern $space) (
    let $parts (partitions_without_pattern (get-clouses $pattern))
         (add-subpatterns $parts $space )) )




(=(joint-variables () $partion) ())
(=(joint-variables $vars  $partion )(
    let ($head $tail)    (decons-atom $vars)
       (if   (>= (tuple-count (var-appers $head $partion)) 2) 
             (let $dummy (joint-variables $tail $partion) (cons-atom $head $dummy)) 
             (joint-variables $tail $partion))         
))


(=(mk-unique ()) ())
(=(mk-unique $vars) (
    let ($head $tail) (decons-atom $vars) (let $dummy (mk-unique (remove-element $head $vars)) (cons-atom $head $dummy))))


(=(get-unique-vars $pattern)(
    let $vars (get-variables $pattern) (mk-unique $vars) 
))


(=(joint-variables-init $pattern $partion)(
      let $vars (get-unique-vars $pattern) (
        joint-variables $vars $partion   
      )
))


 (=(emp_tv_mem $pattern_list $db) (
    if (== $pattern_list ()) () (
        let* (  
              (($head $tail) (decons-atom $pattern_list))
              ($new_head (remove-parenthesis $head)) ;; to remove unnecessary parenthesis if there is any
              ($emp_value (
                 unify (Inheritance $x $y) $new_head  (emp-tv $new_head $db) 
                       (chain (conjunct-pattern $new_head $db) $ptrn (emp-tv $ptrn $db))));;conjunct if it is not single pattern 
              ($dummy (emp_tv_mem $tail $db))
        )  
            (cons-atom  $emp_value $dummy)
    )
 ))





 ; Orchestrating the overall process to calculate the average truth value

 ;  * This function calculates the average truth value from a list of truth values.
 ;  *
 ;  * Steps followed in the calculation:
 ;  *
 ;  * 1. Extract Beta distributions from the given truth values.
 ;  * 2. Calculate the mean for each Beta distribution.
 ;  * 3. Calculate the variances for each Beta distribution.
 ;  * 4. Calculate the overall average mean from the individual means.
 ;  * 5. Calculate the relative variances using the individual means, variances, and the overall average mean.
 ;  * 6. Combine the original variances with the relative variances.
 ;  * 7. Calculate the average variance from the combined variances.
 ;  * 8. Create the final truth value using the average mean and variance.
 ;  * 9. Return the final truth value.

(=(avrg_tv $tv) (
    let* (
        ($tv_list (mk_distribution_list $tv))
        ($size (tuple-count $tv_list))
        ($mean (let $sum (mean_accumulater $tv_list 0) (// $sum $size)))
        ($re_variance (let $var_sum  (var_accumulater $tv_list 0 $mean) (// $var_sum $size)))
        ($mk_stv_val (mk_stv $mean $re_variance))
        (($mode $confidence)  (decons-atom $mk_stv_val))
    )
     ($mode (car-atom $confidence) ) 
       
))




(=(is_equivalent ($link1 $x1 $y1) ($link2 $x2 $y2) $var) (
    if (== $link1 $link2) (or (and (== $x1 $x2) (== $x2 $var)) (and (== $y1 $y2) (== $y2 $var))) False ) 
)

(=(is_equivalent ($link1 $x1) ($link2 $x2) $var) (
  if (== $link1 $link2) (and (== $x1 $x2) (== $x2 $var)) False
))

(=(dst_from_interval $emin $emax $emp) (
  if (< $emax $emp) (- $emp $emax) (if (< $emp $emin ) (- $emin $emp) 0.0)
))


;$emp < $emin ---- $emax < $emp 

