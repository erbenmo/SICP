(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (first-row seqs))
	    (accumulate-n op init (rest seqs)))))

(define (first-row-NAIVE seqs)
  (if (null? seqs)
      nil
      (cons (car (car seqs))
	(first-row (cdr seqs)))))

(define (rest-NAIVE seqs)
  (if (null? seqs)
      nil
      (cons (cdr (car seqs))
	    (rest (cdr seqs)))))

(define (first-row seqs)
  (map car seqs))

(define (rest seqs)
  (map cdr seqs))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))