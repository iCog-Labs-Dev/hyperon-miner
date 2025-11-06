;; ======================================================================
;;  Lowest-level primitives (independent utilities)
;; ======================================================================

(= (is-blk-more-abstract $head $pivot $var) True)

;; checkPat: Determines if a term $x is a valid pattern
;; A valid pattern must:
;;   1. Be of type Expression
;;   2. Have more than one element
;;   3. Have a head (first element) of type Symbol

(= (checkPat $x)
  (let $type (get-metatype $x)
    (if (not (== $type Expression))
        False
        (and
          (> (size-atom $x) 1)
          (let $head (car-atom $x)
            (== (get-metatype $head) Symbol))))))
;; ======================================================================
;;  Basic pattern utilities
;; ======================================================================

(= (rmvPar $x)
    (if (== $x ())
        (empty)
        (let $fuc (checkPat $x)
            (if $fuc
                $x
                (if (== (size-atom $x) 1)
                    $x
                    $x)))))


;; ======================================================================
;;  checkInterSuper depends on checkPat and superpose
;; ======================================================================

(= (checkInterSuper $var $el)
    (if (checkPat $el)
        (let $tail (cdr-atom $el)
            (checkInterSuper $var (superpose $tail)))
        (if (== $var $el)
            True
            (empty))))


;; ======================================================================
;;  process-pattern depends on checkPat, checkInterSuper, superpose, collapse
;; ======================================================================

(= (process-pattern $pattern $var)
    (let* (($is_pat (checkPat $pattern)))
        (if $is_pat
            (let* (
                ($exp (if (== (size-atom $pattern) 1)
                           (car-atom $pattern)
                           $pattern))
                ($vars (cdr-atom $exp))
                ($is_connected (checkInterSuper $var (superpose $vars))))
                (if $is_connected
                    $pattern
                    (empty)))
            (let $ch (collapse (process-pattern (superpose $pattern) $var))
                (if (not (== $ch ()))
                    $pattern
                    (empty))))))


;; ======================================================================
;; connected-subpatterns-with-var depends on process-pattern, rvmPar, collapse
;; ======================================================================

(= (connected-subpatterns-with-var $partition $var)
    (let ()
        (println! ("in con-sub-w-var"))
        (collapse (rmvPar (process-pattern (superpose $partition) $var)))))


;; ======================================================================
;; extract depends on var-exist-exp
;; ======================================================================

(= (extract $exp $var)
    (let $che (var-exist-exp $exp $var)
        (if $che
            $exp
            (empty))))


;; ======================================================================
;; find-component-with-var depends on extract
;; ======================================================================

(= (find-component-with-var $components $var)
    (collapse (extract (superpose $components) $var)))


;; ======================================================================
;; Abstraction-related filters depend on is-blk-more-abstract
;; ======================================================================

(= (filter-more-abstract $patterns $pivot $var)
    (if (== $patterns ())
        ()
        (let* (
            ($head (car-atom $patterns))
            ($is-head-abstract (is-blk-more-abstract $head $pivot $var))
            ($copyHead (car-atom $patterns))
            ($tail (cdr-atom $patterns))
            ($rest-filtered (filter-more-abstract $tail $pivot $var)))
            (if (is-blk-more-abstract $head $pivot $var)
                (cons-atom $copyHead $rest-filtered)
                $rest-filtered))))


(= (filter-less-abstract $patterns $pivot $var)
    (if (== $patterns ())
        ()
        (let* (
            ($head (car-atom $patterns))
            ($copyHead (car-atom $patterns))
            ($tail (cdr-atom $patterns))
            ($rest-filtered (filter-less-abstract $tail $pivot $var)))
            (if (is-blk-more-abstract $head $pivot $var)
                $rest-filtered
                (cons-atom $copyHead $rest-filtered)))))


;; ======================================================================
;; sort-by-abstraction depends on both filters
;; ======================================================================

(= (sort-by-abstraction $patterns $var)
    (if (== $patterns ())
        ()
        (if (== (cdr-atom $patterns) ())
            $patterns
            (let* (
                ($pivot (car-atom $patterns))
                ($rest (cdr-atom $patterns))
                ($more-abstract (filter-more-abstract $rest $pivot $var))
                ($less-abstract (filter-less-abstract $rest $pivot $var))
                ($sorted-less (sort-by-abstraction $less-abstract $var))
                ($sorted-more (sort-by-abstraction $more-abstract $var)))
                (concat-atom $sorted-more (cons-atom $pivot $sorted-less))))))


;; ======================================================================
;; value-count depends on match, union-atom, collapse, size-atom, unique-atom
;; ======================================================================

(= (value-count $blk $var $db)
    (let $conj-blk (union-atom (,) $blk)
        (let* (
            ($match-values (collapse (match $db $conj-blk $var)))
            ($ground-value (unique-atom $match-values)))
            (size-atom $ground-value))))


;; ======================================================================
;; find-most-specialized-abstract depends on is-blk-more-abstract
;; ======================================================================

(= (find-most-specialized-abstract $partition $j-blk $var $i)
    (if (< $i 0)
        -1
        (let $i-blk (index-atom $partition $i)
            (if (is-blk-more-abstract $i-blk $j-blk $var)
                $i
                (find-most-specialized-abstract $partition $j-blk $var (- $i 1))))))


;; ======================================================================
;; process-blocks depends on find-most-specialized-abstract, value-count
;; ======================================================================

(= (process-blocks $sorted-partition $var $db $p $j)
    (let $partition-size (size-atom $sorted-partition)
        (if (>= $j $partition-size)
            $p
            (let* (
                ($j-blk (index-atom $sorted-partition $j))
                ($i (find-most-specialized-abstract $sorted-partition $j-blk $var (- $j 1)))
                ($c (if (>= $i 0)
                        (let $i-blk (index-atom $sorted-partition $i)
                            (value-count $i-blk $var $db))
                        (let $U (collapse (get-atoms $db))
                            (size-atom $U))))
                ($j-blk-count (value-count $j-blk $var $db))
                ($new-p (/ $p $c)))
                (process-blocks $sorted-partition $var $db $new-p (+ $j 1))))))


;; ======================================================================
;; calculate-prob-for-vars depends on connected-subpatterns-with-var, sort-by-abstraction, process-blocks
;; ======================================================================

(= (calculate-prob-for-vars $vars $partition $db $p)
    (if (== $vars ())
        $p
        (let* (
            ($top (car-atom $vars))
            ($var-partition (connected-subpatterns-with-var $partition $top))
            ($sorted-partition (sort-by-abstraction $var-partition $top))
            ($new-p (process-blocks $sorted-partition $top $db $p 1)))
            (calculate-prob-for-vars (cdr-atom $vars) $partition $db $new-p))))





;; ======================================================================
;; Variable extraction & joint-variable logic
;; ======================================================================
(= (ret-vars $x)
   (let $invar (checkPat $x)
     (if $invar
         (let $a (cdr-atom $x)
           (ret-vars (superpose $a)))
         (if (== (get-metatype $x) Variable)
             $x
             (empty)))))

;; TODO: mutual dependency between ret-vars and get-variables-helper
; (= (get-variables-helper $pattern)
;     (let $a (cdr-atom $pattern)
;         (ret-vars (superpose $a))))

(= (get-variables-helper $x)
  (let $invar (checkPat $x)
    (if $invar
        ;; if pattern, recursively get vars from tail
        (let $a (cdr-atom $x)
          (get-variables-helper (superpose $a)))
        ;; if atomic
        (if (== (get-metatype $x) Variable)
            $x
            (empty)))))





(= (intersection-vars $vars1 $vars2)
    (if (== $vars1 ())
        ()
        (let* (
            ($var (car-atom $vars1))
            ($remaining (cdr-atom $vars1))
            ($rest-intersection (intersection-vars $remaining $vars2)))
            (if (is-membership $var $vars2)
                (cons-atom $var $rest-intersection)
                $rest-intersection))))



(= (checkSubInter $part $var)
    (let $invar (checkPat $part)
        (if $invar
            (let* (($tail (cdr-atom $part))
                   ($JoinedVars (collapse (checkSubInter (superpose $tail) $var))))
                (if (== (size-atom $JoinedVars) 0)
                    (empty)
                    $part))
            (if (and (== (get-metatype $part) Variable)
                     (== $var $part))
                $part
                (empty)))))



(= (get-variables-step $lst $acc)
    (if (== $lst ())
        $acc
        (let* ((($head $tail) (decons-atom $lst)))
            (if (== ((intersection-atom ($head) $acc)) (()))
                (get-variables-step $tail (cons-atom $head $acc))
                (get-variables-step $tail $acc)))))





(= (retJointPat $block $var)
    (let $blo (collapse (retjointSubPat (superpose $block) $var))
        (if (> (size-atom $blo) 0)
            $block
            (empty))))


(= (retJointvar $partition $var)
    (let $retPats (collapse (retJointPat (superpose $partition) $var))
        (if (> (size-atom $retPats) 1)
            $var
            (empty))))


(= (joint-vars-helper $partition $uniqueVars)
    (collapse (retJointvar $partition (superpose $uniqueVars))))





;; ======================================================================
;; get-var depends on get-variables-helper, get-variables-step
;; ======================================================================

(= (get-var $conjunct)
    (let $lst (collapse
        (let $a (car-atom $conjunct)
            (if (not (== $a ,))
                (let $firtype (get-metatype $a)
                    (if (== $firtype Expression)
                        (get-variables-helper (superpose $conjunct))
                        (get-variables-helper $conjunct)))
                (let $b (cdr-atom $conjunct)
                    (get-variables-helper (superpose $b))))))
        (get-variables-step $lst ())))
        

(= (joint-variables $pattern $partition)
    (let $invar (get-var $pattern)
        (joint-vars-helper $partition $invar)))

;; ======================================================================
;; get-all-partition-variables depends on get-var and itself recursively
;; ======================================================================

(= (get-all-partition-variables $partition)
    (if (== $partition ())
        ()
        (let* (
            ($block (car-atom $partition))
            ($remaining (cdr-atom $partition))
            ($block-vars (get-var $block))
            ($remaining-vars (get-all-partition-variables $remaining)))
            (merge-list $block-vars $remaining-vars))))

;; ======================================================================
;; eq-prob depends on joint-variables and calculate-prob-for-vars
;; ======================================================================

(= (eq-prob $partition $pattern $db)
    (let* (($joint-vars (joint-variables $pattern $partition)))
        (calculate-prob-for-vars $joint-vars $partition $db 1.0)))