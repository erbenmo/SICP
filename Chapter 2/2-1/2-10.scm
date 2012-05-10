(define (div-interval x y)
  (if (and (not (> (lower-bound y) 0)) (not (< (upper-bound y) 0)))
      (error "eRRoR: divide by an interval that spans 0")
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))