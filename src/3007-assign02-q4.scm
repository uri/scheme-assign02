; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 4

  

(define (deep-member x e)
 
      (if (not (nil? x))
          (if (eq? (car x) e)
              ; Found element, return true
              #t
              ; Else 
              (if (list? (car x))
                  ; If the next element is a list
                  (deep-member (car x) e)
                  ; Else
                  (deep-memeber (cdr x) e)
               ) ; is-list-if
          ; List is nil return false - element not found 
          );found-elemt-if
          #f
      )
  )
 
      