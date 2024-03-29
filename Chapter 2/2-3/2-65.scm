(define (intersection-set-sorted-list set1 set2)
  (if (or (null? set1) (null? set2))
      nil
      (let ((x1 (car set1)) (x2 (car set2)))
	(cond ((= x1 x2)
	       (cons x1 (intersection-set-sorted-list (cdr set1) (cdr set2))))
	      ((< x1 x2)
	       (intersection-set-sorted-list (cdr set1) set2))
	      ((< x2 x1)
	       (intersection-set-sorted-list set1 (cdr set2)))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree `()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result (partial-tree (cdr non-left-elts)
					      right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry left-tree right-tree)
		      remaining-elts))))))))


(define (intersection-set set1 set2)
  (list->tree (intersection-set-sorted-list
	       (tree->list-2 set1)
	       (tree->list-2 set2))))


(define (union-set-sorted-list set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	(else
	 (let ((x1 (car set1)) (x2 (car set2)))
	   (cond ((= x1 x2) (cons x1 (union-set-sorted-list (cdr set1) (cdr set2))))
		 ((< x1 x2) (cons x1 (union-set-sorted-list (cdr set1) set2)))
		 (else (cons x2 (union-set-sorted-list set1 (cdr set2)))))))))

(define (union-set set1 set2)
  (list->tree (union-set-sorted-list
	       (tree->list-2 set1)
	       (tree->list-2 set2))))