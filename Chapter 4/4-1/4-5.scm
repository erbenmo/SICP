(define (cond-predicate clause) (car clause))

(define (cond-actions clause) (cdr clause))

(define (weird-predicate clause) (cadr clause))
(define (weird-action clause) (caddr clause))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
	    (rest (cdr clauses)))
	(if (cond-else-clause? first)
	    (if (null? rest)
		(sequence->exp (cond-actions first))
		(error "ELSE clause isn't last -- COND->IF"
		       clauses))
	    (if (eq? '=> (weird-predicate first))
		(make-if (cond-predicate first)
			 (list (weird-action clause) (cond-predicate clause))
			 (expand-clauses rest))
		(make-if (cond-predicate first)
			 (sequence-exp (cond-actions first))
			 (expand-clauses rest)))))))