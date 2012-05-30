;; note that i<=j<=k...
(define (triples a b c)
  (cons-stream
   (list (stream-car a) (stream-car b) (stream-car c))
   (interleave-6
    (stream-map (lambda (x) (list x (stream-car b) (stream-car c))
			(stream-cdr a)))
    (stream-map (lambda (y) (list (stream-car a) y (stream-car c))
			(stream-cdr b)))
    (stream-map (lambda (z) (list (stream-car a) (stream-car b) z)
			(stream-cdr c)))
    (pairs-x (stream-cdr b) (stream-cdr c) (stream-car a))
    (pairs-y (stream-cdr a) (stream-cdr c) (stream-car b))
    (pairs-z (stream-cdr a) (stream-cdr b) (stream-car c)))))

(define (interleave-6 a b c d e f)
  (interleave a (interleave b (interleave c (interleave d (interleave e f))))))


(define (pairs-x s t x)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (interleave
     (stream-map (lambda (v) (list x (stream-car s) v))
		(stream-cdr t))
     (stream-map (lambda (v) (list x v (stream-car t)))
		(stream-cdr s)))
    (pairs-x (stream-cdr s) (stream-cdr t) x))))

(define (pairs-y s t y)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (interleave
     (stream-map (lambda (v) (list (stream-car s) y v))
		(stream-cdr t))
     (stream-map (lambda (v) (list v y (stream-car t)))
		(stream-cdr s)))
    (pairs-y (stream-cdr s) (stream-cdr t) y))))

(define (pairs-z s t z)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (interleave
     (stream-map (lambda (v) (list (stream-car s) v z))
		(stream-cdr t))
     (stream-map (lambda (v) (list v (stream-car t) z))
		(stream-cdr s)))
    (pairs-z (stream-cdr s) (stream-cdr t) z))))

(define (triples s t u)
  (cons-stream (list
		(stream-car s)
		(stream-car t)
		(stream-car u))
	       (interleave
		(stream-map (lambda (x) (append (list (stream-car s)) x))
			    (stream-cdr (pairs t u)))
		(triples (stream-cdr s)
			 (stream-cdr t)
			 (stream-cdr u)))))

(define cub (triples integers integers integers))
(define triangle-90 (stream-filter (lambda (cube)
		 (= (+ (square (car cube)) (square (cadr cube))) (square (caddr cube)))) cub))