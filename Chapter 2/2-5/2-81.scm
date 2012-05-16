a) infinity loop

b) no need to add that
   if table[a][a] doesn't contain func,
   transformation doesn't help

   need to make sure t->t doesn't cause infinity loop


(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (if (= (length args) 2)
	      (let ((type1 (car type-tags))
		    (type2 (cadr type-tags))
		    (a1 (car tags))
		    (a2 (cadr tags)))
		(if (eq? t1 t2)
		    (error "No method for these types"
			   (list op type-args))
		    (let ((t1->t2 (get-coercion type1 type2))
			  (t2->t1 (get-coercion type2 type1)))
		      (cond (t1->t2
			     (apply-generic op (t1->t2 a1) a2))
			    (t2->t1
			     (apply-generic op a1 (t2->t1 a2)))
			    (else
			     (error "No method for these types"
				    (list op type-tags))))))
		(error "No method for these types"
		       (list op type-tags)))))))