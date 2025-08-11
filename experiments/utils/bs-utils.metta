!(import! &self  emp-tv-bs)

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
;; How it works:
;;   1. Extracts all atoms from the source database using `get-atoms`
;;   2. Collapses the result into a flat list
;;   3. Randomly selects `$subsize` atoms using `generet_random_subsample`
;;   4. Creates a copy of the selected atoms in a new space
;;

;; =============================================================================
(= (subsample-py $db $subsize)
    (let* (
            ($db-content (collapse (get-atoms $db)))
            ($random-selected (generet_random_subsample $db-content $subsize))
            ($space (copy-db (new-space) $random-selected)))
        $space
    )
)

(= (avrg-tv-py $x) (mean-tv $x))



