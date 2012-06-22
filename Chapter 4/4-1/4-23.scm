;; Alyssa P.Hacker's version
(define (analyze-sequence exps)
  (define (execute-sequence procs env)
    (cond ((null? (cdr procs))
	   ((car procs) env))
	  (else ((car procs) env)
		(execute-sequence (cdr procs) env))))
  (let ((procs (map analyze exps)))
    (if (null? procs?)
	(error "Empty sequence --- ANALYZE")
	(lambda (env) (execute-sequence procs env)))))

;;  Hacker's code return a function:
(lambda (env) (execute-sequence `(p1 p2 p3 p4) env))
execute-sequence is not executed

;;  Official code calls loop, which unroll everything but also return a function in the end