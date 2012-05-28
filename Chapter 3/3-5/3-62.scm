(define (div-series s1 s2)
  (let ((c (stream-car s2)))
    (let ((invert-s2-normalized) (invert-unit-series (scale-stream s2 (/ 1 c))))
      (scale-stream (mul-stream s1 invert-s2) (/ 1 c)))))

(Define tan-series (div-series sine-series cosine-series))