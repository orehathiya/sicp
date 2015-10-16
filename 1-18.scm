(define (fast-* b n)
  (fast-*-iter b n 0))

(define (fast-*-iter b counter product)
  (cond ((= counter 0) product)
	((even? counter) (fast-*-iter (double b) (halve counter) product))
	(else (fast-*-iter b (- counter 1) (+ b product)))))

;; (2 4 0)
;; (4 2 0)
;; (8 1 0)
;; (8 0 8)

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))