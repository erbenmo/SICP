(define (encode message tree)
  (if (null? message)
      nil
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))

(define (contains-symbol symbol tree)
  (if (leaf? tree)
      (eq? symbol (symbol-leaf tree))
      (contains symbol (symbols tree))))

(define (contains item items)
  (cond ((null? items) false)
	((eq? (car items) item) true)
	(else (contains item (cdr items)))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree)
	 (if (eq? symbol (symbol-leaf tree))
	     nil
	     (error "can't find symbol" symbol)))
	((contains-symbol symbol (left-branch tree))
	 (cons `0 (encode-symbol symbol (left-branch tree))))
	((contains-symbol symbol (right-branch tree))
	 (cons `1 (encode-symbol symbol (right-branch tree))))
	(else
	 (error "can't find symbol" symbol))))