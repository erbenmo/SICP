(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high))
	(hsq (* high high)))
    (let ((j (an-integer-between i high)))
      (let ((ksq (+ (* i i) (* j j))))
	(require (>= hsq ksq)) ;; because k<=high
	(let ((k (sqrt ksq)))
	  (require (integer? k))
	  (list i j k))))))

;; yes N^2