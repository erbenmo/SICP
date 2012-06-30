(define (analyze-ramb exp)
  (analyze-amb
   (cons 'amb
	 (shuffle (amb-choices exp)))))

((ramb? exp) (analyze-ramb exp))