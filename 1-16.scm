(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                (- counter 1)
                (* b product))))


(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b counter product)
  (cond ((= counter 0) product)
	((even? counter) ((fast-expt-iter (square b) (/ counter 2) product)))
	(else (fast-expt-iter b (- counter 1) (* b product)))))
      

(define (even? n)
  (= (remainder n 2) 0))


(define (square n)
  (* n n))