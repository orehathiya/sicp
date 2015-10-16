(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
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

;; gosh> (search-for-primes 1000 1019)
;; 1001
;; 1003
;; 1005
;; 1007
;; 1009 *** 9
;; 1011
;; 1013 *** 9
;; 1015
;; 1017
;; 1019 *** 9#<undef>

;; gosh> (search-for-primes 10000 10037)
;; 10001
;; 10003
;; 10005
;; 10007 *** 27
;; 10009 *** 27
;; 10011
;; 10013
;; 10015
;; 10017
;; 10019
;; 10021
;; 10023
;; 10025
;; 10027
;; 10029
;; 10031
;; 10033
;; 10035
;; 10037 *** 27#<undef>

;; gosh> (search-for-primes 100000 100043)
;; 100001
;; 100003 *** 84
;; 100005
;; 100007
;; 100009
;; 100011
;; 100013
;; 100015
;; 100017
;; 100019 *** 84
;; 100021
;; 100023
;; 100025
;; 100027
;; 100029
;; 100031
;; 100033
;; 100035
;; 100037
;; 100039
;; 100041
;; 100043 *** 83#<undef>

;; gosh> (search-for-primes 1000000 1000037)
;; 1000001
;; 1000003 *** 264
;; 1000005
;; 1000007
;; 1000009
;; 1000011
;; 1000013
;; 1000015
;; 1000017
;; 1000019
;; 1000021
;; 1000023
;; 1000025
;; 1000027
;; 1000029
;; 1000031
;; 1000033 *** 285
;; 1000035
;; 1000037 *** 263#<undef>

;; take about √10 times