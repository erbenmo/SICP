(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (midpoint-segment seg)
  (make-point (avg (x-point (start-segment seg))
		   (x-point (end-segment seg)))
	      (avg (y-point (start-segment seg))
		   (y-point (end-segment seg)))))

(define (avg x y)
  (/ (+ x y) 2.0))