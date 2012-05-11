(define (fold-right op initial sequence) ;; accumulate
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))


(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse-fold-right sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-fold-left sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))