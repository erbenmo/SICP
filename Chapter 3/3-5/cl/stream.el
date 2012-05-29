(defvar the-empty-stream '())
(defun stream-null? (s)
  (null s))

(defun show (x)
  (format t "~a~%" x)
  x)

(defmacro cons-stream (a b)
  `(cons ,a (delay ,b)))

(defun stream-car (s)
  (car s))

(defun stream-cdr (s)
  (force (cdr s)))

(defmacro delay (expr)`(memo-proc (lambda () ,expr)))
;;(defmacro delay (exp)`(lambda () ,exp))

(defun force (delayed-object)
  (funcall delayed-object))

(defun memo-proc (proc)
  (let ((already-run? nil) (result nil))
    (lambda ()
      (if (not already-run?)
        (progn
          (setf result (funcall proc))
          (setf already-run? t)
          result)
        result))))

(defun stream-ref (s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(defun stream-enumerate-interval (low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1) high))))

(defun stream-filter (pred s)
  (cond ((stream-null? s) the-empty-stream)
        ((funcall pred (stream-car s))
	 (format t "called")
	 (cons-stream
	  (stream-car s)
	  (stream-filter pred (stream-cdr s))))
        (t (stream-filter pred (stream-cdr s)))))

(defun stream-map (proc &rest arguments)
  (if (stream-null? (car arguments))
      the-empty-stream
    (cons-stream
     (apply proc (mapcar #'stream-car arguments))
     (apply #'stream-map
	    (cons proc (mapcar #'stream-cdr arguments))))))

(defun stream-for-each (proc s)
  (if (stream-null? s)
      'done
    (progn (apply proc (list (stream-car s)))
	   (stream-for-each proc (stream-cdr s)))))

(defun display-stream (s)
  (stream-for-each #'show s))
  

;; example
(defun even? (x)
  (= (rem x 2) 0))

(defun accum (x)
  (setf sum (+ sum x))
  sum)

(setf sum 0)
(setf seq (stream-map #'accum (stream-enumerate-interval 1 20)))
(setf y (stream-filter #'even? seq))
(setf z (stream-filter (lambda (x) (= (rem x 5) 0))
			 seq))