(define (make-account balance correct-passwd)
  (let ((error-number 0))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))

    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)

    (define (password-error)
      (set! error-number (+ error-number 1))
      (if (>= error-number 7)
	  (error "call cop")
	  (error "Wrong Password!")))

    (define (dispatch password m)
      (if (not (eq? password correct-passwd))
	  (password-error)
	  (begin (set! error-number 0)
		 (cond
		  ((eq? m 'withdraw) withdraw)
		  ((eq? m 'deposit) deposit)
		  (else (error "Unknown Request -- Make Account"
			       m))))))
    dispatch))