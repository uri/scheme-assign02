; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 4


;;; Methods from the notes
(define nil '())

(define (filter predicate sequence) 
    (cond ((null? sequence) '()) 
                ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence)))) 
                (else (filter predicate (cdr sequence)))))

(define (accumulate operator initial sequence) 
    (if (null? sequence) 
        initial 
        (operator (car sequence) (accumulate operator initial (cdr sequence)))))

(define (append list1 list2) 
    (if (null? list1) 
        list2 
        (cons (car list1) 
                (append (cdr list1) list2))))



(define (flatten-map procedure sequence) 
        (accumulate append nil (map procedure sequence)))
  
;;; DEEP MEMBER
;
(define (deep-member x e)
 
      (if (not (null? x))
          (if (eq? (car x) e)
              ; Found element, return true
              #t
              ; Else 
              (if (list? (car x))
                  ; If the next element is a list
                  (deep-member (car x) e)
                  ; Else
                  (deep-member (cdr x) e)
               ) ; is-list-if
          ; List is nil return false - element not found 
          );found-elemt-if
          #f
      )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(define (flatten-list a-list)
  (if (null? a-list) 
      nil
      ; else
      (if (list? (car a-list))
          (append (flatten-list (car a-list)) (flatten-list (cdr a-list)))
          (cons (car a-list) (flatten-list (cdr a-list)))
      )
  )
)

(define (sum-odd x)
  (accumulate + 0 (filter odd? (flatten-list x))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (assoc-list-helper k v count new-list)
    (if (eq? (length k) (length v))
      ; Both lists are equal, we can proceed.
      (if (eq? count -1)
          new-list
          (if (null? new-list)
              (assoc-list-helper k
                                 v                                  
                                 (- count 1)
                                 (list (cons (list-ref k count) (list-ref v count))) 
                                 )
              
              (assoc-list-helper k
                                 v
                                 (- count 1)
                                 (cons (cons (list-ref k count) (list-ref v count)) new-list)                         
                                 )
))))
  
(define (assoc-list k v)
  (assoc-list-helper k v (- (length k) 1) '() ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; KEYS
(define (keys z)
  (keys-helper z '()))
  
      
(define (keys-helper z ret)
  (if (null? z)
      (reverse ret)
      (if (null? ret)
          (keys-helper (cdr z) (list (car (car z))))
          (keys-helper (cdr z) (cons (car (car z)) ret))
)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;; VALUES
(define (values z)
  (values-helper z '()))
  
      
(define (values-helper z ret)
  (if (null? z)
      (reverse ret)
      (if (null? ret)
          (values-helper (cdr z) (list (cdr (car z))))
          (values-helper (cdr z) (cons (cdr (car z)) ret)) 
)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;; APPEND COPY
(define (append-copy x y)
  (if (null? y)
      x
      ; Both are good
      (append-copy (reverse (cons (car y) (reverse x))) (cdr y))))       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 

;;; Tests







(define a (list 1 2 3))
(define b (list 4 5 6))
(define c (append-copy a b))
c                           ; Should display (1 2 3 4 5 6)
(set-cdr! a (list 9 10))
(set-cdr! b (list 6 7))
c                           ; Should display (1 2 3 4 5 6)
 
(define d (append-copy (list 55 66 77 88 33 44 22) c))
d

(define e (append-copy c (list 55 66 77 88 33 44 22) ))
e

(set-cdr! c '(1))
e

      