(define (fast-* a b)
  (cond ((= b 0) 0)
	((even? b) (double (fast-* a (halve b))))
	(else (+ a (fast-* a (- b 1))))))

;; (2 4)
;; 2 * (2 2)
;; 2 * (2 * (2 1))

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))