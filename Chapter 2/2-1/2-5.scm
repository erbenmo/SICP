(define (cons-prod x y)
  (* (power 2 x)
     (power 3 y)))

(define (car-prod n)
  (if (= (gcd n 2) 1)
      0
      (+ 1 (car-prod (/ n 2)))))

(define (cdr-prod n)
  (if (= (gcd n 3) 1)
      0
      (+ 1 (cdr-prod (/ n 3)))))


(define (power a n)
  (if (= n 0)
      1
      (* a (power a (- n 1)))))