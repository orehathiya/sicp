;; Carmichael numbers: 561, 1105, 1729, 2465, 2821, and 6601

;; gosh> (fermat-test 3)
;; #t
;; gosh> (fermat-test 11)
;; #t
;; gosh> (fermat-test 7)
;; #t
;; gosh> (fermat-test 561)
;; #t
;; gosh> (fermat-test 1105)
;; #t
;; gosh> (fermat-test 1729)
;; #t
;; gosh> (fermat-test 2465)
;; #t
;; gosh> (fermat-test 2821)
;; #t
;; gosh> (fermat-test 6601)
;; #t

(define (fermat-test n)
  (is-congluent n 1))

(define (is-congluent n a)
  (cond ((<= n a) #t)
	((= (expmod a n n) a) (is-congluent n (+ a 1)))
	(else #f)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))