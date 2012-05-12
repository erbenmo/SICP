(define ll (make-vect 0 0))
(define lr (make-vect 1 0))
(define ul (make-vect 0 1))
(define ur (make-vect 1 1))

;; a
(segments->painter
 (list
  (make-segment ll lr)
  (make-segment ll ul)
  (make-segment ur ul)
  (make-segment ur lr)))

;; b
(segments->painter
 (list
  (make-segment ll ur)
  (make-segment ul lr)))

;; c
(define (mid-point seg)
  (make-vect (/ (+ (xcor-vect (starg-segment seg))
		   (xcor-vect (end-segment seg))) 2.0)
	     (/ (+ (ycor-vect (start-segment seg))
		   (ycor-vect (end-segment seg))) 2.0)))

(segments->painter
 (let ((bottom-center (mid-point (make-segment ll lr)))
       (up-center (mid-point (make-segment ul ur)))
       (left-center (mid-point (make-segment ll ul)))
       (right-center (mid-point (make-segment ur lr))))
   (segments-painter
    (list
     (make-segment bottom-center left-center)
     (make-segment bottom-center right-center)
     (make-segment up-center left-center)
     (make-segment up-center right-center)))))