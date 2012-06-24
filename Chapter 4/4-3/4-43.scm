(define (yacht)
  (let ((mary-ann-owner 'parker)
	(lorna-owner 'moore)
	(rosalind-owner 'hall)
	(melissa-owner 'downing)
	(gabrielle-owner 'barnacle))
    (let ((mary-ann-father 'moore))
      (require (not (= mary-ann-father mary-ann-owner))) ;; true
      (let ((melissa-father 'barnacle))
	(require (not (= melissa-father melissa-owner))) ;; true
	(let ((gabrielle-father (amb 'moore 'downing 'hall 'barnacle 'parker)))
	  (require (not (= gabrielle-father gabrielle-owner)))
	  (if (= mary-ann-father 'parker) ;; true
	      (require (= mary-ann-owner gabrielle-father)))
	  (if (= melissa-father 'parker) ;; true
	      (require (= melissa-owner gabrille-father)))
	  (let ((rosalind-father (amb 'moore 'downing 'hall 'barnacle 'parker)))
	    (require (not (= rosalind-father rosalind-owner)))
	    (if (= rosalind-father 'parker) ;; if father is parker
		(require (= rosalind-owner gabrielle-father)))
	    (let ((lorna-father (amb 'moore 'downing 'hall 'barnacle 'parker)))
	      (require (not (= lorna-father lorna-owner)))
	      (if (= lorna-father 'parker)
		  (require (= lorna-owner gabrielle-father)))
	      (require (distinct? (list mary-ann-father gabrielle-father rosalind-father
					melissa-father lorna-father)))
	      lorna-father)))))))