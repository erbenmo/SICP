(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (tree-map proc items)
  (define (traverse tree)
    (cond ((null? tree) nil)
	  ((list? (car tree))
	   (cons (traverse (car tree))
		   (traverse (cdr tree))))
	  (else
	   (cons (proc (car tree))
		 (traverse (cdr tree))))))
  (traverse items))

(define (square-tree-w/tree-map tree)
  (tree-map square tree))