
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Databse ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(Inheritance Alex Bob Charlie)
(Inheritance Dave Eve Frank)
(Inheritance Grace Heidi Ivan)
(Inheritance Judy Kevin Liam)
(Inheritance Mona Nina Oscar)
(Inheritance Peggy Quentin Rita)
; (Inheritance Steve Trent Ursula)
; (Inheritance Victor Wendy Xavier)
; (Inheritance Yara Zoe Adam)
; (Inheritance Ben Chris Dan)
; (Inheritance Eric Fred George)
; (Inheritance Harry Ian Jack)
; (Inheritance Kyle Leo Mike)
; (Inheritance Nick Oliver Paul)
; (Inheritance Quinn Rob Sam)
; (Inheritance Tom Uma Vince)
; (Inheritance Will Xander Yoda)
; (Inheritance Zack Alice Betty)
; (Inheritance Carol Diana Emily)
; (Inheritance Fiona Gina Helen)
; (Inheritance Irene Jane Kate)
; (Inheritance Laura Mary Nancy)
; (Inheritance Olivia Penny Queenie)
; (Inheritance Rachel Sarah Tina)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Helper functions ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Description: set-index finds every atom in an expression and return the combined values of the position it's found (index) and the atom
;; Parameters:
;;    $pattern : any pattern containing symbols, variables or grounded atoms
;; Returns:  a list of each element in the expression combined with it's index
;; E.g,
;; !(set-index (Inheritance $a $b $c)) -> ((0 Inheritance) (1 $a) (2 $b) (3 $c))
(= (set-index $pattern) (set-index $pattern 0))
(= (set-index () $i)())
(= (set-index $pattern $i)(
   let* (
      ($indexed ($i (car-atom $pattern))) 
      ($rem (set-index (cdr-atom $pattern) (+ $i 1)))
   ) (cons-atom $indexed $rem)
))


;;; Description: filter_vars filters a list of indexed atoms and returns only the variables
;; Parameters:
;;    $indexed_atoms : a list of indexed atoms (output of set-index)
;; Returns: a list of indexed variables
;; E.g,
;; !(filter_vars ((0 Inheritance) (1 $a) (2 $b) (3 $c))) ->  ((1 $a) (2 $b) (3 $c))
(= (filter_vars $indexed_atoms) (filter_vars $indexed_atoms ()))
(= (filter_vars $indexed_atoms $acc)(
   if (== $indexed_atoms ()) $acc
      ( let ($i $v) (car-atom $indexed_atoms) 
            (if (== (get-metatype $v) Variable)  
                (filter_vars (cdr-atom $indexed_atoms) (union-atom $acc (($i $v))))
                (filter_vars (cdr-atom $indexed_atoms) $acc)
            ) )
))


;;; Description: get_matching_atoms finds all the matches of the variables in a pattern from the database (space)
;; Parameters:
;;    $pattern : any pattern containing symbols, variables or grounded atoms
;; Returns: a list of all the matches of the variables in the pattern from the database (space)
;; E.g,
;; !(get_matching_atoms (Inheritance $a $b $c)) -> ((($j) (Alex Dave Grace Judy Mona Peggy)) (($b) (Bob Eve Heidi Kevin Nina Quentin)) (($c) (Charlie Frank Ivan Liam Oscar Rita)))
(= (get_matching_atoms $pattern)(
    let* (
      ($indexed (set-index $pattern))
      ($indexed_vars (filter_vars $indexed))
      ($matches (collapse (match &self $pattern $pattern)))
    ) (map-atom $indexed_vars $i ((cdr-atom $i) (foldl-atom $matches ()  $acc $match (union-atom $acc ((index-atom $match (car-atom $i)))))))
))

