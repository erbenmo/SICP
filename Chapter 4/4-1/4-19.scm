(let ((a 1))
  (define (f x)
    (define b (+ a x))
    (define a 5)
    (+ a b))
  (f 10))


;; I support Ben & Eva's opinion

;; 1) find dependency tree: a>b
;; 2) if there is loop, error ???
;; 3) move definition clause, if a>b then a should be before b

;; 2) if there is lazy evaluation, if b depends on delay(a), then a>b doesn't hold?