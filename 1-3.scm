(define (square a)
  (* a a))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (f a b c)
  (if (> a b)
      (if (> b c)
	  (sum-of-squares a b)
	  (sum-of-squares a c))
      (if (> a c)
	  (sum-of-squares b a)
	  (sum-of-squares b c))))