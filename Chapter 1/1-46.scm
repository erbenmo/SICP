(define (iterative-improve good? improve)
  (define (rec-improve guess)
    (if (good? guess (improve guess))
	guess
	(rec-improve (improve guess))))
  (lambda (x) (rec-improve x)))

(define tolerance 0.0001)

(define (close-enough? x1 x2)
  (< (/ (abs (- x1 x2)) (/ (+ x1 x2) 2)) tolerance))

(define (sqrt x)
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2.0))
  ((iterative-improve close-enough? improve) 1.0))

(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))