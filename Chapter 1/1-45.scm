(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average a b) (/ (+ a b) 2))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(define (4th-root x)
  (fixed-point (lambda (y)
		 (average y (average y
				     (/ x (* y y y))))) 1.0))

(define (5th-root x)
  (fixed-point (lambda (y)
		 (average y (average y
				     (/ x (* y y y y))))) 1.0))

(define (6th-root x)
  (fixed-point (lambda (y)
		 (average y (average y
				     (/ x (* y y y y y))))) 1.0))

(define (7th-root x)
  (fixed-point (lambda (y)
		 (average y (average y
				     (/ x (* y y y y y y))))) 1.0))

(define (8th-root x)
  (fixed-point (lambda (y)
		 (average y (average y (average y
				     (/ x (* y y y y y y y)))))) 1.0))

(define (power a n)
  (if (= n 1)
      a
      (* a (power a (- n 1)))))


(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (lg2 x)
  (/ (log x) (log 2)))

(define (repeated proc n)
  (if (= n 1)
      proc
      (compose proc (repeated proc (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (nth-root x n)
  (let ((times (floor (lg2 n))))
    (fixed-point ((repeated average-damp times)
		  (lambda (y)
		    (/ x (power y (- n 1))))) 1.0)))