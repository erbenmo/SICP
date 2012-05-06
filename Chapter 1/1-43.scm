(define (repeated proc n)
  (if (= n 1)
      proc
      (compose proc (repeated proc (- n 1)))))