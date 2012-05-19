(define global 1)

(define (f x)
  (set! global (+ global x))
  global)