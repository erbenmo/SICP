(define (fast-expr b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expr b (/ n 2))))
	(else (* b (fast-expr b (- n 1))))))

(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))