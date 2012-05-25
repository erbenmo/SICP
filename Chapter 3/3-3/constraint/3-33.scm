(define (avg a b c)
  (define (process-new-value)
    (cond ((and (has-value? a) (has-value? b))
	   (set-value! c
		       (/ (+ (get-value a) (get-value b)) 2.0)
		       me))
	  ((and (has-value? b) (has-value? c))
	   (set-value! a
		      (- (* 2 (get-value c)) b)
		      me))
	  ((and (has-value? a) (has-value? c))
	   (set-value! b
		      (- (* 2 (get-value c)) a)
		      me))))

  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (forget-value! c me)
    (process-new-value))

  (define (me request)
    (cond ((eq? request 'I-have-a-value)
	   (process-new-value))
	  ((eq? request 'I-lost-my-value)
	   (process-forget-value))
	  (else
	   (error "Unknown request"))))

  (connect a me)
  (connect b me)
  (connect c me)
  me)

(define a (make-connector))
(probe "a" a)
(define b (make-connector))
(probe "b" b)
(define c (make-connector))
(probe "c" c)