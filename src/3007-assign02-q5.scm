; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 5

(define (initialize-tree) '())	     ; Initialize a tree as empty
(define (make-tree root left right)
  (list root left right))	     ; Construct a non-empty tree

(define (root t) (car t))            ; Tree root is 1st element
(define (left-subtree t) (cadr t))   ; Left tree is 2nd element 
(define (right-subtree t) (caddr t)) ; Right tree is 3rd element

(define (empty-tree? t) (null? t))   ; Empty if it is an empty list

(define (insert x t)                 ; Create tree if empty
  (cond ((empty-tree? t) 
         (make-tree x (initialize-tree) (initialize-tree)))
        ((> x (root t))              ; Add to right subtree
         (make-tree (root t) (left-subtree t) 
                    (insert x (right-subtree t))))
        ((< x (root t))              ; Add to left subtree
         (make-tree (root t) (insert x (left-subtree t)) 
                    (right-subtree t)))))              

(define (in-tree? x t) 
  (cond	((empty-tree? t) #f)
        ((= x (root t))	#t) 
        ((> x (root t)) (in-tree? x (right-subtree t)))
        ((< x (root t)) (in-tree? x (left-subtree t)))))

(define (print-tree t)               ; Empty tree is not printed!
  (if (not (empty-tree? t))
      (begin 
        (display "(")
        (display (root t))
        (display ";")
        (print-tree (left-subtree t))
        (display ";")
        (print-tree (right-subtree t))
        (display ")"))))

(define (count-leaves tree) 
  (cond ((null? tree) 0) 
        ((null? (and (left-subtree tree) (right-subtree tree))) 1) 
        (else ( + (count-leaves (right-subtree tree)) 
                  (count-leaves (left-subtree tree)))))) 

; Set up my demo tree

(define t0 (initialize-tree))
(define t1 (insert 5 t0)) 
(define t2 (insert 3 t1))
(define t3 (insert 7 t2))
(define t4 (insert 2 t3))
(define t5 (insert 6 t4))
(print-tree t5)
(newline)

(define (tree-demo) 
  (begin    
    (if (in-tree? 6 t5)
        (display "6 is in this tree")
        (display "6 is not in this tree"))
    (newline )
    (if (in-tree? 4 t5)
        (display "4 is in this tree")
        (display "4 is not in this tree"))
    (newline)))

(tree-demo)
