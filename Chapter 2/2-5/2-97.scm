(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'scheme-number
       (lambda (x) (tag x)))
  'done)

(define (make-scheme-number n)
  ((get 'make 'scheme-number ) n))



(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

(define (remainder-terms a b)
  (let ((o1 (order (first-term a)))
	(o2 (order (first-term b)))
	(c (coeff (first-term b))))
    (cadr (div-terms a (mul-term b (power c (+ 1 o1 (- o2))))))))


(define (gcd-terms a b)
  (if (empty-termlist? b)
      (let* ((coeff-list (map cadr a))
	     (gcd-coeff (apply gcd coeff-list)))
	(div-terms a (make-term 0 gcd-coeff)))
      (gcd-terms b (remainder-terms a b))))


(define (reduce-terms a b)
  (let ((cd (gcd-terms a b)))
    (let ((factor (power (coeff (first-term b))
			 (+ 1 (term (first-term a)) (- (term (first-term b)))))))
    (let ((a' (div-terms (mul-terms a (make-term 0 factor)) cd)
	  (b' (div-terms (mul-terms b (make-term 0 factor)) cd))))
      (list (clean a') (clean b'))))))

(define (reduce-poly p1 p2)
  (if (same-variable? (Variable p1) (Variable p2))
      (reduce-terms (term-list a) (term-list b))
      (list p1 p2)))

(put 'reduce '(polynomial polynomial) reduce-poly)

(define (clean a)
  (let* ((coeff-list (map coeff a))
	 (gcd-coeff (apply gcd coeff-list)))
    (div-terms a (make-term 0 gcd-coeff))))

(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
		 (gcd-terms (list-term p1) (list-term p2)))
      (error (list p1 p2))))

(put 'gcd '(polynomial polynomial) (lambda (a b) (tag (gcd-poly a b))))

(put 'gcd '(scheme-number scheme-number) (lambda (a b) (gcd a b)))

(define (gcd a b)
  (apply-generic 'gcd a b))


(define (install-rational-package)
  (define (numer x) (car x))
  (define (denom x) (cdr x))

  (define (make-rat x y)
    (let ((x' (car (reduce x y)))
	  (y' (cadr (reduce x y))))
      (cons x' y')))


  (define (add-rat x y)
    (make-rat (add (mul (numer x) (denom y))
		 (mul (numer y) (denom x)))
	      (add (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (sub (mul (numer x) (denom y))
		 (mul (numer y) (denom x)))
	      (add (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (mul (numer x) (numer y))
	      (mul (denom x) (denom y))))
  (define (div-rat x y)
    (make-rat (mul (numer x) (denom y))
	      (mul (denom x) (numer y))))

  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))

  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))
  'done)

(define (make-rational n d)
  ((get 'make 'rational) n d))





(define (install-complex-package)
  (define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y))
  (define (make-from-mag-ang r a)
    ((get 'make-from-mag-ang 'polar) r a))
  
  (define (add-complex z1 z2)
    (make-from-real-imag (+ (real-part z1) (real-part z2))
			 (+ (imag-part z1) (imag-part z2))))
  (define (sub-complex z1 z2)
    (make-from-real-imag (- (real-part z1) (real-part z2))
			 (- (imag-part z1) (imag-part z2))))
  (define (mul-complex z1 z2)
    (make-from-mag-ang (* (magnitude z1) (magnitude z2))
		       (+ (angle z1) (angle z2))))
  (define (div-complex z1 z2)
    (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
		       (- (angle z1) (angle z2))))

  (define (tag z) (attach-tag 'complex z))
  (put 'add '(complex complex)
       (lambda (z1 z2) (tag (add-complex z1 z2))))
  (put 'sub '(complex complex)
       (lambda (z1 z2) (tag (sub-complex z1 z2))))
  (put 'mul '(complex complex)
       (lambda (z1 z2) (tag (mul-complex z1 z2))))
  (put 'div '(complex complex)
       (lambda (z1 z2) (tag (div-complex z1 z2))))
  (put 'make-from-real-imag 'complex
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'complex
       (lambda (r a) (tag (make-from-mag-ang r a))))
  'done)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))

(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))


(define (reduce-intergers n d)
  (let ((g (gcd n d)))
    (list (/ n g) (/ d g))))
(put 'reduce `(scheme-number scheme-number) reduce-intergers)


(define (reduce a b)
  (apply-generic 'reduce a b))

