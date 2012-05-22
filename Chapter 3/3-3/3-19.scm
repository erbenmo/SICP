(define (has-cycle x)
  (cond ((null? x) false)
	((check-unique (car x) (cdr x))
	 (has-cycle (cdr x)))
	(else
	 true)))

(define (check-unique elt lst)
    (cond ((null? lst) true)
	  ((eq? elt (car lst)) false)
	  (else
	   (check-unique elt (cdr lst)))))