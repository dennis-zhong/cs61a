(define (merge s1 s2)
(if (<= (car s1) (car s2)) 
(cons-stream (cars s1) (merge (cdr-stream s1) s2))
(cons-stream (cars s2) (merge s1 (cdr-stream s2)))
))

(define (cycle start)
    (cons-stream start (cycle (modulo (+ start 2) 5))))

(define-macro (when condition exprs)
(list 'if condition (cons 'begin exprs) 'okay))

(define-macro (when condition exprs)
`(if ,condition ,(cons 'begin exprs) 'okay))

(define-macro (prune-expr expr)
    (define (prune lst)
        (if (or (null? lst) (null? (cdr lst))) lst
        (cons (car lst) (prune (cdr (cdr lst))))))
    (cons (car expr) (prune (cdr expr))))
