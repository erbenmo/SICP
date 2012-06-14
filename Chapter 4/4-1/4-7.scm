(define (let*->nested-lets clauses)
  (define (let*->lets initforms body)
    (if (null? initforms)
	body
	(make-let (list (car initform)) (let*->lets (cdr initforms) body))))
  (let*->lets (cadr clauses) (caddr clauses)))

(define (make-let initforms body)
  (list 'let initforms body))