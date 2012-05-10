(define (make-center-percent center percent)
  (make-interval (- center (* center percent))
		 (+ center (* center percent))))

(define (percent i)
  (/ (/ (- (upper-bound i) (lower-bound i)) 2.0) (center i)))