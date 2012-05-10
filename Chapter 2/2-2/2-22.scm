(define (square-list-wrong-1 items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items nil))


;; (cons (list 1 2 3) 1) => ((1 2 3) . 1)
;; (cons (list 1 2 3) (list 1)) => ((1 2 3) 1)  ok
;; (cons 1 (list 1 2 3)) => (1 1 2 3)  ok?
(define (square-list-wrong-2 items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square (car things))))))
  (iter items nil))

(define (square-list-correct items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (list (square (car things)))))))
  (iter items nil))