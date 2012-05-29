(define (partial-sums streams)
  (cons-stream (stream-car streams)
	       (add-streams (stream-cdr streams)
			    (partial-sums streams))))