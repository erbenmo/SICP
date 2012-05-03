(define (simpsons-integral f a b n)
  (let ((h (/ (- b a) n)))
    (define (f-prime x)
      (let ((index (+ a (* x h))))
	(cond ((or (= x 0) (= x n))
	       (f index))
	      ((even? x)
	       (* 2 (f index)))
	      (else
	       (* 4 (f index))))))
    (/ (* h (sum f-prime 0 inc n)) 3)))

(define (inc x) (+ 1 x))

(define (even? x)
  (= (remainder x 2) 0))