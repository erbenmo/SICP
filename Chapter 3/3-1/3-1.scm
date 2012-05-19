(define (accumulator balance)
  (lambda (amount)
    (begin (set! balance (+ balance amount))
	   balance)))