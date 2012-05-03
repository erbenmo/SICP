(define (filtered-accumulate combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (if (filter a)
	  (combiner (term a)
		    (filtered-accumulate combiner null-value filter  term (next a) next b))
	  (filtered-accumulate combiner null-value filter term (next a) next b))))

(define (sum-of-prime a b)
  (filtered-accumulate + 0 prime? identity a inc b))

(define (product-of-relatively-prime-to n)
  (define (relatively-prime? x)
    (= (gcd x n) 1))
  (filtered-accumulate * 1 relatively-prime? identity 1 inc n))





(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (naive-next n)
  (+ n 1))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))