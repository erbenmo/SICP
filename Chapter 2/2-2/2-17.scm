(define (last-pair list)
  (if (null? (cdr list))
      (car list)
      (last-pair (cdr list))))