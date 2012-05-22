(define (has-cycle x)
  (let ((history `()))
    (define (check lst)
      (cond ((null? lst) false)
	    ((contains (car lst) history) true)
	    (else
	     (begin
	       (set! history (cons (car lst) history))
	       (check (cdr lst))))))
    (check x)))

(define (contains elt lst)
  (not (not (memq elt lst))))