; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 2

;;; NEW MOVIE
; A movie looks like: (( Die Hardly) 1980 ((Brue Willis) (Tony White)))
; list of objects
; -> first element list containing the movie name
; -> Second element raw year in base list
; -> List of names
; -> -> 
(define (new-movie title year cast)
  
  ; Put code here
  (list
   title
   year
   cast
  ))


;;; NEW ACTOR
(define (new-actor first last)
  (list first last))

;;; NEW CAST
(define (new-cast . cast)
  cast)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(define (add-movie movie the-list)
  (cons movie the-list))




;;;;;;; TESTING
(define mq (list))
(define m1 (new-movie '(Die Hard) 1890 (new-cast '(Uri Gorelik) '(Garry Whoa))))
(define m2 (new-movie '(Donnie Darko) 2001 (new-cast '(Jake Ghellaienhal) '(His Sister))))
