(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (interleave
     (stream-map (lambda (v) (list (stream-car s) v))
		(stream-cdr t))
     (stream-map (lambda (v) (list v (stream-car t)))
		(stream-cdr s)))
    (pairs (stream-cdr s) (stream-cdr t)))))