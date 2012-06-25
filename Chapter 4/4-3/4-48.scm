(define adjectives '(good bad ugly))


(define (parse-noun-w-adj-phrase)
  (define (maybe-extend adjs)
    (amb adjs
	 (maybe-extend (list 'noun-phrase
			     (parse-word adj)
			     adjs))))
  (maybe-extend '()))

(define (parse-simple-noun-phrase)
  (list 'noun-phrase
	(parse-word articles)	
	(parse-adjs-phrase)
	(parse-word nouns)))

(define (parse-noun-phrase)
  (define (maybe-extend noun-phrase)
    (amb noun-phrase
	 (maybe-extend (list 'noun-phrase
			     nount-phrase
			     (parse-prepositional-phrase)))))
  (maybe-extend (parse-simple-noun-phrase)))