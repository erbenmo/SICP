;; if in first-frame, remove
;; otherwise goto enclosing env, rec
;; only unbind once

(define (make-unbound! var env)
  (define (transition cur-env)
    (error "can't find var" var))
  (define (fn vals vars)
    (set-cdr! vals (cdr vals))
    (set-cdr! vars (cdr vars)))
  (env-iter var env transition fn))