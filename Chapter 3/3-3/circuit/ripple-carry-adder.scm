(define (ripple-carry-adder as bs ss c)
  (cond ((null? as) 'ok)
	(else
	 (let ((c-out (make-wire)))
	   (let ((a (car as))
		 (b (car bs))
		 (s (car ss)))
	     (full-adder a b c s c-out)
	     (ripple-carry-adder (cdr as) (cdr bs) (cdr ss) c-out))))))

;; delay is sum of delay of n Full-Adders