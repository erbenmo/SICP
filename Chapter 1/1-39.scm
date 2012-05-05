(define (cont-frac n d k)
  (cont-frac-rec n d k 1))

(define (cont-frac-rec n d k cur)
  (if (or (> cur k) (= cur k))
      (/ (n cur) (d cur))
      (/ (n cur) (+ (d cur) (cont-frac-rec n d k (+ cur 1))))))

(define (tan x k)
  (define (d i) (- (* i 2) 1))
  (define (n i)
    (if (= i 1)
	x
	(- (* x x))))
  (cont-frac n d k))