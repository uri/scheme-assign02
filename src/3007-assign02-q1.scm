; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 1



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ARITHMETIC MONEY
  ; Performs an arithmetic operation on two different kinds of money objects together
  ;
  ; @origin - the money object which dominates the currency
  ; @slave - used for the value of the money object to be added to the origin
  ; @sign - the arithmetic operation to be performed
(define (arithmetic-money origin slave sign)
  ;; If they are the same currency just do a simple addition.
  (if (eq? (cdr origin) (cdr slave))
      ; Make a new money with a different value
      (make-money (sign (car origin) (car slave)) (cdr origin))
      ;; ELse
      (let (
            (original-currency (cdr origin))
            (origin-converted (convert-to-dollars origin))
            (slave-converted (convert-to-dollars slave)))
       
        (convert-from-dollars
         (arithmetic-money origin-converted slave-converted sign) original-currency))))


;;; ADD MONEY
(define (add-money origin slave)
  (arithmetic-money origin slave +)
)

;;; SUBTRACT MONEY
(define (subtract-money origin slave)
  (arithmetic-money origin slave -)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;; MONEY OPERATION
  ; Performes an arithmetic operation to the car of a money object and returns a new 
  ; money object with the adjust value.
  ;
  ; @money - the money object
  ; @factor - what to multiply the money's value by
  ; @type - the arithmetic operation to perform
(define (money-operation money factor sign)
  (make-money (sign (car money) factor) (cdr money)))

;;; Multiply
(define (multiply-money money factor)
    (money-operation money factor *))

;;; Divide  
(define (divide-money money factor)
  (money-operation money factor /))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
  
  

;;; MAKE MONEY
  ; Makes a money object
  ;
  ; @value - how much money the money object has
  ; @currency - what type of currency is the money object
(define (make-money value currency)
  ; Put code here
  (let (( val value )
        (type currency))
        (cons val type)
    
  ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  
  
  
;;; CURRENCY
; Returns the value of the currency in terms of dollars
(define (currency msg)
  ; Put code here
  (cond ((eq? msg 'dollars) 1.0)
        ((eq? msg 'euros) 0.756)
        ((eq? msg 'pounds) 0.636)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



  
;;; CONVERT TO DOLLAR
;Convert money using currency
(define (convert-to-dollars money)
  (if (eq? (cdr money) 'dollars)
      ; Don't need to convert, just return what was passed in
      money
      ; else
      (make-money 
       (car (multiply-money 
                   money
                   (/ 1 (currency (cdr money)))))
       'dollars)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; CONVERT FROM DOLLAR
  ; Convert money using currency
(define (convert-from-dollars money target-currency)
  (if (eq? (cdr money) 'dollars)
      ; Make sure we're in dollars
      (make-money 
       (car (multiply-money 
                   money
                   (currency target-currency)))
       target-currency)
      ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  
  
  
  
;; TESTING Convert
(define m1 (make-money 88 'dollars))
(define m2 (make-money 24 'euros))
(define m3 (make-money 44 'pounds))
(define converted (convert-to-dollars m2))

;;; Testing assignment output
(define dollar-amount (make-money 100 'dollars))  ; Make a $100
(define pound-amount (make-money 100 'pounds))    ; Make 100 pounds
(define dollars-plus-pounds (add-money dollar-amount pound-amount)) ; Result should be dollars
(define pounds-plus-dollars (subtract-money pound-amount dollar-amount))  ; Result should be pounds
(currency 'euros) ; Result should be 0.756


