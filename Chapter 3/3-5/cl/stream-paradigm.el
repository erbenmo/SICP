(defun average (x y)
  (/ (+ x y) 2.0))

(defun sqrt-improve (guess x)
  (average guess (/ x guess)))

(defvar guesses 0)

(defun sqrt-stream (x)
  (setf guesses
	(cons-stream 1.0
		     (stream-map (lambda (guess)
				   (sqrt-improve guess x))
				 guesses)))
  guesses)






;; pi

(defun pi-summands (n)
  (cons-stream (/ 1.0 n)
	       (stream-map - (pi-summands (+ n 2)))))