(define (parse-simple-noun-phrase)
  (list 'noun-phrase
	(parse-word articles)
	(parse-word nouns)))

we want to parse article before we parse the nouns