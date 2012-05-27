1 3 6 10 15 21 28 36 45 55 66 78 91 105 120 136 153 171 190 210

6 10 28 36 66 78 120 136
10 15 45 55 105 120 190 210



1 3 ...
3 6 ...
6 10 ...



(display z) will not add x to sum again


(define seq (stream-map accum (Stream-enumerate-interval 1 20)))
1

(define y (Stream-filter even? seq))
6

(define z (stream-filter (lambda (x) (= (Remainder x 5) 0))
			 seq))
10

ref y 7 => 136

(Display z)
~~~~~ 210