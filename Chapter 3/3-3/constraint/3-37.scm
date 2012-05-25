(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
	  x)
      (cv 32)))

(define c (make-connector))
(define f (celsius-fahrenheit-converter c))

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier y z x)
    z))

(define (cv value)
  (let ((z (make-connector)))
    (constant value z)
    z))