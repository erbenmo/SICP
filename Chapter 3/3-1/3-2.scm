(define (make-monitored f)
  (let ((calls 0))
    (define (dispatch arg)
      (cond ((eq? arg 'how-many-calls?) calls)
	    (else
	     (begin (set! calls (+ calls 1))
		    (f arg)))))
    dispatch))