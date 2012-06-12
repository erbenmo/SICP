(define (and? exp) (tagged-list? exp 'and))

(define (first-seq seqs) (car seqs))
(define (rest-seqs seqs) (cdr seqs))

(define (eval-and seqs env)
  (cond ((null? seqs) true)
	((true? (eval (first-seq seqs) env))
	 (eval-and (rest-seqs seqs) env))
	(else false)))

(define (eval-or seqs env)
  (cond ((null? seqs) true)
	((false? (eval (first-seq seqs) env))
	 false)
	(else
	 (eval-or (rest-seqs seqs) env))))

(define (and->if exp)
  (expand-and->if (cdr exp)))

(define (expand-and->if seqs)
  (if (null? seqs)
      'true
      (let ((first (car seqs))
	    (rest (cdr seqs)))
	(make-if (cond-predicate first)
		 (expand-and->if rest)
		 false))))

(define (or->if exp)
  (expand-or->if (cdr exp)))

(define (expand-or->if seqs)
  (if (null? seqs)
      'true
      (let ((first (car seqs))
	    (rest (cdr seqs)))
	(make-if (cond-predicate first)
		 true
		 (expand-or->if rest)))))