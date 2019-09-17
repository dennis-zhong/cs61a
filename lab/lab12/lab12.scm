(define (repeatedly-cube n x)
    (if (zero? n)
        x
        (let
            ([y (repeatedly-cube (- n 1) x)])
            (* y y y))))


(define-macro (def func bindings body)
    (list 'define (cons func bindings) body)
    )

(define (stream-to-list s num-elements)
    (if (or (null? s) (= num-elements 0)) nil
    (cons (car s) (stream-to-list (cdr-stream s) (- num-elements 1))))
    )

(define-macro (if-macro cond1 expr1 else expr2)
    `(if ,cond1 ,expr1 ,expr2)
)

(define-macro (add-or-sub cond1 x1 x2)
    `(if ,cond1 (+ ,x1 ,x2) (- ,x1 ,x2))
)