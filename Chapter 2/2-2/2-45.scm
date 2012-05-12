(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
	(below painter (beside smaller smaller)))))

(define (split op1 op2)
  (define (cur-split painter n)
    (if (= n 0)
	painter
	(let ((smaller (cur-split painter (- n 1))))
	  (op1 painter (op2 smaller smaller)))))
  cur-split)