(define variable lookup-variable-value)

(define (quoted exp env) (text-of-quotation exp))

(define assignment eval-assignment)

(define definition eval-definition)

(define if eval-if)

(define (lambda exp env)
  (make-procedure (lambda-parameters exp)
		  (lambda-body exp)
		  env))

(define (begin exp env)
 (eval-sequence (begin-actions exp) env))

(define (cond exp env) (eval (cond->if exp) env))

(define (application exp env)
  (apply (eval (operator exp) env)
	 (list-of-values (operands exp) env)))

(put 'quoted quoted)
(put 'assignment assignment)
(put 'define definition)
(put 'if if)
(put 'lambda lambda)
(put 'begin begin)
(put 'cond cond)

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((get (car exp))
	 ((get (car exp)) exp env))
	((application? exp)
	 (application exp env))
	(else (error "Wrong dispatch, exp is " exp))))