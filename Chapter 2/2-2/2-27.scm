(define (simple-reverse items)
  (if (null? items)
      ()
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (cond ((null? items)
	 nil)
	((list? (car items))
	 (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))
	(else
	 (append (deep-reverse (cdr items)) (list (car items))))))

(define (deep-reverse-crazy t)
  (if (pair? t)
      (reverse (map deep-reverse-crazy t))
      t))