(define (cond-clauses exp) (cdr exp))

(define (let->combination exp)
  (expand-let (cond-clauses exp)))

(define (expand-let-fn clauses)
  (expand-let (fn-var-pair clauses)
	      (sequence->exp
	       (list
		(list 'define
		      (fn-name clauses)
		      (fn-body clauses))
		((fn-name clauses) (right (fn-var-pair clauses)))))))

(define (fn-name clauses) (cadr clauses))
(define (fn-var-pair clauses) (caddr clauses))
(define (fn-body clauses) (cadddr clauses))






(define (left clauses)
  (if (null? clauses)
      `()
      (cons (car (car clauses)) (left (cdr clauses)))))

(define (right clauses)
  (if (null? clauses)
      `()
      (cons (cadr (car clauses)) (right (cdr clauses)))))