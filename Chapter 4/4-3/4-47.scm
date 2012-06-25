(define (parse-verb-phrase)
  (amb (parse-word verbs)
       (list 'verb-phrase
	     (parse-verb-phrase)
	     (parse-prepositional-phrase))))


1) v
2) v-p
3) 2)+p = v-p-p
....
ok


order matters
1) ~ 2) ~ 3) ~ 4) ....