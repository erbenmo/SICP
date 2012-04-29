(define (f-recursive n)
  (if (< n 3)
      n
      (+
       (f-recursive (- n 1))
       (* 2 (f-recursive (- n 2)))
       (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)
  (f-iter 0 1 2 n))

(define (f-iter x1 x2 x3 count)
  (if (= count 0)
      x1
      (f-iter x2 x3 (+ (* 3 x1) (* 2 x2) x3) (- count 1))))