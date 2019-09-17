;; Scheme ;;


(define lst
  '((1) 2 (3 4) 5)
)

(define (composed f g)
  'YOUR-CODE-HERE
  (lambda (x) (f (g x)))
)

(define (remove item lst)
  (filter (lambda (x) (not (= x item))) lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

(define (no-repeats s)
  'YOUR-CODE-HERE
  (define (in x lst)
    (cond ((null? lst) #f)
      ((= x (car lst)) #t)
      (else (in x (cdr lst)))
    )
  )
  (cond ((null? s) s)
    ((in (car s) (cdr s)) (no-repeats (cdr s)))
    (else (cons (car s) (no-repeats (cdr s))))
  )
  
)

(define (substitute s old new)
  'YOUR-CODE-HERE
  (cond ((null? s) s)
    ((eq? (car s) old) (cons new (substitute (cdr s) old new)))
    ((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
    (else (cons (car s) (substitute (cdr s) old new)))
  )
)


(define (sub-all s olds news)
  'YOUR-CODE-HERE
  (if (null? olds) s 
  (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))
  )
)