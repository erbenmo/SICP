(define (yanghui col row)
  (if (or (= row 0) (= row col) (= col 0) (= col 1))
      1
      (+ (yanghui (- col 1) (- row 1))
	 (yanghui (- col 1) row))))