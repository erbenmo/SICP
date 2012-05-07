(define (repeated proc n)
  (if (= n 1)
      proc
      (compose proc (repeated proc (- n 1)))))

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
	  (f x)
	  (f (+ x dx)))
       3)))

(define dx 0.001)

(define (n-fold-smooth f n)
  ((repeated smooth n) f))