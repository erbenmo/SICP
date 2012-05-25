(define nil `())

(define (lookup-basic key table)
  (let ((record (assoc key (cdr table))))
    (if record
	(cdr record)
	false)))

(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))


;; old
(define (insert-basic key value table)
  (let ((record (assoc key (cdr table))))
    (if record
	(set-cdr! record value)
	(set-cdr! table
		  (cons (cons key value) (cdr table)))))
  'ok)

(define (make-table)
  (list '*table*))

(define (insert! table value . keys)
  (cond ((= (length keys) 0)
	 (error "no key given!"))
	((= (length keys) 1)
	 (insert-basic (car keys) value table))
	(else
	 (let ((key (car keys)))
	   (let ((subtable (assoc key (cdr table))))
	     (cond ((not (eq? subtable false))
		    (insert! subtable value (cdr keys)))
		   (else
		    (set-cdr! table
			      (cons (list key (cons nil nil))
				    (cdr table)))
		    (insert! (assoc key (cdr table)) value (cdr keys)))))))))

(define (lookup table . keys)
  (cond ((= (length keys) 0)
	 (error "no key given!"))
	((= (length keys) 1)
	 (lookup-basic (car keys) table))
	(else
	 (let ((key (car keys)))
	   (let ((subtable (assoc key (cdr table))))
	     (cond ((not (eq? subtable false))
		    (lookup subtable (cdr keys)))
		   (else false)))))))