(define count 0)

(define (id x)
  (set! count (+ count 1))
  x)

(define w (id (id 10)))

1 => 2

note that definition doesn't use lazy evaluation