(define (unless->combination exp)
  (expand-unless (get-clauses exp)))


(define (expand-unless clauses)
  (let ((condition (car clauses))
	(usual (cadr clauses))
	(exceptional (caddr clauses)))
    (make-if condition exceptional usual)))

((unless? exp) (eval (unless->combination exp)))




;; 