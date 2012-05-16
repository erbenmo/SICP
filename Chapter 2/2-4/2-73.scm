(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp)) (operands exp)
	       var))))

;; a)   number -> exp
;;      + -> (car exp)


;; b)
(define (install-sum)
  (define (sum exp)
    (make-sum (deriv (addend exp) var)
	      (deriv (Augend exp) var)))
  (put 'deriv '+ sum))
    
    
(define (install-product)
  (define (product exp)
    (make-sum
     (make-product (multiplier exp)
		   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
		   (multiplicand exp))))
  (put 'deriv '* product))


((exponentiation? exp)
	 (make-product (make-product
			(exponent exp)
			(make-exponentiation (base exp)
					     (make-sum (exponent exp) `-1)))
		       (deriv (base exp) var)))

;; c)
(define (install-exponentiation)
  (define (exponentiation exp)
    (make-product (make-product
		   (exponent exp)
		   (make-exponentiation (base exp)
					(make-sum (exponent exp) `-1)))
		  (deriv (base exp) var)))
  (put 'deriv '** exponentiation))


;; d)
;; ??