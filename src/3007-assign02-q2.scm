; Uri Gorelik
; 100801406
; Assignment 2
;;;
; Question 2



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; HELPERS ;;;;;;
(define (get-movie-title movie)
  ; Returns the movie name
  (car movie))

;;; NEW ACTOR
(define (new-actor first last)
  (list first last))

;;; NEW CAST
(define (new-cast . cast)
  cast)

;;; REVERSE!
(define (reverse! the-list)
  (define reverse-list (reverse the-list))
  (set-car! the-list (car reverse-list))
  (set-cdr! the-list (cdr reverse-list)))

;;;;;;;;;;;;;;;;



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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;; ADD MOVIE
; Adds a movie
(define (add-movie movie the-list)
  (set-cdr! the-list
   (cons (car the-list) (cdr the-list)))
  
  (set-car! the-list movie))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; FIND MOVIE
(define (find-movie title the-list)
  (if (null? the-list)
      ; Return empty list
      '()
      ; Else 
      (if (equal? (get-movie-title (car the-list)) title)
          ; We found the movie, return it
          (car the-list)
          ; Else 
          (find-movie title (cdr the-list))
          
)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;; DELETE MOVIE
(define (delete-movie title the-list)
 (define ret-movie (find-movie title the-list))
 (if (null? ret-movie)
     '()
  
  (if (equal? (get-movie-title (list-ref the-list (- (length the-list) 1))) title)
      ; We are in a special case
      (begin        
        (reverse! the-list)
        (delete-movie title the-list)
        reverse! the-list)

      ; Else run normally
      (if (eq? (length the-list) 0)
          '()
          ; else continue
          (if (equal? (get-movie-title (car the-list)) title)
              ; We have found the movie
              (if (null? (cdr the-list))
                  ; Then we do somethind different, otherwise same as always
                  (set-car! the-list '())
                  (begin
                    (set-car! the-list (car (cdr the-list)))
                    (set-cdr! the-list (cdr (cdr the-list)))
                    )
                  ); inner
              ; Else keep going
              (delete-movie title (cdr the-list))))
      )
  )
  ret-movie
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; LIST MOVIES
(define (list-movies a the-list)
  (define returning-list '())
  (list-movies-helper a the-list returning-list)
)

(define (list-movies-helper a the-list returning-list)
  (if (null? the-list)
      returning-list
      ;else
      (if (actor-in-movie? a (car the-list))
          ; We add it to the list
          ; Check if we're still empty
          (begin
            (if (null? returning-list)
                (list-movies-helper a (cdr the-list) (list (car the-list)))) ;end-if
            (list-movies-helper a (cdr the-list) (cons (car the-list) returning-list))
          )
          
          ;else 
          (list-movies-helper a (cdr the-list) returning-list))))

  
(define (actor-in-movie? actor movie)
  ; This is a list of lists
  (define cur-actor-list (car (cdr (cdr movie))))
  (actor-in-list? actor cur-actor-list))


;;; Given a list of a list of symbols, finds if a specific symbol list is present
(define (actor-in-list? actor a-list)
  (if (null? a-list)
      #f
      ;else
      (if (equal? (car a-list) actor)
          #t
          (actor-in-list? actor (cdr a-list)))))
  
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;; TESTING

(define m1 (new-movie '(Die Hard) 1890 (new-cast '(Uri Gorelik) '(Garry Whoa))))
(define m2 (new-movie '(Donnie Darko) 2001 (new-cast '(Jake Ghellaienhal) '(His Sister))))
(define mq (list m1))


(add-movie m2 mq)


;; Try deleting the first movie
