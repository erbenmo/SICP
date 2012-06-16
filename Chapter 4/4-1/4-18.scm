(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)


(lambda ..vars
  (let ((u '*unassigned*)
	(v '*unassigned*))
    (let ((a <e1>)
	  (b <e2>))
      (set! u a)
      (set! v b))
    <e3>))

;; vs ;;

(lambda ..vars
  (let ((u '*unassigned*)
	(v '*unassigned*))
    (set! u <e1>)
    (set! v <e2>)
    <e3>))



for top one, <e2> needs u before u ('*unassigned*) is set! to a