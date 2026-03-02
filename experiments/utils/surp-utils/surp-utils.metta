

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
                 unify ($link $x $y) $new_head  (emp-tv $new_head $db) 
                       (chain (cons-atom , $new_head) $ptrn (emp-tv $ptrn $db))));;conjunct if it is not single pattern
              ($old (emp_tv_mem $tail $db))
        )  
            (cons-atom  $emp_value $old)
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
        ($finalAnswer (mk_stv $mean $re_variance))
    )
    $finalAnswer
))

;;=====================




(=(ret-vars-sup $x $acc )
  
    (let* (
      ( $outAcc (if (== (get-metatype $x ) Variable) (cons-atom $x $acc ) $acc))
    )
    $outAcc
    
    )
)

(=(get-variables-helper-sup $pattern $acc)
  
    
    (
      if (== $pattern ()) $acc 
      (let* (
        (($head $tail ) (decons-atom $pattern))
    ($newAcc (ret-vars-sup $head $acc))
    )
    (get-variables-helper-sup $tail $newAcc )
    
    )
    
    )
    
    
)

(=(get-variables-sup $conjunct $acc)
  (if (== $conjunct ())
      $acc 
      (let* ((($head $tail) (decons-atom $conjunct))
             ($vars-head (get-variables-helper-sup (cdr-atom $head) $acc))
             
             ($lst (union-atom $acc $vars-head))
            )


        (get-variables-sup $tail $lst)
      )
  )
)


;returns indpendent disjoint list of patterns or conjucnt that support be can be calculated for direclty through match and and mutiplied to get support for the origninal pattern
;handles both conjucnt and single pattern inputs
(=(ptrn-comps $ptrn) (if (== $ptrn () ) 0 (let* (
  
  ($omg (car-atom $ptrn)) 
  ($tail (cdr-atom $ptrn))
  
  ) (if (and (== $omg ,) (> (size-atom $tail) 1)) (let $clstrs (main-func (cdr-atom $ptrn) ())  
(create-patterns-from-clusters $clstrs ())) ($ptrn) ) 

)))







;returns list of lists of disjoint subpatterns, each internal list being an cluster cotaning related subpatterns as a whole either through direct relationship or through chainned r/ship
(=(main-func $pat-c $acc) (if (== $pat-c () ) $acc (let* (
    ($pat (cdr-atom $pat-c))
    (($head $tail) (decons-atom $pat))
    ($vars (get-variables-sup ($head) ()))
    (($connected $unconnected) (get-un-connected $tail $vars))
    ($bothvars (get-variables-sup $connected ()))
    ($bridgeVars (union-atom $vars $bothvars))
    (($bridgedpats $unbridgedPats) (get-un-connected $unconnected $bridgeVars))
    ($semi-cluster (union-atom $bridgedpats $connected))
    ($cluster (cons-atom $head $semi-cluster))
    (($all-bridged $all-unbridged) (get-all-bridged $cluster $unbridgedPats))

    )
   

   
   (== $all-unbridged ())
    
    )))

;recursivley collects all chainned subpatterns conncted through bridge subpatterns.
(= (get-all-bridged $cluster $unbridged) (let* (
  ($clVars (get-variables-sup $cluster ()))
  (($con $uncon) (get-un-connected $unbridged $clVars))
  )
  (if (== $con ()) ($cluster $unbridged)
  (get-all-bridged (union-atom $con $cluster) $uncon)
  )
  
  ))






;collects subpatterns that contain common variables with the list of vairables $vars
(=(con-pats $pat $vars $acc)
  (let* (
      ($patvars (cdr-atom $pat))
      ($inter (set-intersection $patvars $vars))
    )
    (if (== (size-atom $inter) 0)
        $acc
        (cons-atom $pat $acc)
    )
  )
)

;collects subpatterns that don't contain any common variables with the list of vairables $vars
(=(un-con-pats $pat $vars $acc)
  (let* (
      ($patvars (cdr-atom $pat))
      ($inter (set-intersection $patvars $vars))
    )
    (if (== (size-atom $inter) 0)
        (cons-atom $pat $acc)
        $acc
    )
  )
)

; recursive helper that partitions $patterns into connected and unconnected lists using accumulators
(=(get-un-connected-helper $patterns $vars $conAcc $unAcc)
  (if (== $patterns ())
      ($conAcc $unAcc)
      (let* (
          (($head $tail) (decons-atom $patterns))
          ($newConAcc (con-pats $head $vars $conAcc))
          ($newUnAcc  (un-con-pats $head $vars $unAcc))
        )
        (get-un-connected-helper $tail $vars $newConAcc $newUnAcc)
      )
  )
)

;if the if conditionals are satisfied we could return (() $patterns) meaning no subpatterns can connect with the inputs given to it.
(=(get-un-connected $patterns $vars)
  (if (or (== $patterns ()) (== $vars ()))
      (() $patterns)
      (get-un-connected-helper $patterns $vars () ())
  )
)






;;=====================


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

