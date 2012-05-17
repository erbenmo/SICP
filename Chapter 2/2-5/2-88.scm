(define (neg-poly p)
  (mul-poly p1
	    (make-poly (variable p)
		       (list 0 -1))))

(define (sub-poly p1 p2)
  (add-poly p1 (neg-terms p2)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scheme-number
(put 'neg 'scheme-number (lambda (x) (- x)))

;; rational
(put 'neg 'rational (lambda (x) (make-rat (- (numer x)) (denom x))))

;; complex
(put 'neg 'complex (lambda (x) (make-from-real-imag (- (real-part x))
						    (- (imag-part x)))))

(define (neg x)
  (apply-generic 'neg x))

;; poly
(define (neg-terms l)
  (cond ((empty-termlist? l) l)
	(else
	 (let ((l1 (first-term l)))
	   (adjoint-term (neg l1)
			 (neg-terms (cdr l)))))))
(define (neg-poly p)
  (make-poly (variable p)
	     (neg-terms (term-list p))))

(put 'neg 'polynomial (lambda (x) (tag (neg-poly p))))

(define (sub-poly p1 p2)
  (add-poly p1 (neg p2)))