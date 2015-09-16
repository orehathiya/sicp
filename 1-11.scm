(define (f n)
  (f-iter 0 1 2 n))


(define (f-iter a b c count)
  (if (= count 0)
      a
      (f-iter b c (+ (* 3 a) (* 2 b) c) (- count 1))))
