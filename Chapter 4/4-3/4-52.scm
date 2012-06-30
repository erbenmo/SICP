(define (analyze-if-fail exp)
  (let ((pproc (analyze (content-of-if-fail exp)))
	(cproc (analyze (to-return-if-fail exp))))
    (lambda (env succeed fail)
      (content
       env
       (lambda () val)
       (cproc env succeed fail)))))


(define (content-of-if-fail exp) (cadr exp))

(define (to-return-if-fail exp) (caddr exp))


(if-fail (let ((x (an-element-of '(1 3 5))))
	   (require (even? x))
	   x)
	 'all-odd)