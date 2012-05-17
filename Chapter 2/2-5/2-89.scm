(define (first-term term-list)
  (list (car term-list) (- (length term-list) 1)))

(define (adjoin-term term term-list)
  (define (add0 cur-order)
    (if (= cur-order (length term-list))
	term-list
	(cons 0 (add0 (- cur-order 1)))))
  (cons (coeff term) (add0 (- cur-order 1))))