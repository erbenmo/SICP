(define (make-queue)
  (let ((front-ptr `())
	(rear-ptr `()))


    (define (print-queue)
      (define (print-q cur)
	(cond ((null? cur)
	       (display ""))
	      ((eq? cur rear-ptr)
	       (display (car rear-ptr)))
	      (else
	       (display (car cur))
	       (print-q (cdr cur)))))
      (print-q front-ptr))

    
    (define (empty-queue?) (null? front-ptr))
    (define (set-front-ptr! item) (set! front-ptr item))
    (define (set-rear-ptr! item) (set! rear-ptr item))

    (define (insert-queue! item)
      (let ((new-pair (cons item `())))
	(cond ((empty-queue?)
	       (display "empty!")
	       (set-front-ptr! new-pair)
	       (set-rear-ptr! new-pair)
	       dispatch)
	      (else
	       (set-cdr! rear-ptr new-pair)
	       (set-rear-ptr! new-pair)
	       dispatch))))
    (define (delete-queue!)
      (cond ((empty-queue?)
	     (error "queue is empty"))
	    (else
	     (set-front-ptr! (cdr front-ptr))
	     dispatch)))
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
	    ((eq? m 'delete-queue!) (delete-queue!))
	    ((eq? m 'empty-queue?) (empty-queue?))
	    ((eq? m 'print-queue) (print-queue))
	    ((eq? m 'front) front-ptr)
	    (else
	     (error "unknown message!"))))
    dispatch))