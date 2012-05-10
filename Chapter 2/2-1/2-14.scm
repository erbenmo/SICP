(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))


;; worst
(define (par3 r1 r2)
  (div-interval (mul-interval r1 (mul-interval r1 r2))
		(mul-interval r1 (add-interval r1 r2))))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))

;; par2 is indeed better than par1 and par3 especially for r with large error


;; official
;; r1*r1*r1/r1/r1 != r1
;; bad because there is no uncertainty above since they should be the same value