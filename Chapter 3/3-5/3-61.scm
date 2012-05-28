(define (invert-unit-series s)
  (let ((sr (stream-cdr s)))
    (cons-stream 1 (scale-stream (mul-series sr (invert-unit-series s)) -1))))