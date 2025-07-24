;; Rules 
  (: minsupport 
    (-> (supportOf $ptrn $cnt)
          (-> (ms-threshold $ms)
                 (-> (⍃ $ms $cnt)
                        (minsup $ptrn)))))

;; rule to extract abstract patterns from the database
(: abstract-pattern
   (-> (uniqueLink $ptrn $cnt)
    (-> (ms-threshold $ms)
      (-> (⍃ $ms $cnt)
      (-> (replace_variables $ptrn)
       (AbstractPattern $ptrn))))))

;;specialization of abstract patterns on the $x rule
(: specializationx
       (-> (AbstractPattern ($link $x $y)) 
        (-> (replace_index ($link $x $y) ($link $nx $ny)) 
          (-> (valuation X ($link $nx $ny) $valx)
            (-> (depth-handler $valx $shabx)
            (-> (replace_variables ($shabx $ny))
              (specializationOf ($link $x $y) ($link $shabx $ny))))))))

;;specialization of abstract patterns on the $y rule
(: specializationy
       (-> (AbstractPattern ($link $x $y)) 
        (-> (replace_index ($link $x $y) ($link $nx $ny)) 
          (-> (valuation Y ($link $nx $ny) $valy)
            (-> (depth-handler $valy $shaby)
            (-> (replace_variables ($nx $shaby))
              (specializationOf ($link $x $y) ($link $nx $shaby))))))))

;;support of specialized patterns rule
(: support 
      (-> (specializationOf $aptrn $sptrn)
      (-> (replace_index $sptrn $nsptrn) 
       (-> (sup_count $nsptrn $count)
          (supportOf $sptrn $count)))))


;; conjunction expansion rule
(: conjunction-expand
      (-> (candidatePattern $ptrn1)
       (-> (replace_index $ptrn1 $nptrn1)
         (-> (clause_count $nptrn1 $cnt)   
          (-> (maxClauses $max)
           (-> (equals $cnt $max)
            (-> (candidatePattern $ptrn2)
              (-> (replace_index $ptrn2 $nptrn2)
               (-> (clause_count $nptrn2 $cnt2)
                (-> (equals $cnt2 1)
                 (-> (ms-threshold $ms)
                  (-> (get_variables $nptrn1 $vars1)
                   (-> (get_variables $nptrn2 $vars2)
                    (-> (combine_variables $vars1 $vars2 $comb)
                     (-> (substitute_variables $nptrn2 $comb ($subptrn2 $remaining))
                      (-> (replace_variables (, $nptrn1 $subptrn2))
                      (-> (conjunction_clean (, $nptrn1 $subptrn2))
                       (candidatePattern (, $nptrn1 $subptrn2)))))))))))))))))))


;;; rule to format the patterns with their support
(: supportFormat
      (-> (candidatePattern $ptrn)
      (-> (replace_index $ptrn $nptrn)
       (-> (sup_count $nptrn $count)
          (hasSupport $nptrn $count)))))
