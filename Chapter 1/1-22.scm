(define (timed-prime-test n)
;;  (newline)
;;  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes low high)
  (define (check-current-and-continue low_v high_v)
    (timed-prime-test low)
    (search-for-primes (+ 1 low) high))
  (if (> low high)
      (display " end ")
      (check-current-and-continue low high)))


;; 1e9 ~ 0.04999
;; 1e10 ~ 0.13999
;; 1e11 ~ 0.42999
;; 1e12 ~ 1.33999