(define (stream-limit s tolerance)
  (cond ((stream-null? (stream-cdr s))
	 (error "can't find limit"))
	((< (abs (- (stream-car s) (stream-car (stream-cdr s)))) tolerance)
	 (stream-car s))
	(else
	 (stream-limit (stream-cdr s) tolerance))))