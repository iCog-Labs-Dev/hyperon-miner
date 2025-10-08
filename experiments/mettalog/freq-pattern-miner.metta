;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;; Frequent Pattern Miner ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Description: frequent pattern miner tries to find the most common patterns on a database (atomspace tree). Staring
;; with the most general pattern that encompasses all atoms in the database, it recursively specializes the patterns
;; by replacing variables and replacing them with more specific values found like a constants. the process is limited by
;; a maximum depth and a minimum support threshold. 

;; Algorithm Sketch:
;; 1. Start with a set of general patterns containing variables.
;; 2. For each pattern, find all possible values for its variables based on matches found in the database.
;; 3. Generate specialized patterns by replacing variables with these values.
;; 4. Calculate the support of each specialized pattern in the database.
;; 5. Filter out patterns that do not meet the minimum support threshold.
;; 6. Recursively repeat the process for the remaining patterns until a maximum depth is reached or no new patterns are found.
;; 7. Return the set of discovered patterns that meet the support criteria.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Bind the database space and configuration parameters into working space
!(bind! &db (new-space))
!(bind! MAX_DEPTH 2)
!(bind! MIN_SUPPORT 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Databse ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Adding atoms to the database
!(add-atom &db (Implication A B))
!(add-atom &db (Implication A D))
!(add-atom &db (Implication A E))
!(add-atom &db (Implication B C))
!(add-atom &db (Implication B D))
!(add-atom &db (Implication C D))
!(add-atom &db (Implication E B))
!(add-atom &db (Implication E C))
!(add-atom &db (Implication F E))
!(add-atom &db (Implication F C))

!(add-atom &db (Inheritance A B))
!(add-atom &db (Inheritance A C))
!(add-atom &db (Inheritance B D))
!(add-atom &db (Inheritance B E))
!(add-atom &db (Inheritance C D))
!(add-atom &db (Inheritance E D))
!(add-atom &db (Inheritance F C))
!(add-atom &db (Inheritance F E))
!(add-atom &db (Inheritance G E))
!(add-atom &db (Inheritance G G))
!(add-atom &db (Inheritance E E))
!(add-atom &db (Inheritance G C))
!(add-atom &db (Inheritance G D))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Helper functions ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(= (is_var $v) (== (get-metatype $v) Variable))
(= (is_expr $e) (== (get-metatype $e) Expression))

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

;;; Description: `filter` filters a list with a predicate function
;; Parameters:
;;    $lst : a list of elements to be filtered
;;    $pred : a predicate function that takes an element and returns true or false
;; Returns: a list of elements that satisfy the predicate
(= (filter $pred $lst) (
   if (== $lst ()) ()
      (let* (
         ($h (car-atom $lst))
         ($rem (filter $pred (cdr-atom $lst)))
      )(if ($pred $h) (cons-atom $h $rem) $rem))
))


;;; Description: has checks if an element exists in a list
;; Parameters:
;;    $list : a list of elements
;;    $el : an element to check for in the list
;; Returns: true if the element is found in the list, false otherwise
;; E.g,
;; !(has (A B C) B) -> true
;; !(has (A B C) D) -> false
(= (has () $el) False)
(= (has $list $el) (or (== (car-atom $list) $el) (has (cdr-atom $list) $el)))

;;; Description: get_unique removes duplicate patterns from a list
;; Parameters:
;;    $list : a list of patterns that may contain duplicates
;; Returns: a list of unique patterns
;; E.g,
;; !(get_unique ((Inheritance A B) (Inheritance A C) (Inheritance A B))) -> ((Inheritance A C) (Inheritance A B))
(= (get_unique $list)(
   if (== $list ())()
      (let* (
         (($h $t) (decons-atom $list))
         ($curr (if (has $t $h) () ($h)))
         ($rem (get_unique $t))
      ) (union-atom $curr $rem))
))


;;; Description: is_indexed_var checks if an indexed element is a variable
;; Parameters:
;;    $iv : an indexed element (a pair of index and atom)
;; Returns: true if the atom is a variable, false otherwise
;; E.g,
;; !(is_indexed_var (0 Inheritance)) -> false
;; !(is_indexed_var (1 $x)) -> true
(= (is_indexed_var $iv)(let ($i $v) $iv (is_var $v)))

;; Description: compose combines an indexed element with a list of matches
;; Parameters:
;;    $iv : an indexed element (a pair of index and atom)
;;    $matches : a list of matches (each match is a list of atoms)
;; Returns: a list of atoms that correspond to the variable in the indexed element
;; E.g,
;; !(compose (1 $x) ((Inheritance A B)(Inheritance A C)(Inheritance B D))) -> (($x A B C))
;; !(compose (2 $y) ((Inheritance A B)(Inheritance A C)(Inheritance B D))) -> (($y B C D))
(= (compose $iv $matches)(
   let* (
      ($var (cdr-atom $iv))
      ($vals (map-atom $matches $m (index-atom $m (car-atom $iv))))
      ($unique (unique-atom $vals))
   ) ($var (union-atom $var $unique))
))

;;; Description: get_valuation_set finds all possible values for each variable in a pattern based on matches in the database
;; Parameters:
;;    $db : the database to search for matches
;;    $pattern_set : a list of patterns to find matching values for
;; Returns: a composed list of lists containing the pattern and its possible values for each variable
;; E.g,
;; !(get_valuation_set &db ((Inheritance $x $y))) -> [((Inheritance $x $y) ((($x) ($x A B C E F G)) (($y) ($y B C D E G))))]
;; !(get_valuation_set &db ((Implication $x $y))) -> [((Implication $x $y) ((($x) ($x A B C E F)) (($y) ($y B D E C))))]
(= (get_valuation_set $db $pattern_set) (
   let* (
      ($pattern (superpose $pattern_set))
      ($indexed (set-index $pattern))
      ($indexed_vars (filter is_indexed_var $indexed))
      ($matches (collapse (match $db $pattern $pattern)))
   ) ($pattern (map-atom $indexed_vars $iv (compose $iv $matches)))
))

;;; Description: create_combination generates all combinations of a pattern by replacing its variables with values from a given set
;; Parameters:
;;    $pattern : a pattern containing variables
;;    $valset : a valset that contain the variable and its possible values
;; Returns: a non-determinstic set of patterns with variables replaced by values from the valset
;; E.g,
;; !(create_combinations (Inheritance $x $y) (($x A B C) ($y J K C))) -> [(Inheritance A J), (Inheritance A K), (Inheritance A C)...]
(= (create_combinations $pattern $valset)(
   if (== $pattern ()) () (
      let* (
         (($h $t) (decons-atom $pattern))
         (($var $values) $valset )
         ($curr ( if (and (is_var $h) (== $h (car-atom $var))) (superpose $values)  $h))
         ($rem (create_combinations $t $valset))
      ) (cons-atom $curr $rem)
   )
))

;;; Description: specialize generates all specialized versions of a pattern by replacing its variables with all possible values from the valuation sets
;; Parameters:
;;    $valuation_sets : a list containing a pattern and its valuation sets
;; Returns: a list of specialized patterns with variables replaced by values from the valuation sets
;; E.g,
;; !(specialize ((Implication $x $y) ((($x) ($x A B C E F)) (($y) ($y B D E C))))) -> [(Implication A B), (Implication A D), (Implication A E)...]
(= (specialize $valuation_sets)(
   let* (
      (($pattern $valsets) $valuation_sets)
      ($combinations  (collapse (create_combinations $pattern (superpose $valsets))))
   ) $combinations
))

;;; Description: min_support calculates the minimum support of a pattern in the database
;; Parameters:
;;    $db : the database to search for matches
;;    $pattern : the pattern to calculate support for
;; Returns: the number of unique matches of the pattern in the database
;; E.g,
;; !(min_support &db (Inheritance $x $y)) -> 3
(= (min_support $db $pattern)(let $matches (collapse (match $db $pattern $pattern)) (size-atom $matches)))


;;; Description: get_supported filters patterns based on a minimum support threshold
;; Parameters:
;;    $db : the database to search for matches
;;    $sup : the minimum support threshold
;;    $pattern : the pattern to check for support
;; Returns: the pattern if its support meets or exceeds the threshold, otherwise an empty list
;; E.g,
;; !(get_supported &db 3 ((Inheritance $x $y)(Inheritance J K))) -> {((Inheritance $x $y))}
(= (get_supported $db $sup $patterns_set) (collapse (_get_supported $db $sup (superpose $patterns_set))))
(= (_get_supported $db $sup $pattern)(if (>= (min_support $db $pattern) $sup) $pattern (empty)))


;;; Description: miner recursively discovers new patterns in the database by specializing existing patterns and filtering them based on support
;; Parameters:
;;    $db : the database to search for patterns
;;    $patterns : a list of initial patterns to start the mining process
;;    $depth : the current depth of recursion (used to limit the recursion)
;; Returns: a list of discovered patterns that meet the minimum support criteria
;; E.g,
;; !(miner &db ((Inheritance $x $y)(Implication $x $y))) 
;;    -> ((Inheritance A B) (Inheritance A C) (Inheritance B D)
;;        (Implication B E) (Implication C D) (Implication E D))
(= (miner $db $patterns)  (miner $db $patterns 0))
(= (miner $db $patterns $depth) (
   let $new_patterns (collapse (
      let* (
         ($valuation_set (get_valuation_set $db $patterns))
         ($specialized (specialize $valuation_set))
         ($supported (get_supported $db MIN_SUPPORT $specialized))
      ) (superpose $supported) )
   ) (if (or (>= $depth MAX_DEPTH) (== $new_patterns ())) $patterns (miner $db  $new_patterns (+ $depth 1)))
))

!(miner &db ((Inheritance $x $y)))