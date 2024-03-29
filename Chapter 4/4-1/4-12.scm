(define (env-iter var env transition fn)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
	     (transition env))
	    ((eq? var (car vars))
	     (fn vals vars))
	    (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
	(error "Unbound variable" fn)
	(let ((frame (first-frame env)))
	  (scan (frame-variables frame)
		(frame-values frame)))))
  (env-loop env))

(define (set-variable-value! var val env)
  (define (transition cur-env)
    (env-iter var (enclosing-environment cur-env) transition fn))
  (define (fn vals vars)
    (set-car! vals val))
  (env-iter var env transition fn))

(define (lookup-variable-value var env)
  (define (transition cur-env)
    (env-iter var (enclosing-environment cur-env) transition fn))
  (define (fn vals vars)
    (car vals))
  (env-iter var env transition fn))

(define (define-variable! var val env)
  (define (transition cur-env)
    (add-binding-to-frame! var val (first-frame env)))
  (define (fn vals vars)
    (set-car! vals val))
  (env-iter var env transition fn))