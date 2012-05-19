(define (make-account balance original-passwd)
  (let ((all-passwords (list original-passwd)))

    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))

    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)

    (define (legal passwd)
      (not (eq? (memq passwd all-passwords) false)))

    (define (add-password new-passwd)
      (set! all-passwords (cons new-passwd all-passwords)))
    
    (define (dispatch password m)
      (cond ((not (legal password)) (error "Incorrect password"))
	    ((eq? m 'withdraw) withdraw)
	    ((eq? m 'deposit) deposit)
	    ((eq? m 'alias) add-password)
	    (else (error "Unknown Request -- Make Account"
			 m))))

    dispatch))

(define (make-joint source password1 password2)
  ((source password1 'alias) password2)
  source)