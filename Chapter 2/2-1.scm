(define (make-rat x y)
  (let ((g (gcd x y)))
    (make-nice-cons (/ x g) (/ y g))))

(define (make-nice-cons up down)
  (if (> (* up down) 0)
      (cons (abs up) (abs down))
      (cons (- (abs up)) (abs down))))