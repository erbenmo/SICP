((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
	  1
	  (* k (ft ft (- k 1)))))))
 10)

;; difficult part is self->call self
;; but 2nd self is not known to 1st self
;; so pass 2nd self as an argument to 1st self

((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fb k)
      (cond ((= k 0) 0)
	    ((= k 1) 1)
	    (else
	     (+ (fb fb (- k 2)) (fb fb (- k 1))))))))
 10)



(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1)))))) 