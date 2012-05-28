(define (div-streams s1 s2)
  (stream-map / s1 s2))

(define (integrate-series as)
  (div-streams as integers))

(define cosine-series
  (cons-stream 1 (scale-stream (integrate-series sine-series) -1)))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))