(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	(else
	 (adjoin-set (car set1)
		 (union-set (cdr set1) set2)))))