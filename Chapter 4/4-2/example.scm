(define (try a b)
  (if (= a 0) 1 b))

(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))

(unless (= b 0)
	(/ a b)
	(begin (display "exception: returning 0")
	       0))