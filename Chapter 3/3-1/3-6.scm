(define rand
  (let ((x random-init))

    (define (generate)
      (set! x (rand-update x))
      x)

    (define (reset cur)
      (set! x cur)
      x)

    (define (dispatch message)
      (cond ((eq? message 'generate)
	     (generate))
	    ((eq? message 'reset)
	     reset)
	    (else
	     (error "unknown message to rand"))))

    dispatch))

(define (rand-update x)
  (+ x 1))

(define random-init 1)