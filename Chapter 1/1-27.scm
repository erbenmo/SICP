(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (test-is-tricky n cur-a)
  (if (prime? n)
      (display "is prime...skip")
      ((cond
	 ((= cur-a n) (display "is tricky indeed"))
	 ((= (expmod cur-a n n) cur-a) (test-is-tricky n (+ 1 cur-a)))
	 (else (display "not tricky"))))))


;; weird behavior in the end of the tricky case