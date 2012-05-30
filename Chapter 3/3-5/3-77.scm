(define (integral integrand initial-value dt)
  (cons-stream initial-value
	       (if (stream-null? integrand)
		   the-empty-stream
		   (integral (stream-cdr integrand)
			     (+ (* dt (stream-car integrand))
				initial-value)
			     dt))))

(define (integral delayed-integrand initial-value dt)
  (let ((integrand (force delayed-integrand)))
    (cons-stream initial-value
		 (if (stream-null? integrand)
		     the-empty-stream
		     (integral (stream-cdr integrand)
			       (+ (* dt (stream-car integrand))
				  initial-value)
			       dt))))