(define (count-pairs target)
  (let ((history `()))
    (define (count x)
      (cond ((not (pair? x)) 0)
	    ((new? x history)
	     (begin
	       (update-history x)
	       (+ (count (car x))
		  (count (cdr x))
		  1)))
	    (else 0)))

    (define (update-history x)
      (set! history (cons x history)))

    (define (new? x dict)
      (cond ((or (null? x) (null? dict)) true)
	    ((eq? x (car dict)) false)
	    (else
	     (new? x (cdr dict)))))

    (count target)))