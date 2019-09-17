(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  (map-stream (lambda (x) (+ 3 x)) (cons-stream 0 multiples-of-three))
)

(define (rle s)
  (define (compressor s n)
    (cond ((null? s) 0)
    ((null? (cdr-stream s)) (+ 1 n))
    ((not (= (car s) (car (cdr-stream s)))) (+ 1 n)) 
    (else (compressor (cdr-stream s) (+ 1 n))))
  )
  (define (repeat-cdr s n) 
  (if (= 0 n) s (repeat-cdr (cdr-stream s) (- n 1))))
  (if (null? s) s
    (cons-stream (list (car s) (compressor s 0)) (rle (repeat-cdr s 
    (compressor s 0))))
  )
)