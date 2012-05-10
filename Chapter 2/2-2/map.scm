(define nil ())

(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor)
	    (scale-list (cdr items) factor))))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))