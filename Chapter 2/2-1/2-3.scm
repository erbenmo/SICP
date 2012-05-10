(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (avg x y)
  (/ (+ x y) 2.0))


(define (length seg)
  (let ((dx (abs (- (x-point (start-segment seg)) (x-point (end-segment seg)))))
	(dy (abs (- (y-point (start-segment seg)) (y-point (end-segment seg))))))
    (sqrt (+ (* dx dx)
	     (* dy dy)))))


(define (make-rectangle up down left right)
  (cons up (cons down (cons left right))))

(define (get-up rec) (car rec))
(define (get-down rec) (cadr rec))
(define (get-left rec) (caddr rec))
(define (get-right rec) (cdddr rec))

(define (width rec)
  (length (get-up rec)))

(define (height rec)
  (length (get-left rec)))

(define (perimeter rec)
  (+ (width rec)
     (width rec)
     (height rec)
     (height rec)))

(define (area rec)
  (* (width rec)
     (height rec)))


;;; adding barriers means adding more layers (i.e. width/height of a rectangle) between area-function and low-level implementation of rectangle?
