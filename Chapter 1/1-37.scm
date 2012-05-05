(define (cont-frac n d k)
  (cont-frac-rec n d k 1))

;; 4 decimal accuracy in 11 steps
(define (cont-frac-rec n d k cur)
  (if (or (> cur k) (= cur k))
      (/ (n cur) (d cur))
      (/ (n cur) (+ (d cur) (cont-frac-rec n d k (+ cur 1))))))

(define (cont-iter n d k)
  (cont-frac-iter n d k k 0))


(define (cont-frac-iter n d k cur result)
  (cond
   ((= cur k)
    (cont-frac-iter n d k (- cur 1) (/ (n cur) (d cur))))
   ((= cur 0)
    result)
   (else
    (cont-frac-iter n d k (- cur 1) (/ (n cur) (+ (d cur) result))))))