(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge ordered-pairs)
  (if (= (length ordered-pairs) 1)
      (car ordered-pairs)
      (let ((first (car ordered-pairs))
	    (second (cadr ordered-pairs))
	    (rest (cddr ordered-pairs)))
	(successive-merge (adjoin-set (make-code-tree first second) rest)))))