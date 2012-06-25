(define (parse-word word-list)
  (let ((found-world (cadr word-list)))
    (set! *unparsed* (append *unparsed* found-word))))