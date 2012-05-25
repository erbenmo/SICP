;; memo-fib is mapped to *one* memoize function-instance
;; thus the table is shared

(define memo-fib
  (memoize (lambda (n)
	     (cond ((= n 0) 0)
		   ((= n 1) 1)
		   (else (+ (memo-fib (- n 1))
			    (memo-fib (- n 2))))))))

(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (lookup x table)))
	(or previously-computed-result
	    (let ((result (f x)))
	      (insert! x result table)
	      result))))))

(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))


memo-fib    ----->      memoize
                           |
                           |
                         table
                           |
                           |
                           *** more computation


if memo-fib is (memoize fib)
only the first time table is created and used
later we use fib, O(exp^(n-1))