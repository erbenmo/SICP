(define (square-list-oo items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-oo (cdr items)))))


(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (square-list-map items)
  (map square items))