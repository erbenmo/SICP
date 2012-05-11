(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))



;; also good!
(define (count-leaves-recursive t) 
   (accumulate + 0 (map (lambda (node) 
                          (if (pair? node) 
                              (count-leaves-recursive node) 
                              1)) 
                        t)))