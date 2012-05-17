(define (implement-dense)
  
  (define (adjoin-term term term-list)
    (define (add0 cur-order)
      (if (= cur-order (length term-list))
	  term-list
	  (cons 0 (add0 (- cur-order 1)))))
    (cons (coeff term) (add0 (- cur-order 1))))

  (define (first-term term-list)
    (list (car term-list) (- (length term-list) 1)))

  (put 'adjoin-term 'dense (lambda (term term-list)
			     (adjoin-term term term-list)))

  (put 'first-term 'dense (lambda (term-list)
			    (first-term term-list))))

(define (implement-sparse)

  (define (adjoin-term term term-list)
    (if (=zero? (coeff term)
		term-list
		(cons term term-list))))

  (define (first-term term-list) (car term-list))


  (put 'adjoin-term 'sparse (lambda (term term-list)
			      (adjoin-term term term-list)))

  (put 'first-term 'sparse (lambda (term-list)
			     (first-term term-list))))

(define (adjoin-term term term-list)
  (apply-generic term term-list))

(define (first-term term-list)
  (apply-generic term-list))