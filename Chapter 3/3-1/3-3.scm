(define (make-account balance correct-passwd)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch password m)
    (cond ((not (eq? password correct-passwd)) (error "Incorrect password"))
	  ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Unknown Request -- Make Account"
		       m))))

  dispatch)