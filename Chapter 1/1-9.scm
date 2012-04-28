(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))
;;; recursive


(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

;;; state can described by (a,b)
;;; => tail-recursive