(define (tree->list-1 tree)
  (if (null? tree)
      `()
      (append (tree->list-1 (left-branch tree))
	      (cons (entry tree)
		    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree `()))


;; 1
;;  if append is o(n)
;;     complexity T(n) = 2 * T(n/2) + n/2
;;  else
;;     complexity T(n) = 2 * T(n/2) + 1