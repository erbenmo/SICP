(define low 0)
(define high 101)
(define random-init 13)

(define (rand-update x)
  (remainder (+ (* 21 x) 59) high))

(define random-numbers
  (cons-stream random-init
	       (stream-map rand-update random-numbers)))

(define area-stream
  (map-successive-pairs (lambda (a b)
			  (< (+ (square (- a 50.5)) (square (- b 50.5))) (square 50.5)))
			random-numbers))

(define (map-successive-pairs f s)
  (cons-stream
   (f (stream-car s) (stream-car (stream-cdr s)))
   (map-successive-pairs f (stream-cdr (stream-cdr s)))))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))

(define pi
  (stream-map (lambda (p) (* 4 p))
	      (monte-carlo area-stream 1 1)))