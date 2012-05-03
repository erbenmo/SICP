(define (no-fool-expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (let ((half-expmod (no-fool-expmod base (/ exp 2) m)))
	   (display base)
	   (if (or (= half-expmod 1) (= half-expmod (- exp 1)))
	       -1
	       (remainder (square (half-expmod) m)))))
	(else
	 (remainder (* base (no-fool-expmod base (- exp 1) m))
		    m))))

(define (no-fool-fermat-test n)
  (define (try-it a)
    (= (no-fool-expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((no-fool-fermat-test n) (fast-prime? n (- times 1)))
	(else false)))