
!(import! &self  emp-tv-bs)

;; py-input
;; takes input from the terminal through python
;; 
;; Parameters:
;;   prompt – user informing message for the input.
;; 
;; Returns:
;;   The number received from the user

(= (py-input $x) (takingInput $x))


;; =============================================================================
;; Function: subsample-py
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Creates a random subsample from a database by selecting a specified number
;;   of atoms and placing them in a new space.
;;
;; Inputs:
;;   - `$db`: The source database/space to subsample
;;   - `$subsize`: The number of atoms to include in the subsample
;;
;; Output:
;;   - A new space containing the randomly selected atoms
;;
;; =============================================================================
(= (subsample-py $db $subsize)
    (let* (
         
            ($db-content (collapse (get-atoms $db)))

            ($random-selected (generet_random_subsample $db-content $subsize))

            ($space (copy-db (new-space) $random-selected))

            
            )

        $space
    )
)

;; avrg-tv-py
;; Computes the arithmetic mean of a sequence of numerical values.
;; 
;; Parameters:
;;   x – A sequence of numerical values (e.g., time-series data).
;; 
;; Returns:
;;   The average (mean) of the values in `x`.
;; 
;; Note:
;;   This function is an alias for `mean-tv`.

(= (avrg-tv-py $x) (mean-tv $x))



;; =============================================================================
;; Function: get-element-by-Index
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Retrieves an element from a list at a specified index position.
;;
;; Parameters:
;;   - $list: The input list to access
;;   - $index: Zero-based index of the element to retrieve
;;
;; Returns:
;;   - The element at the specified index
;;   - Undefined behavior if index is out of bounds
;; =============================================================================

(= (get-element-by-Index $list $index)
       (index-atom $list $index)
)
      

;; =============================================================================
;; Function: random-element
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Selects and returns a random element from the given database ($db).
;;
;; Parameters:
;;   - $db: A database or collection from which atoms are extracted.
;;
;;
;; Returns:
;;   - A randomly selected element from the database.
;;
;; =============================================================================
(= (random-element $db)
   (let* (
           ($list (collapse (get-atoms $db)))
           ($length (size-atom $list))
           ($index (random-int 0 $length))
           ($element (get-element-by-Index $list $index))
         )
         $element))



;; =============================================================================
;; Function: generet-random-subsample
;; -----------------------------------------------------------------------------
;; Purpose:
;;   Generates a random subsample of elements from the provided database ($db)
;;   with the specified sample size ($subsize). The subsample is collected 
;;   recursively.
;;
;; Parameters:
;;   - $db: The database or collection to sample from.
;;   - $subsize: The desired size of the random subsample.
;;
;; Returns:
;;   - A list containing a random subsample of elements from the database.
(= (generet-random-subsample $db $subsize)
   (if (== $subsize 0)
       ()
       (let* (             
               ($elements (random-element $db))
               ($tail-elements (generet-random-subsample $db (- $subsize 1)))
             )
             (cons-atom $elements $tail-elements)
       )
   )
)

