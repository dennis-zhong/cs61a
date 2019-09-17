;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cddr s))
)

(define (unique s)
  'YOUR-CODE-HERE
  (define (in x lst)
    (cond ((null? lst) #f)
      ((eq? x (car lst)) #t)
      (else (in x (cdr lst)))
    )
  )
  (define (tracker new old)
    (cond ((null? old) new)
      ((in (car old) new) (tracker new (cdr old)))
      (not (in (car old) new) (tracker (append new (list (car old))) (cdr old)))
    )
  )
  (tracker () s)
)

(define (cons-all first rests)
  (define (tracker new first rests)
    (if (null? rests) new
    (tracker (append new (list (cons first (car rests)))) first (cdr rests))
    )
  )
  (tracker nil first rests)
)

;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  'YOUR-CODE-HERE
  (cond ((null? denoms) denoms)
    ((< total 0) ())
    ((= total 0) (list ()))
    (else (append (cons-all (car denoms) (list-change (- total (car denoms)) denoms)) 
                  (list-change total (cdr denoms))))
  )
)

; Tail recursion

(define (replicate x n)
  'YOUR-CODE-HERE
  (define (accumulate-list n result)
    (if (= 0 n) result (accumulate-list (- n 1) (cons x result)))
  )
  (accumulate-list n ())
)

(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (define (get-value combiner n term)
    (if (= 1 n) (term n) (combiner (term n) (get-value combiner (- n 1) term)))
  )
  (combiner start (get-value combiner n term))
)

(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (get-value combiner n term result)
    (if (= 1 n) (combiner (term n) result) (get-value combiner (- n 1) term (combiner result (term n))))
  )
  (combiner start (get-value combiner (- n 1) term (term n)))
)


; Macros

(define-macro (list-of map-expr for var in lst if filter-expr)
  'YOUR-CODE-HERE
  (list 'map (list 'lambda (list var) map-expr) (list 'filter (list 'lambda (list var) filter-expr) lst))
)