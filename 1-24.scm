(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (use srfi-27)
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))


(define (search-for-primes first last)
  (define (search-iter f l)
    (if (<= f l)
	(begin (timed-prime-test f)
	       (search-iter (+ f 2) l))))
  (search-iter (if (even? first) (+ first 1) first)
	       (if (even? last) (- last 1) last)))

;; gosh> (timed-prime-test 1009)
;; 1009 *** 694#<undef>
;; gosh> (timed-prime-test 1013)
;; 1013 *** 439#<undef>
;; gosh> (timed-prime-test 1019)
;; 1019 *** 520#<undef>

;; gosh> (timed-prime-test 10007)
;; 10007 *** 627#<undef>
;; gosh> (timed-prime-test 10009)
;; 10009 *** 861#<undef>
;; gosh> (timed-prime-test 10037)
;; 10037 *** 735#<undef>

;; gosh> (timed-prime-test 100003)
;; 100003 *** 747#<undef>
;; gosh> (timed-prime-test 100019)
;; 100019 *** 941#<undef>
;; gosh> (timed-prime-test 100043)
;; 100043 *** 696#<undef>

;; gosh> (timed-prime-test 1000003)
;; 1000003 *** 1096#<undef>
;; gosh> (timed-prime-test 1000033)
;; 1000033 *** 788#<undef>
;; gosh> (timed-prime-test 1000037)
;; 1000037 *** 1014#<undef>