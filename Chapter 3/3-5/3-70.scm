(define (merge s1 s2 weight)
  (cond ((stream-null? s1) s2)
	((stream-null? s2) s1)
	(else
	 (let ((s1car (stream-car s1))
	       (s2car (stream-car s2)))	   
	   (cond ((< (weight s1car) (weight s2car))
		  (cons-stream s1car (merge (stream-cdr s1) s2 weight)))
		 ((> (weight s1car) (weight s2car))
		  (cons-stream s2car (merge s1 (stream-cdr s2) weight)))
		 (else
		  (cons-stream s1car
			       (cons-stream s2car
					    (merge
					     (stream-cdr s1) (stream-cdr s2) weight)))))))))

(define (pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t) weight)
    weight)))

(define (i-plus-j pair)
  (+ (car pair) (cadr pair)))

(define iplusj (pairs integers integers i-plus-j))

(define (buzz pair)
  (let ((i (car pair))
	(j (cadr pair)))
    (+ (* i 2) (* 3 j) (* 5 i j))))


(define (not-divisible-by-235 x)
  (not (or (= (remainder x 2) 0)
	   (= (remainder x 3) 0)
	   (= (remainder x 5) 0))))


(define source (stream-filter not-divisible-by-235 integers))

(define buzz-stream (pairs source source buzz))

;; test
(define (identity x) x)