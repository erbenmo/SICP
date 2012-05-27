(define (show x)
  (display-line x)
  x)

(define (display-line x)
  (newline)
  (display x))

(define x (stream-map show (stream-enumerate-interval 0 10)))


(stream-ref x 5)
;; 0 1 2 3 4 5

(Stream-ref x 7)
;; will not show 0-5 because of the memo
;; 6 7
