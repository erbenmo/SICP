(define (transform-letrec exp)
  (let ((let-slot '())
	(let-assignment '()))
    (define letrec-var car)
    (define letrec-val cdr)
    (define (scan-letrec clauses)
      (if (null? clauses)
	  '()
	  (let ((cur (car clauses)))
	    (set! let-slot (cons (list (letrec-var cur) '*unassigned*) let-slot))
	    (set! let-assignment (cons (list 'set! (letrec-var cur) (letrec-val cur))
				       let-assignment))
	    (scan-letrec (cdr clauses)))))
    (let ((assignment (car exp))
	  (body (cdr exp)))
      (scan-letrec assignment)
      (append (list 'let let-slot) let-assignment body))))

;; define => new lambda / define
;; let (var1 var2... varn), even? odd? are arguments and they can't reference to each other any more
;;     problem: there is no 'global' function object that reference to even? & odd?