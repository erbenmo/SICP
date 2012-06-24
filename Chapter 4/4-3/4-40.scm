5^5 = 3125
 =>
5! = 120


(define (multiple-dwelling)
  (let ((fletcher (amb 1 2 3 4 5)))
    (require (not (= fletcher 5)))
    (require (not (= fletcher 1)))
    (let ((cooper (amb 1 2 3 4 5)))
      (require (not (= cooper 1)))
      (require (not (= (abs (- fletcher cooper)) 1)))
      (let ((miller (amb 1 2 3 4 5)))
	(require (> miller cooper))
	(let ((baker (amb 1 2 3 4 5)))
	  (require (not (= baker 5)))
	  (let ((smith (amb 1 2 3 4 5)))
	    (require (not (= (abs (- smith fletcher)) 1)))
	    (require (distinc? (list baker cooper fletcher miller smith)))
	    (list (list 'baker baker)
		  (list 'cooper cooper)
		  (list 'fletcher fletcher)
		  (list 'miller miller)
		  (list 'smith smith))))))))