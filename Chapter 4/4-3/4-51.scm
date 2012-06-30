(define (analyze-permanent-assignment exp)
  (let ((var (assignment-variable exp))
	(vproc (analyze (assignment-value exp)))) 
    (lambda (env succeed fail)
      (vproc env
	     (lambda (val fail2)
	       (let ((old-value
		      (lookup-variable-value var env)))
		 (set-variable-value! varff val env)
		 (succeed 'ok
			  (lambda ()			    
			    (fail2)))))
	     fail))))

(define (permanent-assignment? exp)
  (tagged-list exp 'permanent-set!))