make func to be a thunk
(func arg) fail if we don't foce func because func is still a thunk now

(define (square x) (* x x))

(square (id 10))

why performance of fib/factorial is affected by memo?