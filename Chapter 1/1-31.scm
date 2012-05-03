(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* (term a) result)))))


(define (inc x) (+ x 1))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))


;; (x-1)(x+1)/x^2
(define (weird x)
  (/ (* (- x 1) (+ x 1))
     (square x)))

(define (plus-two x)
  (+ x 2))

(define (pi-over-two)
  (product weird 3 plus-two 2001))