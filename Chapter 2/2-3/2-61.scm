(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((= (car set) x) set)
	((< (car set) x)
	 (cons (car set) (adjoin-set x (cdr set))))
	(else
	 (append (list x) set))))