(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))  ;; ok 2*i
	       (add-streams
		(scale-stream (stream-cdr s2) (stream-car s1))  ;; ok 2*i+1
		(mul-series s2 (stream-cdr s1)))))  ;; ok start from 2*i+1
		