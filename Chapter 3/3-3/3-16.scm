(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))

(define (make-cycle x)
  (set-cdr! (last-pair x) x))


;; 3
(define x `(1 2 3))
(count-pairs x)


;; 3, count-pairs return 4
(define x `((1) 2))
(set-cdr! (car x) (cdr x))
(count-pairs x)


;; 3, count-pairs return 7
(define x `(((1))))
(set-cdr! x (car x))
(set-cdr! (car x) (car (car x)))



(define x `(1))
(make-cycle x)
(count-pairs x)