(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (unique data)
  (unique-sorted (sort data <)))

(define (unique-sorted data)
  (if (= (length data) 1)
      #t
      (and (< (car data) (cadr data))
	   (unique-sorted (cdr data)))))

(define (safe? k positions)
  (define (get-45-degree pos col)
    (if (null? pos)
	nil
	(cons (- (car pos) col) (get-45-degree (cdr pos) (+ 1 col)))))
  (define (get-135-degree pos col)
    (if (null? pos)
	nil
	(cons (+ (car pos) col) (get-135-degree (cdr pos) (+ 1 col)))))
  (and (unique positions)
       (unique (get-45-degree positions 1))
       (unique (get-135-degree positions 1))))

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row)))

(define empty-board nil)