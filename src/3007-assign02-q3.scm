; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 3

  
;;; TRIPLE
; First implementation
(define (triple aa bb cc)
  (let ( (x aa)
         (y bb)
         (z cc) )
    
    (define (dispatch msg)
      (cond ((eq? msg 'first) x)
            ((eq? msg 'second) y)
            ((eq? msg 'third) z)))
    
    ; Return the dispatch method
    dispatch
    
    ))

;;; First
(define (first aa)
  ; Use the dispatch method
  (aa 'first))

;;; Second
(define (second aa)
  ; Use the dispatch method
  (aa 'second))

;;; Third
(define (third aa)
  ; Use the dispatch method
  (aa 'third))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;; ALTERNATE TRIPLE
; Part C. of question 2
(define (new-triple aa bb cc)
  (let ( (x aa)
         (y bb)
         (z cc) )
    
    (define (set-first! num)
      (set! x num))
    
    (define (set-second! num)
      (set! y num))
    
    (define (set-third! num)
      (set! z num))
    
    (define (dispatch . msg)
      (cond ((eq? (list-find msg 0) 'first) x)
            ((eq? (list-find msg 0) 'second) y)
            ((eq? (list-find msg 0) 'third) z)
            ((eq? (list-find msg 0) 'set-first!) (set-first! (list-find msg 1)))
            ((eq? (list-find msg 0) 'set-second!) (set-second! (list-find msg 1)))
            ((eq? (list-find msg 0) 'set-third!) (set-third! (list-find msg 1)))
            ))
    
    ; Return the dispatch method
    dispatch))
  
;;; SET FIRST!
(define (set-first! a-triple val)
  (a-triple 'set-first! val))
  

;;; SET SECOND!
(define (set-second!  a-triple val)
  (a-triple 'set-second! val))
  

;;; SET THIRD!
(define (set-third!  a-triple val)
  (a-triple 'set-third! val))
  
  

;;;;;; UTILITY ;;;;;;
;;; LIST FIND
(define (list-find l n)
  (if (= n 0)
      (car l)
      (list-find (cdr l) (- n 1))))