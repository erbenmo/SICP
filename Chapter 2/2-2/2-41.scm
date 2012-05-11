(define (generate-triples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k)
			       (list i j k))
			     (enumerate-interval 1 (- j 1))))
		      (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

(define (triples-add-to-s s n)
  (define (add-to-s? triple)
    (= (accumulate + 0 triple) s))
  (filter add-to-s?
	  (generate-triples n)))