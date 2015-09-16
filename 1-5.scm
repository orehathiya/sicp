#applicativeだだと無限ループ
#normalだと0

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))