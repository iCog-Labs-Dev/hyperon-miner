; !(import! &self ../../utils/mork-interface)

(= (add-atom-once $atoms) 
    (if (== $atoms ()) true (let*
        (
            ($head (car-atom $atoms))
            ($tail (cdr-atom $atoms))
            ($_ (add-atom &dbspace $head))
            
        )
        (add-atom-once $tail))
    )
)


(add-atom-once ((Inheritance Allen human)
(Inheritance Abe human)
(Inheritance Cason human)
(Inheritance Davion human)
(Inheritance Hessley human)
(Inheritance Jadrian human)
(Inheritance Rio human)
(Inheritance Bob human)
(Inheritance Mike human)
(Inheritance Zac human)
(Inheritance Lily human)
(Inheritance Emily human)
(Inheritance Lucy human)
(Inheritance Sophia human)
(Inheritance Alaura human)
(Inheritance Breonna human)
(Inheritance Jaleesa human)
(Inheritance Jassy human)
(Inheritance Jenica human)
(Inheritance Kecia human)

(Inheritance Allen man)
(Inheritance Abe man)
(Inheritance Cason man)
(Inheritance Davion man)
(Inheritance Hessley man)
(Inheritance Jadrian man)
(Inheritance Rio man)
(Inheritance Bob man)
(Inheritance Mike man)
(Inheritance Zac man)

(Inheritance Lily woman)
(Inheritance Emily woman)
(Inheritance Lucy woman)
(Inheritance Sophia woman)
(Inheritance Alaura woman)
(Inheritance Breonna woman)
(Inheritance Jaleesa woman)
(Inheritance Jassy woman)
(Inheritance Jenica woman)
(Inheritance Kecia woman)

(Inheritance Allen ugly)
(Inheritance Abe ugly)
(Inheritance Cason ugly)
(Inheritance Davion ugly)
(Inheritance Hessley ugly)
(Inheritance Lily ugly)
(Inheritance Emily ugly)
(Inheritance Lucy ugly)
(Inheritance Sophia ugly)
(Inheritance Alaura ugly)

(Inheritance Allen sodaDrinker)
(Inheritance Abe sodaDrinker)
(Inheritance Cason sodaDrinker)
(Inheritance Davion sodaDrinker)
(Inheritance Hessley sodaDrinker)
(Inheritance Breonna sodaDrinker)
(Inheritance Jaleesa sodaDrinker)
(Inheritance Jassy sodaDrinker)
(Inheritance Jenica sodaDrinker)
(Inheritance Kecia sodaDrinker)
))

!(mm2-exec &mork 1)

(= (match-&mork-conj $ConjPattern $Out)
   (let* (
          ($_1 (add-atom &mork
                 (exec 0
                       $ConjPattern
                       (, (tmpResult $Out)))))

          ($_ (mm2-exec &mork 1))        
          ($R  (match &mork (tmpResult $Out) $Out))
          ($_2 (remove-atom &mork
                 (exec 0
                       $ConjPattern
                       (, (tmpResult $Out)))))
         
         )
        $R))


; !(mork-load-space &dbspace &dbspace)
!(add-atom &mork (Human Eyob Derese))
!(add-atom &mork (Man Eyob Derese))
!(add-atom &mork (Nice Eyob Derese))
!(add-atom &mork (Human Babi Derese))
!(add-atom &mork (Man Babi Derese))
!(add-atom &mork (Nice Babi Derese))


; !(add-atom &mork (exec 0 (, (Human $x Derese)
;                             (Man $x Derese)
;                             (Nice $x Derese)
;                             )
;                          (, (queryResult $x))))

; !(match &mork (queryResult $x) (queryResult $x))

!(match-&mork-conj
     (, (Human $x Derese)
        (Man $x Derese)
        (Nice $x Derese))
     $x)
