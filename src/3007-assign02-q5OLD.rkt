; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 5

(define nil '())

;;; Node constructor
(define (new-node val)
  (let ((value val)
        (child nil))

    
    ;; Set the left child
    (define (set-left! val)
      (set! left val))
    
    ;; Set the right child
    (define (set-right! val)
      (set! right val))

    (define (dispatch . msg)
      (cond ((eq? (list-ref msg 0) 'get-left) (car child))
            ((eq? (list-ref msg 0) 'get-right) (cdr child))
            ((eq? (list-ref msg 0) 'set-left!) (set-left! (list-ref msg 1)))
            ((eq? (list-ref msg 0) 'set-right!) (set-right! (list-ref msg 1)))))
    dispatch
))

;; Public get-left
(define (get-left n)
  (n 'get-left))

;; Public get-right
(define (get-right n)
  (n 'get-right))
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;           

;;; Contructor for the avl tree
(define (make-avl-tree)
  (let ((root nil)))
  
  
  (define (dispatch . msg)
      (cond ((eq? (list-ref msg 0) 'get-root) root)
            ((eq? (list-ref msg 0) 'set-root!) (set! root (list-ref msg 1) )))
  dispatch)

;;; Get the root
(define (get-root t)
  (t 'get-root))
  
;;; Set the root
(define (set-root! n t)
  (t 'set-root! n))
  
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  (define (insert n t)
    (if (null? (get-root t))
        (set-root! n t)
        (cond ((< 

;;; Store the avl tree in root
(define root (make-avl-tree))
  