(= (syn-old $kb $_ (: $prf (surp $ptrn $value))) 
      (if (> (counter $kb (surp $ptrn $value)) 0) ;; use match here
             (empty)
               (: CpuSurp (surp $ptrn $value))))


(= (syn-old $kb $env (S $k) (: $prf (surp $ptrn $value)))
   (let ; Recurse on minsup
        (: $prfminsup (minsup $ptrn))
          (syn $kb $env Z (: $prfminsup (minsup $ptrn)))
            (when ... ...)))









;; Recursive step
  (= (syn-old $kb (S $k) (: ($prfabs $prfarg) $ccln))
    (let* (((: $prfabs (-> $prms $ccln)) (syn $kb $k (: $prfabs (-> $prms $ccln))))
            ((: $prfarg $prms) (syn $kb $k (: $prfarg $prms))))
      (: ($prfabs $prfarg) $ccln)))


 (: minsupport 
    (-> (supportOf $ptrn $cnt)
          (-> (ms-threshold $ms)
                 (-> (⍃ $ms $cnt)
                     (minsup $ptrn)))))

(: minsupport (-> (⍃ $ms $cnt) (minsup $ptrn)))
(: minsupport (minsup $ptrn))

;; Base case
(= (syn $kb $_ (: $prf $ccln)) (match $kb (: $prf $ccln) (: $prf $ccln)))

;; Recursive step
(= (syn $kb (S $k) (: ($prfabs $prfarg) $ccln))
   (let* (((: $prfabs (-> $prms $ccln)) (syn $kb $k (: $prfabs (-> $prms $ccln))))   ;; (: minsupport (-> (⍃ $ms $cnt) (minsup $ptrn)))
          ((: $prfarg $prms) (syn $kb $k (: $prfarg $prms))))                         ;;  ((-> $prms (-> (⍃ $ms $cnt) (minsup $ptrn))))
     (: ($prfabs $prfarg) $ccln)))



;;(= (syn $kb  (S $k) (: $prf (surp $ptrn $value)))
 ;;  (let ; Recurse on surp
 ;;;       (: $prfminsup (sup $ptrn $value))
    ;;      (syn $kb  Z (: $prfsup (sup $ptrn $value)))
      ;;         (:$prfminsup (sup $ptrn $value))))






(supportOf (, (, (Inheritance Z human) (Inheritance Z sodaDrinker)) (Inheritance Z woman)) 5), 
(supportOf (, (, (Inheritance Z human) (Inheritance Z ugly)) (Inheritance Z woman)) 5), 
(supportOf (, (, (Inheritance Z sodaDrinker) (Inheritance Z human)) (Inheritance Z woman)) 5), 
(supportOf (, (, (Inheritance Z human) (Inheritance Z sodaDrinker)) (Inheritance Z man)) 5), 
(supportOf (, (, (Inheritance Z sodaDrinker) (Inheritance Z man)) (Inheritance Z human)) 5), 
(supportOf (, (, (Inheritance Z human) (Inheritance Z woman)) (Inheritance Z ugly)) 5), 
(supportOf (, (, (Inheritance Z ugly) (Inheritance Z sodaDrinker)) (Inheritance Z human)) 5), 
(supportOf (, (, (Inheritance Z man) (Inheritance Z human)) (Inheritance Z ugly)) 5), 
(supportOf (, (, (Inheritance Z human) (Inheritance Z ugly)) (Inheritance Z man)) 5), 
(supportOf (, (, (Inheritance Z sodaDrinker) (Inheritance Z human)) (Inheritance Z ugly)) 5), 
(supportOf (, (, (Inheritance Z sodaDrinker) (Inheritance Z human)) (Inheritance Z man)) 5), 
(supportOf (, (, (Inheritance Z ugly) (Inheritance Z man)) (Inheritance Z sodaDrinker)) 5), 
(supportOf (, (, (Inheritance Z sodaDrinker) (Inheritance Z woman)) (Inheritance Z human)) 5)




[(
(: (surprisingness (((minsupport FACT2) msT) CPU)) (surp (, (, (Inheritance $x#12522 sodaDrinker) (Inheritance $x#12522 human)) (Inheritance $x#12522 woman)) 0.00026951691400994854)) 
(: (surprisingness (((minsupport FACT3) msT) CPU)) (surp (, (, (Inheritance $x#12521 human) (Inheritance $x#12521 sodaDrinker)) (Inheritance $x#12521 man)) 0.0001882464522392705)) 
(: (surprisingness (((minsupport FACT4) msT) CPU)) (surp (, (, (Inheritance $x#12520 human) (Inheritance $x#12520 sodaDrinker)) (Inheritance $x#12520 man)) 0.00013659998646536493)))]



umsd_pattern = (LambdaLink
  (Variable "$X") ; [19679d5b361ad95f][1]
  (PresentLink
    (InheritanceLink
      (Variable "$X") ; [19679d5b361ad95f][1]
      (Concept "man") ; [1b55d1968390f6e6][1]
    ) ; [967d17e2430fb150][1]
    (InheritanceLink
      (Variable "$X") ; [19679d5b361ad95f][1]
      (Concept "soda drinker") ; [62707e4ca36d19af][1]
    ) ; [f2e33e97fd92a096][1]
    (InheritanceLink
      (Variable "$X") ; [19679d5b361ad95f][1]
      (Concept "ugly") ; [f273cc9fde1bcc6][1]
    ) ; [fcf0a6b2cedd2ac8][1]
  ) ; [8ec2901544b47ca4][1]
)


(,(Inheritance $x man) (Inheritance $x sodaDrinker) (Inheritance $x ugly))




ugly_man_pattern (LambdaLink
  (Variable "$X") ; [19679d5b361ad95f][1]
  (PresentLink
    (InheritanceLink
      (Variable "$X") ; [19679d5b361ad95f][1]
      (Concept "man") ; [1b55d1968390f6e6][1]
    ) ; [967d17e2430fb150][1]
    (InheritanceLink
      (Variable "$X") ; [19679d5b361ad95f][1]
      (Concept "ugly") ; [f273cc9fde1bcc6][1]
    ) ; [fcf0a6b2cedd2ac8][1]
  ) ; [d37451a9f223477a][1]
)



(,(Inheritance $x man) (Inheritance $x ugly))
(syn $kb (fromNumber 4) (: $prf (minsup $pattern)))


(Here)
(r1 $result1#4130)
(r2 $result2#4133)
(r3 $result3#4134)
(Here2)
(First: (: ($prfabs#5844 $prfarg#5845) (minsup $pattern#5230)))
(First: (: ($prfabs#6323 $prfarg#6324) (-> $prms#5847 (minsup $pattern#5230))))
(First: (: ($prfabs#6798 $prfarg#6799) (-> $prms#6326 (-> $prms#5847 (minsup $pattern#5230)))))
(First: (: ($prfabs#7259 $prfarg#7260) (-> $prms#6801 (-> $prms#6326 (-> $prms#5847 (minsup $pattern#5230))))))

(prms: (supportOf $pattern#5230 $cnt#7292) and (-> (ms-threshold $ms#7293) (-> (⍃ $ms#7293 $cnt#7292) (minsup $pattern#5230))))
(First: (: ($prfabs#8232 $prfarg#8233) (supportOf $pattern#5230 $cnt#7292)))
(prfarg FACT4 and prms (supportOf (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man)) 8))
(bct: minsupport (-> (ms-threshold $ms#7293) (-> (⍃ $ms#7293 8) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man))))))
(prfarg FACT3 and prms (supportOf (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man)) 4))
(bct: minsupport (-> (ms-threshold $ms#7293) (-> (⍃ $ms#7293 4) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man))))))
(prfarg FACT2 and prms (supportOf (, (, (Inheritance $x#8264 sodaDrinker) (Inheritance $x#8264 human)) (Inheritance $x#8264 woman)) 5))
(bct: minsupport (-> (ms-threshold $ms#7293) (-> (⍃ $ms#7293 5) (minsup (, (, (Inheritance $x#8264 sodaDrinker) (Inheritance $x#8264 human)) (Inheritance $x#8264 woman))))))
(prfarg FACT1 and prms (supportOf (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 ugly)) (Inheritance $x#8264 woman)) 5))
(bct: minsupport (-> (ms-threshold $ms#7293) (-> (⍃ $ms#7293 5) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 ugly)) (Inheritance $x#8264 woman))))))
(prms: (ms-threshold $ms#7293) and (-> (⍃ $ms#7293 8) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man)))))
(First: (: ($prfabs#12249 $prfarg#12250) (ms-threshold $ms#7293)))
(First: (: ($prfabs#12706 $prfarg#12707) (-> $prms#12252 (ms-threshold $ms#7293))))
(prfarg msT and prms (ms-threshold 6))
(bct: (minsupport FACT4) (-> (⍃ 6 8) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man)))))
(prms: (ms-threshold $ms#7293) and (-> (⍃ $ms#7293 4) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man)))))
(First: (: ($prfabs#14204 $prfarg#14205) (ms-threshold $ms#7293)))
(First: (: ($prfabs#14661 $prfarg#14662) (-> $prms#14207 (ms-threshold $ms#7293))))
(prfarg msT and prms (ms-threshold 6))
(bct: (minsupport FACT3) (-> (⍃ 6 4) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man)))))
(prms: (ms-threshold $ms#7293) and (-> (⍃ $ms#7293 5) (minsup (, (, (Inheritance $x#8264 sodaDrinker) (Inheritance $x#8264 human)) (Inheritance $x#8264 woman)))))
(First: (: ($prfabs#16159 $prfarg#16160) (ms-threshold $ms#7293)))
(First: (: ($prfabs#16616 $prfarg#16617) (-> $prms#16162 (ms-threshold $ms#7293))))
(prfarg msT and prms (ms-threshold 6))
(bct: (minsupport FACT2) (-> (⍃ 6 5) (minsup (, (, (Inheritance $x#8264 sodaDrinker) (Inheritance $x#8264 human)) (Inheritance $x#8264 woman)))))
(prms: (ms-threshold $ms#7293) and (-> (⍃ $ms#7293 5) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 ugly)) (Inheritance $x#8264 woman)))))
(First: (: ($prfabs#18114 $prfarg#18115) (ms-threshold $ms#7293)))
(First: (: ($prfabs#18571 $prfarg#18572) (-> $prms#18117 (ms-threshold $ms#7293))))
(prfarg msT and prms (ms-threshold 6))
(bct: (minsupport FACT1) (-> (⍃ 6 5) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 ugly)) (Inheritance $x#8264 woman)))))
(prms: (⍃ 6 8) and (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man))))
(First: (: ($prfabs#20185 $prfarg#20186) (⍃ 6 8)))
(First: (: ($prfabs#20969 $prfarg#20970) (-> $prms#20188 (⍃ 6 8))))
(First: (: ($prfabs#21417 $prfarg#21418) (-> $prms#20972 (-> $prms#20188 (⍃ 6 8)))))
(prfarg CPU and prms (⍃ 6 8))
(bct: ((minsupport FACT4) msT) (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man))))
(prms: (⍃ 6 4) and (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 sodaDrinker)) (Inheritance $x#8264 man))))
(First: (: ($prfabs#23255 $prfarg#23256) (⍃ 6 4)))
(First: (: ($prfabs#24014 $prfarg#24015) (-> $prms#23258 (⍃ 6 4))))
(First: (: ($prfabs#24462 $prfarg#24463) (-> $prms#24017 (-> $prms#23258 (⍃ 6 4)))))
(prms: (⍃ 6 5) and (minsup (, (, (Inheritance $x#8264 sodaDrinker) (Inheritance $x#8264 human)) (Inheritance $x#8264 woman))))
(First: (: ($prfabs#25526 $prfarg#25527) (⍃ 6 5)))
(First: (: ($prfabs#26285 $prfarg#26286) (-> $prms#25529 (⍃ 6 5))))
(First: (: ($prfabs#26733 $prfarg#26734) (-> $prms#26288 (-> $prms#25529 (⍃ 6 5)))))
(prms: (⍃ 6 5) and (minsup (, (, (Inheritance $x#8264 human) (Inheritance $x#8264 ugly)) (Inheritance $x#8264 woman))))
(First: (: ($prfabs#27797 $prfarg#27798) (⍃ 6 5)))
(First: (: ($prfabs#28556 $prfarg#28557) (-> $prms#27800 (⍃ 6 5))))
(First: (: ($prfabs#29004 $prfarg#29005) (-> $prms#28559 (-> $prms#27800 (⍃ 6 5)))))