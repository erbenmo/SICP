(define (cont-frac n d k)
  (cont-frac-rec n d k 1))

;; 4 decimal accuracy in 11 steps
(define (cont-frac-rec n d k cur)
  (if (or (> cur k) (= cur k))
      (/ (n cur) (d cur))
      (/ (n cur) (+ (d cur) (cont-frac-rec n d k (+ cur 1))))))

(define (n i) 1.0)

(define (d i)
  (let ((iprime (+ 1 i)))
    (cond
     ((= iprime 2) 1)
     ((= iprime 3) 2)
     ((= (remainder iprime 3) 0) (* 2 (/ iprime 3)))
     (else 1))))

(define (euler-2)
  (cont-frac n d 100))