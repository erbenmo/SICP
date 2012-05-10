(define (nn? a)
    (and (< (lower-bound a) 0) (< (upper-bound a) 0)))
(define (np? a)
  (and (< (lower-bound a) 0) (> (upper-bound a) 0)))

(define (nn-nn a b)
  (make-interval (* (upper-bound a) (upper-bound b))
		   (* (lower-bound a) (lower-bound b))))

(define (nn-np a b)
  (make-interval (* (upper-bound b) (min (lower-bound a) (lower-bound b)))
		 (* (lower-bound a) (lower-bound b))))

(define (nn-pp a b)
  (make-interval (* (lower-bound a) (upper-bound b))
		 (* (max (* (lower-bound a) (upper-bound a))
			 (* (lower-bound b) (upper-bound b))))))

(define (np-np a b)
  (make-interval (min (* (lower-bound a) (upper-bound b))
		      (* (lower-bound b) (upper-bound a)))
		 (max (* (lower-bound a) (lower-bound b))
		      (* (upper-bound a) (upper-bound b)))))

(define (np-pp a b)
  (make-interval (* (lower-bound a) (max (upper-bound a) (upper-bound b)))
		 (* (upper-bound a) (upper-bound b))))

(define (pp-pp a b)
  (make-interval (* (lower-bound a) (lower-bound b))
		 (* (upper-bound a) (upper-bound b))))

  

(define (mul-interval-s x y)
  (cond ((nn? x)
	 (cond ((nn? y)
		(nn-nn x y))
	       ((np? y)
		(nn-np x y))
	       (else
		(nn-pp x y))))
	((np? x)
	 (cond ((nn? y)
		(nn-np y x))
	       ((np? y)
		(np-np x y))
	       (else
		(np-pp x y))))
	(else
	 (cond ((nn? y)
		(nn-pp y x))
	       ((np? y)
		(np-pp y x))
	       (else
		(pp-pp x y))))))