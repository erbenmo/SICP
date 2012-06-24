(define (eight-queen)
  (let ((one (amb (1 2 3 4 5 6 7 8)))
	(two (amb (1 2 3 4 5 6 7 8)))
	(three (amb (1 2 3 4 5 6 7 8)))
	(four (amb (1 2 3 4 5 6 7 8)))
	(five (amb (1 2 3 4 5 6 7 8)))
	(six (amb (1 2 3 4 5 6 7 8)))
	(seven (amb (1 2 3 4 5 6 7 8)))
	(eight (amb (1 2 3 4 5 6 7 8))))
    (require (distinct? (list one two three four five six seven eight)))
    (require (check-diagonal
	      (list one two three four five six seven eight)))

    (list one two three four five six seven eight)))

(define (unique-list? l)
  (cond ((null? l)
	 true)
	((null? (cdr l))
	 true)
	(else
	 (and (unique (car l) (cdr l))
	      (unique-list (cdr l))))))

(define (unique? element l)
  (cond ((null? l)
	 true)
	((eq? element (car l))
	 false)
	(else
	 (unique element (cdr l)))))


(define (check-diagonal queens)
  (let ((sup (list 1 2 3 4 5 6 7 8)))
    (and (unique-list (map + queens sup))
	 (unique-list (map - queens sup)))))