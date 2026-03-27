
!(import! &self ../odd-ratio)
!(import! &db ../../data/ugly_man_sodaDrinker)

; (assertEqual (odd-ratio (, (Inheritance $x man) (Inheritance $x ugly)
;    (Inheritance $x sodaDrinker)) &db) (101.0 positive))

; !(odd-ratio (, (Inheritance $x man) (Inheritance $x ugly)
;    (Inheritance $x sodaDrinker)) &db)


!(assertEqual (odd-ratio (, (Inheritance $x ugly)
   (Inheritance $x sodaDrinker)) &db) (8.272727272727273 positive))


