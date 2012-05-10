(define (scale-tree tree factor)
  (cond ((null? tree) nil)
	((not (pair? tree)) (* tree factor))
	(else
	 (cons (scale-tree (car tree) factor)
	       (scale-tree (cdr tree) factor)))))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (scale-tree-w/map tree factor)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (scale-tree-w/map sub-tree factor)
	     (* sub-tree factor)))
       tree))