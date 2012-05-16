1-2-3-4-5
1-2-6-7-8

cross 4,8    <= not considering here

only consider:
1 2 3 4 5 6 7 8 9
cross 4,8



(define (merge t1 t2)
  (if (= (type-tag t1) (type-tag t2))
      t1
      (let ((raise-proc (get 'raise (type-tag t1) t1)))
	(if (null? raise-proc)
	    #false
	    (merge (raise-proc (contents t1)) t2)))))
  
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (if (= (length args) 2)
	      (let ((a1 (car tags))
		    (a2 (cadr tags)))
		(let ((t1->t2 (merge a1 a2))
		      (t2->t1 (merge a2 a1)))
		  (cond (t1->t2
			 (apply-generic op t1->t2 a2))
			(t2->t1
			 (apply-generic op a1 t2->t1))
			(else
			 (error "No method for these types"
				(list op type-tags))))))
	      (error "No method for these types"
		     (list op type-tags)))))))