(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

(define (branch-contains-mobile? branch)
  (list? (branch-structure branch)))

(define (total-weight mobile)
  (+ (total-weight-branch (left-branch mobile))
     (total-weight-branch (right-branch mobile))))

(define (total-weight-branch branch)
  (if (branch-contains-mobile? branch)
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (balanced mobile)
  (let ((left (left-branch mobile))
	(right (right-branch mobile)))
    (define (is-mobile-balanced?)
      (= (* (branch-length left) (total-weight-branch left))
	 (* (branch-length right) (total-weight-branch right))))
    (define (is-branch-balanced? branch)
      (cond ((branch-contains-mobile? branch)
	     (balanced (branch-structure branch)))
	    (else
	     #t)))
    (and (is-mobile-balanced?)
	 (is-branch-balanced? left)
	 (is-branch-balanced? right))))