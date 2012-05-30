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

(define (sum-cube pair)
  (+ (cube (car pair)) (cube (cadr pair))))

(define (cube n) (* n n n))

(define sum-cube-stream (pairs integers integers sum-cube))

(define (stream-filter-consequtive stream)
  (cond ((stream-null? stream) the-empty-stream)
	((= (sum-cube (stream-car stream)) (sum-cube (stream-car (stream-cdr stream))))
	 (cons-stream (stream-car stream)
		      (stream-filter-consequtive (stream-cdr (stream-cdr stream)))))
	(else (stream-filter-consequtive (stream-cdr stream)))))

(define ramanujan (stream-filter-consequtive sum-cube-stream))

;1729
;4104
;13832
;20683
;32832