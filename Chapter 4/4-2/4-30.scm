(define (eval-sequence exs env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
	(else (actual-value (first-exp exps) env)
	      (eval-sequence (rest-exps exps) env))))






(define (for-each proc items)
  (if (null? items)
      'done
      (begin (proc (car items))
	     (for-each proc (cdr items)))))

(for-each (lambda (X) (newline) (display x))
	  (list 12 32 123))



(define (p1 x)
  (set! x (cons x '(2)))
  x)

(define (p2 x)
  (define (p e)
    e
    x)
  (p (set! x (cons x '(2)))))


1 . 2
1

1 . 2
1 . 2



force on display function


