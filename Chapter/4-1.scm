(define (list-of-values exps env)
  (if (no-operands? exps)
      `()
      (cons (eval (first-operand exps) env)
	    (list-of-values (rest-operands exps) env))))


(define (list-of-values exps env)
  (if (no-operands? exps)
      `()
      (let ((left (eval (first-operand exps) env)))
	(cons left
	      (list-of-values (rest-operands exps) env)))))


(define (list-of-values exps env)
  (if (no-operands? exps)
      `()
      (let ((rest (list-of-values (rest-operands exps) env)))
	(cons (eval (first-operand exps) env)
	      rest))))