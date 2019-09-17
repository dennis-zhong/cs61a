; Lab 14: Final Review

(define (compose-all funcs)
  (define (run-fn funcs result)
    (if (null? funcs) result (run-fn (cdr funcs) ((car funcs) result)))
  )
  (lambda (x) (run-fn funcs x))
)

(define (has-cycle? s)
  (define (pair-tracker seen-so-far curr)
    (cond ((null? curr) #f)
          ((contains? seen-so-far (car curr)) #t)
          (else (pair-tracker (cons (car curr) seen-so-far) (cdr-stream curr))))
    )
  (pair-tracker '() s)
)

(define (contains? lst s)
  (if (null? lst) #f (if (eq? (car lst) s) #t (contains? (cdr lst) s)))
)