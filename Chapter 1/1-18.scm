(define (even? x)
  (= (remainder x 2) 0))

(define (fast-multiply a b)
  (fast-multiply-iter a b 0))

(define (fast-multiply-iter a b result)
  (if (= b 0)
      result
      (if (even? b)
	  (fast-multiply-iter (+ a a) (/ b 2) result)
	  (fast-multiply-iter a (- b 1) (+ result a)))))