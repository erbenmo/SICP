;; O(K*N)
(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))

;; O(1)
(define (adjoin-set x set)
  (cons x set))


;; O(K*K*N*N)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) `())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))


;; O(1)
(define (union-set set1 set2)
  (append set1 set2))