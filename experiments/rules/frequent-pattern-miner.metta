! (register-module! ../../../hyperon-miner)
! (import! &dbspace hyperon-miner:experiments:data:sample-data1)
! (import! &self hyperon-miner:experiments:rules:binding-set)
! (import! &self hyperon-miner:experiments:rules:shallow-abstraction)
! (import! &self hyperon-miner:experiments:rules:specialization)
! (import! &self hyperon-miner:experiments:rules:candidate-patterns)
! (import! &self hyperon-miner:experiments:rules:mined-patterns)
! (import! &self hyperon-miner:experiments:utils:common-utils)
! (import! &self hyperon-miner:experiments:utils:DeBruijnIndex)
! (bind! &shabspace (new-space))
! (bind! &bindspace (new-space))
! (bind! &spezspace (new-space))
! (bind! &cndpspace (new-space))
! (bind! &minedpspace (new-space))

(= (depth) (fromNumber 1))

! (add-atom &cndpspace (candidate (Inheritance z (s z))))

(= (init-miner $link $x $y $minsup $dbspace $bindspace $shabspace $spezspace $cndpspace $depth) (
        (superpose(
            (let ($link1 $x1 $y1) (Debruijn2var ($link $x $y) (Cons $Xvar (Cons $Yvar (Cons $Zvar Nil)))) (binding-set $link1 $x1 $y1 $dbspace $bindspace $depth))
            (let ($link1 $x1 $y1) (Debruijn2var ($link $x $y) (Cons $Xvar (Cons $Yvar (Cons $Zvar Nil)))) (shallow-abstraction $link1 $x1 $y1 $dbspace $bindspace $shabspace $depth))
            (let ($link1 $x1 $y1) (Debruijn2var ($link $x $y) (Cons $Xvar (Cons $Yvar (Cons $Zvar Nil)))) (specialize-pattern $link1 $x1 $y1 $dbspace $bindspace $shabspace $spezspace $depth))
            (candidate-pattern $dbspace $spezspace $minsup $cndpspace)
            )
        )
    )
)

(= (run-miner $minsup Z $dbspace $bindspace $shabspace $spezspace $cndpspace) (
        (let ($link1 $x1 $y1) (match $cndpspace (candidate ($link $x $y)) ($link $x $y)) (init-miner $link1 $x1 $y1 $minsup $dbspace $bindspace $shabspace $spezspace $cndpspace (fromNat (depth)))))
)

(= (run-miner $minsup (S $k) $dbspace $bindspace $shabspace $spezspace $cndpspace) ( (superpose (
                (let ($link1 $x1 $y1) (match $cndpspace (candidate ($link $x $y)) ($link $x $y)) (init-miner $link1 $x1 $y1 $minsup $dbspace $bindspace $shabspace $spezspace $cndpspace (- (fromNat (depth)) (fromNat (S $k)))))
                (run-miner $minsup $k $dbspace $bindspace $shabspace $spezspace $cndpspace)))
    )
)

! (run-miner 2 (depth) &dbspace &bindspace &shabspace &spezspace &cndpspace)
! (match &cndpspace $h $h)
