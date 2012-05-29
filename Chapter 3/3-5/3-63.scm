(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
		 (stream-map (lambda (guess)
			       (sqrt-improve guess x))
			     guesses)))
  guesses)

;; Reasoner's version
(define (sqrt-stream x)
  (cons-stream 1.0
	       (stream-map (lambda (guess)
			     (sqrt-improve guess x))
			   (sqrt-stream x))))

;; backbone ~ memoize table
;; guess = backbone
;; new (sqrt-stream x) = new backbone => new memoize object
;;                                    => recomputing value in old backbone 