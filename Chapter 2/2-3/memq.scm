(define (memq item x)
  (cond ((null? x) nil)
	((eq? (car x) item) x)
	(else (memq item (cdr x)))))