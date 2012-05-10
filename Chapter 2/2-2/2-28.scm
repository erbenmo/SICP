(define (fringe x)
  (cond ((null? x)
	 nil)
	(else
	 (cond ((list? x)
		(append (fringe (car x)) (fringe (cdr x))))
	       (else
		(list x))))))