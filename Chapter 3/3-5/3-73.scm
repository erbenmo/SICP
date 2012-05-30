(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
		 (add-streams (scale-stream integrand dt)
			      int)))
  int)

(define (RC R C dt)
  (lambda (stream-i v0)
    (add-streams
     (scale-stream stream-i R)
     (integral (scale-stream stream-i (/ 1.0 C)) v0 dt))))