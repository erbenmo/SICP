(define (estimate-integral test
			   x1 x2 y1 y2
			   trials)
  (define (experiment)
    (let ((x (random-in-range x1 x2))
	  (y (random-in-range y1 y2)))
      (test x y)))
  (* (monte-carlo trials experiment) (area x1 x2 y1 y2)))

(define (area x1 x2 y1 y2)
  (* (- x1 x2) (- y1 y2)))

(define (test-in-circle x y)
  (<= (+ (square (- x 5)) (square (- y 7))) 9))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1) (+ trials-passed 1)))
	  (else
	   (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (get-pi)
  (/ (estimate-integral test-in-circle 2.0 8.0 4.0 10.0 1000000) 9))