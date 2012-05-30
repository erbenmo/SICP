(define (sum-square pair)
  (+ (square (car pair)) (square (cadr pair))))

(define sum-square-stream (pairs integers integers sum-square))

(define (stream-filter-consequtive stream)
  (cond ((stream-null? stream) the-empty-stream)
	((= (sum-square (stream-car stream))
	    (sum-square (stream-car (stream-cdr stream)))
	    (sum-square (stream-car (stream-cdr (stream-cdr stream)))))
	 (cons-stream (list (stream-car stream) (stream-car (Stream-cdr stream)) (stream-car (stream-cdr (stream-cdr stream))))
		      (stream-filter-consequtive (stream-cdr (stream-cdr (stream-cdr stream))))))
	(else (stream-filter-consequtive (stream-cdr stream)))))

(define buzz (stream-filter-consequtive sum-square-stream))