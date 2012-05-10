(define (reverse items)
  (if (null? items)
      ()
      (append (reverse (cdr items)) (list (car items)))))