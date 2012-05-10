(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (append (list (car s)) x)) rest)))))

;; given s
;;  with (car s)        append      (subsets (cdr s))
;;  without (car s)       ~         (subsets (cdr s))