(define (rand-update x)
  (remainder (+ (* 13 x) 5) 24))

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define random-numbers
  (cons-stream random-init
	       (stream-map rand-update random-numbers)))

(define (rand message)
  ;; boring..