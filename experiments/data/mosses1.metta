
; (Implication (Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))) (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))) (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row O (Col E E)))))
; (Implication (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row O (Col E E)))) (Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col E E)))))
; (Implication (Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col E E)))) (Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col O E)))))
; (Implication (Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col O E)))) (Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col O X)))))
; (Inheritance (Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col O X)))) Game_Win_X)

(Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E))))
(Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E))))
(Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row O (Col E E))))
(Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col E E))))
(Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col O E))))
(Board (Row X (Col E E)) (Rows (Row E (Col X E)) (Row O (Col O X))))

; (Implication (Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))) (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))) (Board (Row X (Col E E)) (Rows (Row E (Col O E)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col E E)) (Rows (Row E (Col O E)) (Row E (Col E E)))) (Board (Row X (Col E X)) (Rows (Row E (Col O E)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col E X)) (Rows (Row E (Col O E)) (Row E (Col E E)))) (Board (Row X (Col O X)) (Rows (Row E (Col O E)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col O X)) (Rows (Row E (Col O E)) (Row E (Col E E)))) (Board (Row X (Col O X)) (Rows (Row E (Col O X)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col O X)) (Rows (Row E (Col O X)) (Row E (Col E E)))) (Board (Row X (Col O X)) (Rows (Row E (Col O X)) (Row E (Col O E)))))
; (Inheritance (Board (Row X (Col O X)) (Rows (Row E (Col O X)) (Row E (Col O E)))) Game_Win_O)

; (Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E))))
; (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E))))
; (Board (Row X (Col E E)) (Rows (Row E (Col O E)) (Row E (Col E E))))
; (Board (Row X (Col E X)) (Rows (Row E (Col O E)) (Row E (Col E E))))
; (Board (Row X (Col O X)) (Rows (Row E (Col O E)) (Row E (Col E E))))
; (Board (Row X (Col O X)) (Rows (Row E (Col O X)) (Row E (Col E E))))
; (Board (Row X (Col O X)) (Rows (Row E (Col O X)) (Row E (Col O E))))

; (Implication (Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))) (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))) (Board (Row X (Col E O)) (Rows (Row E (Col E E)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col E O)) (Rows (Row E (Col E E)) (Row E (Col E E)))) (Board (Row X (Col E O)) (Rows (Row E (Col X E)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col E O)) (Rows (Row E (Col X E)) (Row E (Col E E)))) (Board (Row X (Col E O)) (Rows (Row E (Col X O)) (Row E (Col E E)))))
; (Implication (Board (Row X (Col E O)) (Rows (Row E (Col X O)) (Row E (Col E E)))) (Board (Row X (Col E O)) (Rows (Row E (Col X O)) (Row E (Col E X)))))
; (Inheritance (Board (Row X (Col E O)) (Rows (Row E (Col X O)) (Row E (Col E X)))) Game_Win_X)

; (Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E))))
; (Board (Row X (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E))))
; (Board (Row X (Col E O)) (Rows (Row E (Col E E)) (Row E (Col E E))))
; (Board (Row X (Col E O)) (Rows (Row E (Col X E)) (Row E (Col E E))))
; (Board (Row X (Col E O)) (Rows (Row E (Col X O)) (Row E (Col E E))))
; (Board (Row X (Col E O)) (Rows (Row E (Col X O)) (Row E (Col E X))))


; (Implication (Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E E)))) (Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E X)))))
; (Implication (Board (Row E (Col E E)) (Rows (Row E (Col E E)) (Row E (Col E X)))) (Board (Row E (Col E E)) (Rows (Row E (Col O E)) (Row E (Col E X)))))

