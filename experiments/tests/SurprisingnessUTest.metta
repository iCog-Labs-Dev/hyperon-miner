! (register-module! ../../../hyperon-miner/experiments)
! (import! &self experiments:utils:common-utils)
! (import! &self experiments:utils:beta-dist)
! (import! &self experiments:utils:constants)
! (import! &self experiments:utils:TruthValue)
! (import! &self experiments:utils:surp-utils)
! (import! &self experiments:utils:miner-utils)
! (import! &self experiments:utils:gen_partition)
! (import! &self experiments:rules:est-tv)

! (bind! square (py-atom numpy.square (-> Number Number)))

;;Test compose 
;; !(assertEqual (compose (Inheritance $y B) (($y A))) (Inheritance A B))
;; !(assertEqual (compose (Evaluation $x $y) (($x "scm-eager: absolutely-true"))) (Evaluation "scm-eager: absolutely-true" $y))
;; !(assertEqual (compose (Implication $x $y) (($x $y))) (Implication $y $y) )
;; !(assertEqual (compose x (($x sa))) (compose x (($x sa))))




;; Test avrg_tv

(=(test_avrg_tv_1)(
    let* (
       ($tv_1 ((Inheritance Abe $x) (STV 0 0.1)))
       ($tv_2 ((Inheritance John $x) (STV 0 0.1)))
       ($result (avrg_tv ($tv_1 $tv_2)))

    )
    $result 
))


(=(test_avrg_tv_2)(
    let* (
       ($tv_1 ((Inheritance Abe $x) (STV 0 0.1)))
       ($tv_2 ((Inheritance John $x) (STV 1 0.1)))
       ($result (avrg_tv ($tv_1 $tv_2)))

    )
    $result 
))


(=(test_avrg_tv_3)(
    let* (
       ($tv_1 ((Inheritance Abe $x) (STV 1 0.001248)))
       ($tv_2 ((Inheritance John $x) (STV 1 0.001248)))
       ($tv_3 ((Inheritance John $x) (STV 0 0.001248)))
       ($tv_4 ((Inheritance John $x) (STV 1 0.001248)))
       ($tv_5 ((Inheritance John $x) (STV 1 0.001248)))
       ($tv_6 ((Inheritance John $x) (STV 1 0.001248)))
       ($tv_7 ((Inheritance John $x) (STV 1 0.001248)))
       ($tv_8 ((Inheritance John $x) (STV 1 0.001248)))
       ($tv_9 ((Inheritance John $x) (STV 1 0.001248)))
       ($tv_10 ((Inheritance John $x) (STV 1 0.001248)))
        
       ($result (avrg_tv ($tv_1 $tv_2 $tv_3 $tv_4 $tv_5 )))

    )
    $result 
))


;!(assertEqual (test_avrg_tv_1) (0 0.1))
!(assertEqual (test_avrg_tv_2) (0.5 0.000125))
!(assertEqual (test_avrg_tv_3) (0.5 0.000677))