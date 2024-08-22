! (register-module! ../../../hyperon-miner)
! (import! &database hyperon-miner:experiments:data:sample-data)
! (import! &self hyperon-miner:experiments:utils:common-utils)

 ;; check if count-atom-element returns number childrens in the
! (count-atom-element (abebe, abebe, abebe)) ;; 3

 ;; check if the count function returns the number of instances of a given pattern
! (count &database abebe) ;; 2

 ;; check if the sup-eval function returns True when a pattern's support is greater than minimum support
! (sup-eval $database abebe 1) ;; True

;; Test has-type
!(has-type lambda (lambda x y))
;; Test get-arity
!(get-arity (lambda  (Parent $x Nil)  (Parent $x Nil)))

;; TEST n_conjuncts
!(n_conjuncts (lambda   (Parent $x Nil) (Parent $x Nil)) )



;;test db size
! (add-reduct &self (= (get-space) (new-space))) 
!(add-atom (get-space) (Inheritance Abe human))
!(add-atom (get-space) (Inheritance Rio human))
!(add-atom (get-space) (Inheritance Bob human))
!(add-atom (get-space) (Inheritance Mike human))
!(add-atom (get-space) (Inheritance Zac human))


!(db_size (get-space))


!(universe-count (lambda   (Parent $x Nil) (Parent $x Nil)) (get-space))

;;test pow
 !(pow 5 3)
! (pow 100000 -7)
! (pow 5 3)
!(pow 1 0)
! (+ (abs -5) 10) ; 15
