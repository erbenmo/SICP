(define RLC (R L C dt)
  (lambda (vc0 il0)
    (define vc (integral (delay dvc) vc0 dt))
    (define il (integral (delay dil) il0 dt))
    (define dvc (scale-stream il (- (/ 1 C))))
    (define dil (add-streams
		 (scale-stream vc (/ 1 L))
		 (scale-stream il (- (/ R L)))))
    (define (merge-streams s1 s2)
      (cons-stream
       (cons (stream-car s1) (stream-car s2))
       (merge-streams (stream-cdr s1) (stream-cdr s2))))
    (merge-streams vc il)))