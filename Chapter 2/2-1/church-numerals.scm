(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; zero/one is not integer...
;; zero/one can be & should be used as integer
;; ((one square) n) = n^2
;; ((two square) n) = n^4

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add num1 num2)
  (lambda (f) (lambda (x) ((num1 f) ((num2 f) x)))))