(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n result)
  (if (= n 0)
      result
      (if (even? n)
	  (fast-expt-iter (square b) (/ n 2) result)
	  (fast-expt-iter b (- n 1) (* result b)))))