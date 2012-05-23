(define nil `())
(define (set-prev node prev)
  (set-car! node prev))

(define (set-next node next)
  (set-cdr! (cdr node) next))

(define (set-item node item)
  (set-car! (cdr node) item))

(define (prev node) (car node))
(define (next node) (cddr node))
(define (item node) (cadr node))
(define (make-node item) (cons nil (cons item nil)))

(define (front-ptr queue)(car queue))

(define (rear-ptr queue) (cdr queue))

(define (set-front-ptr! queue node) (set-car! queue node))

(define (set-rear-ptr! queue node) (set-cdr! queue node))

(define (make-queue (cons nil nil)))

(define (empty-queue? queue) (null? (front-ptr queue)))

(define (rear-insert-queue! queue item)
  (let ((new-node (make-node item)))
    (cond ((empty-queue? queue)
	   (set-front-ptr! queue new-node)
	   (set-rear-ptr! queue new-node))	  
	  (else
	   (set-prev new-node (rear-ptr queue))
	   (set-next (rear-ptr queue) new-node)
	   (set-rear-ptr! queue new-node)))))

(define (front-delete-queue! queue)
  (cond ((empty-queue? queue)
	 (error "queue is empty"))
  	(else
	 (set-front-ptr! queue (next (front-ptr queue)))
	 (if (not (null? (front-ptr queue)))
	     (set-prev (front-ptr queue) nil)))))

(define (front-insert-queue! queue item)
  (let ((new-node (make-node item)))
    (cond ((empty-queue? queue)
	   (set-front-ptr! queue new-node)
	   (set-rear-ptr! queue new-node))
	  (else
	   (set-next new-node (front-ptr queue))
	   (set-prev (front-ptr queue) new-node)
	   (set-front-ptr! queue new-node)))))	   

(define (rear-delete-queue! queue)
  (cond ((empty-queue? queue)
	 (error "queue is empty"))
	(else
	 (set-rear-ptr! queue (prev (rear-ptr queue)))
	 (set-next (rear-ptr queue) nil)
	 (if (null? (rear-ptr queue))
	     (set-front-ptr! queue nil)))))

(define (print-queue queue)
  (define (print-node node)
    (cond ((null? node)
	   (display " -- "))
	  ((eq? node (rear-ptr queue))
	   (display (item node))
	   (display " "))
	  (else
	   (display (item node))
	   (display " ")
	   (print-node (next node)))))
  (print-node (front-ptr queue)))