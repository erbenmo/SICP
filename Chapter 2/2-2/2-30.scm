(define (square-tree-w/map tree)
  (map (lambda (subtree)
	 (if (list? subtree)
	     (square-tree-w/map subtree)
	     (square subtree)))
       tree))

(define (square-tree-naive tree)
  (cond ((null? tree) nil)
	((not (list? tree))
	 (square tree))
	(else
	 (cons (square-tree-naive (car tree))
	       (square-tree-naive (cdr tree))))))
