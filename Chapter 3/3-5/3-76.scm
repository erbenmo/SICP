(define (make-zero-crossings-generic input-stream last-value)
  (cons-stream
   (sign-change-detector (stream-car input-stream) last-value)
   (make-zero-crossings-generic (stream-cdr input-stream)
			(stream-car input-stream))))

(define (smooth signal last-value)
  (let ((avpt (/ (+ (stream-car signal) last-value) 2)))
    (cons-stream (avpt
		  (smooth (stream-cdr signal) (stream-car signal))))))

(define (make-zero-crossings input-stream)
  (let ((after-smooth (smooth input-stream) (stream-car input-stream)))
    (make-zero-crossings-generic after-smooth (stream-car after-smooth))))