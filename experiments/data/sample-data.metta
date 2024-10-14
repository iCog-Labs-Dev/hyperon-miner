(Implication P Q)
(Inheritance (And A B) C)
(Inheritance (And (And C D) B) (Or C D))
(Inheritance (And (And C D) B) (Or (And (C D) E)))
(Inheritance (And (And C D) C) (Or (And (C D) E)))
(Inheritance (And (And C D) S) (Or (And (C D) E)))
(Inheritance (And (And C D) B) C)
(Inheritance (And A B) F)
(Inheritance A B)
(Inheritance A C)
(Inheritance D D)
;(Inheritance (And z (s z)) (s (s z)))
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;(Inheritance (And (And C D) B) (Or C D)),#(Inheritance (And (And C D) Varidx (S Z) (Or C D))
;(Inheritance (VarIdx Z) (Or C D)), 
;(Inheritance (And (And C D) B) (VarIdx (S Z)))
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;(Inheritance (And $x (And $y $z)) $w

(Inheritance (And (And C D) B) (VarIdx (S Z)))

### At depth 0
(Inheritance $X $Y)


### At depth 1
(Inheritance $X $Y) ---> (Inheritance (And (And C D) B) (Or C D))
{$X -> (And (And C D) B)} ..... {$Y -> (Or C D)} ---- binding step
{$X -> (And $X $Y)} ..... {$Y -> (Or $X $Y)} ----- shallow-abstraction step
{$X -> (And $X B), $X -> (And (And C D) $Y)} ..... {$Y -> (Or $X D), $Y -> (Or C $Y)} ----- specialization step

(Inheritance (VarIdx Z) C)
(Inheritance A (VarIdx (S Z)))
(Inheritance (And A B) (VarIdx (S Z)))
;{$Z -> (And ...)}
;(Inheritance (And $Z $W) $Y) ---> (Inheritance (And (And $V $T) $W) $Y)

(Inheritance (And C D))

;Nil Geisweiller
;10:51 AM
;(Inheritance $X $Y) ----> (Inheritance (And $X $Z) $Y)
;(Inheritance $X $Y) ----> (Inheritance $X D)
;Nil Geisweiller
;10:52 AM
;(Inheritance (And $X $Z) $Y)
; ---> (Inheritance (And $X $Z) D)
;(Inheritance $X D) --> (Inheritance (And $X $Z) D)
;
;Nil Geisweiller
;10:22 AM
;What about pattern
;(Inheritance (And z (s z)) (s (s z)))
;?
;Nil Geisweiller
;10:25 AM
;(Inheritance (And z (s z)) (s (s z)))
;{z -> (And C D), (s z) -> B, (s (s z)) -> (Or C D)}
;Hedra Seid
;10:25 AM
;(Inheritance (And z (s z)) (Or z (s z)))
;Nil Geisweiller
;10:26 AM
;(Inheritance (And z (And sz ssz) (Or sssz ssssz)))
;Nil Geisweiller
;10:28 AM
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;Nil Geisweiller
;10:31 AM
;(Inheritance A $x)
;Nil Geisweiller
;10:32 AM
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;(Inheritance (And $x (And $y $z)) $w)
;Hedra Seid
;10:36 AM
;(Inheritance (VarInx Z) (VarInd (S Z)))
;(Inheritance $X $Y)
;Nil Geisweiller
;10:39 AM
;$X
;$X ----> (Inheritance $X $Y)
;Nil Geisweiller
;10:41 AM
;(Inheritance $X $Y) ----> (Inheritance (And $X $Z) $Y)
;Nil Geisweiller
;10:43 AM
;(Inheritance (And A B) C)
;(Inheritance $X $Y)
;(shallow-abstraction (Inheritance (And A B) C)) == (Inheritance $X $Y)
;Nil Geisweiller
;10:45 AM
;(match (Inheritance $X $Y))
;{{$X -> (And A B), $Y -> C}
; ...
;}
;Nil Geisweiller
;10:46 AM
;(shallow-abstraction (And A B)) == (And $Z $W)
;(Inheritance $X $Y) --> (Inheritance (And $Z $W) $Y)
(Implication P Q)
(Inheritance (And A B) C)
(Inheritance (And (And C D) B) (Or C D))
(Inheritance (And (And C D) B) (Or (And (C D) E)))
(Inheritance (And (And C D) B) C)
(Inheritance (And A B) F)
(Inheritance A B)
(Inheritance A C)
(Inheritance D D)
;(Inheritance (And z (s z)) (s (s z))) ## (Inheritance (And (And C D) $Y) $Y)
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;(Inheritance (And (And C D) B) (Or C D)),#(Inheritance (And (And C D) Varidx (S Z) (Or C D))
;(Inheritance (VarIdx Z) (Or C D)), 
;(Inheritance (And (And C D) B) (VarIdx (S Z))) ### (Inheritance (And $X B) $Y)
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;(Inheritance (And $x (And $y $z))) $w

;(Inheritance (And (And C D) B) (VarIdx (S Z)))

### At depth 0
(Inheritance $X $Y) --- The pattern.

### At depth 0
{$X -> (And (And C D) B)}                                      ------
{$X -> (And A B)}                                              ------                         
{$X -> A}                                                             ------ 
{$X -> D}                                                             ------                                           
{$Y -> C}                                                                   ------       Binding step
{$Y -> (Or C D)}                                                      ------
{$Y -> (Or (And (C D) E))}                                                             ------
{$Y -> B}                                                      ------
{$Y -> D}                                                      ------


### Do shallow abstraction
{$Sha-abs -> Inheritance $X $Y}

### Specialize over X
{$X -> Inheritance (And (And C D) B) $Y}
{$X -> Inheritance (And A B) $Y}
{$X -> Inheritance A $Y}
{$X -> Inheritance D $Y}

### Specialize Over Y
{$Y -> Inheritance $X C}
{$Y -> Inheritance $X (Or C D)}
{$Y -> Inheritance $X (Or (And (C D) E))}
{$Y -> Inheritance $X B}
{$Y -> Inheritance $X C}
{$Y -> Inheritance $X D}

### Candidate pattern(Patterns those meet minimum support)
{$Cand-pattern -> (Inheritance (And (And C D) B) $Y)}
{$Cand-pattern -> (Inheritance (And A B) $Y)}
{$Cand-pattern -> (Inheritance A $Y)}
{$Cand-pattern -> (Inheritance $X C)}
{$Cand-pattern -> (Inheritance $X (Or (And (C D) E)))}

### At depth 1
(Inheritance (And (And C D) B) $Y) -> (And (And C D) B) And $Y ####if the arguments at depth 1 are expression, do binding set evaluation, otherwise leave them as they are.

### Binding-set over the first argument.
{$X -> (And C D)}
{$Y -> B}

### Do shallow abstraction over the first argument
{Sha-abs -> Inheritance (And $Z $W) $Y}

### Specialize over X of the first argument.
{$Z -> And (And C D) $W}

### Specialize over Y of the first argument.
{$W -> And $Z B}

### Do substitution
{$Sub-over-X -> (Inheritance (And (And C D) $W) $Y)}
{$Sub-over-Y -> (Inheritance (And $Z B) $Y)}




### At depth 1
(Inheritance (And (And C D) B))

(Inheritance (VarIdx Z) C)
(Inheritance A (VarIdx (S Z)))
(Inheritance (And A B) (VarIdx (S Z)))
;{$Z -> (And ...)}
;(Inheritance (And $Z $W) $Y) ---> (Inheritance (And (And $V $T) $W) $Y)

(Inheritance (And C D))


;Nil Geisweiller
;10:51 AM
;(Inheritance $X $Y) ----> (Inheritance (And $X $Z) $Y)
;(Inheritance $X $Y) ----> (Inheritance $X D)
;Nil Geisweiller
;10:52 AM
;(Inheritance (And $X $Z) $Y)
; ---> (Inheritance (And $X $Z) D)
;(Inheritance $X D) --> (Inheritance (And $X $Z) D)
;
;Nil Geisweiller
;10:22 AM
;What about pattern
;(Inheritance (And z (s z)) (s (s z)))
;?
;Nil Geisweiller
;10:25 AM
;(Inheritance (And z (s z)) (s (s z)))
;{z -> (And C D), (s z) -> B, (s (s z)) -> (Or C D)}
;Hedra Seid
;10:25 AM
;(Inheritance (And z (s z)) (Or z (s z)))
;Nil Geisweiller
;10:26 AM
;(Inheritance (And z (And sz ssz) (Or sssz ssssz)))
;Nil Geisweiller
;10:28 AM
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;Nil Geisweiller
;10:31 AM
;(Inheritance A $x)
;Nil Geisweiller
;10:32 AM
;(Inheritance (And $x (And $y $z)) (Or $w $v))
;(Inheritance (And $x (And $y $z)) $w)
;Hedra Seid
;10:36 AM
;(Inheritance (VarInx Z) (VarInd (S Z)))
;(Inheritance $X $Y)
;Nil Geisweiller
;10:39 AM
;$X
;$X ----> (Inheritance $X $Y)
;Nil Geisweiller
;10:41 AM
;(Inheritance $X $Y) ----> (Inheritance (And $X $Z) $Y)
;Nil Geisweiller
;10:43 AM
;(Inheritance (And A B) C)
;(Inheritance $X $Y)
;(shallow-abstraction (Inheritance (And A B) C)) == (Inheritance $X $Y)
;Nil Geisweiller
;10:45 AM
;(match (Inheritance $X $Y))
;{{$X -> (And A B), $Y -> C}
; ...
;}
;Nil Geisweiller
;10:46 AM
;(shallow-abstraction (And A B)) == (And $Z $W)
;(Inheritance $X $Y) --> (Inheritance (And $Z $W) $Y)


Binding-set $X A  Binding-set $Y B
Binding-set $X A  Binding-set $Y C

Inheritance $X $Y

SpecializationOf
Inheritance A $Y
Inheritance
