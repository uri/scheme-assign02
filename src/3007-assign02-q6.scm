; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 6


;;; AVERAGE
(define (average . nums)
  (average-helper nums 0 0))

(define (average-helper num-list sum count)
  (if (null? num-list)
      (/ sum count)
      ;else
      (average-helper (cdr num-list) (+ sum (car num-list)) (+ count 1))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;; PIPELINE
(define (pipeline . methods)
  (lambda (a)
    (if (= (length methods) 1)
        ((car methods) a) ; Return the result
        ; else we need some work
        (pipeline-helper (cdr methods) ((car methods) a))
        )))
  
(define (pipeline-helper methods cur-result)
  (if (null? methods)
      cur-result
      (pipeline-helper (cdr methods) ((car methods) cur-result))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(define cdar (pipeline cdr car))
(define cddar (pipeline cdr cdr car))
(define cdadr (pipeline cdr car cdr))


;;; Testing methods
(define (square x)
  (* x x))

(define square-cubed (pipeline square square square))

(define test-list (list 3 (list 77 75 97 23)  99))

(display 'cdar)
(display "\n")
(car (cdr test-list))
(cdar test-list)

(display "\n")

(display 'cddar)
(display "\n")
(car (cdr (cdr test-list)))
(cddar test-list)


(display "\n")

(display 'cdadr)
(display "\n")
(cdadr test-list)
(cdr (car (cdr test-list)))


  