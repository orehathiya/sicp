(define (f row column)
  (cond ((= column 1) 1)
	((= row column) 1)
	((+ (f (- row 1) (- column 1))
	    (f (- row 1) column)))))
     