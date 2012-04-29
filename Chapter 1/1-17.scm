(define (multiply a b)
  (if (= b 0)
      0
      (+ a (multiply a (-b 1)))))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-multiply a b)
  (cond ((= b 0) 0)
	((even? b) (* 2 (fast-multiply a (/ b 2))))
	(else (+ a (fast-multiply a (- b 1))))))