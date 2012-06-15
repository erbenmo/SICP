(define (run-forever) (run-forever))

(define (try p)
  (if (halts? p p)
      (run-forever)
      'halted))

(try try)
;; <try try> halted <-- halts? <try try> return false  == <try try> not halted
;; <try try> run-forever  <-- halts? <try try> return true  == <try try> halted