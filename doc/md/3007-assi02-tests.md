3007 Assignment 2 Tests
=======================

## Q1
These are the money 'objects' that were used for the test.
		(define m1 (make-money 88 'dollars))
		(define m2 (make-money 24 'euros))
		(define m3 (make-money 44 'pounds))


### Testing Add money
These values were tested against a Google calculation

		> (add-money m2 m3)
		(76.30188679245283 . euros)
		(31.746031746031747 . dollars)
		> (add-money m1 m2)
		(119.74603174603175 . dollars)
		> (add-money m2 m1)
		(90.528 . euros)
		(76.30188679245283 . euros)
		> (add-money m3 m2)
		(64.19047619047619 . pounds)

### Testing Subtract money
These values were tested against a Google calculation

		> (subtract-money m1 m2)
		(56.25396825396825 . dollars)
		> (subtract-money m1 m3)
		(18.81761006289308 . dollars)
		> (subtract-money m2 m3)
		(-28.30188679245283 . euros)
		> (subtract-money m3 m2)
		(23.80952380952381 . pounds)
		
### Testing given code
A copy and paste of the code provided in the assignment description

		(define dollar-amount (make-money 100 'dollars))  ; Make a $100
		(define pound-amount (make-money 100 'pounds))    ; Make 100 pounds
		(define dollars-plus-pounds (add-money dollar-amount pound-amount)) ; Result should be dollars
		(define pounds-plus-dollars (subtract-money pound-amount dollar-amount))  ; Result should be pounds

		> dollar-amount
		(100 . dollars)
		> pound-amount
		(100 . pounds)
		> dollars-plus-pounds
		(257.2327044025157 . dollars)
		> pounds-plus-dollars
		(36.39999999999999 . pounds)
		> (currency 'euros)
		0.756
		
----

## Q2

### Adding a movie to the list
As we can see a movie 'object' is being added to the list every time

		> mq
		(((die hard) 1890 ((uri gorelik) (garry whoa))))
		> mq
		(((donnie darko) 2001 ((jake ghellaienhal) (his sister))) ((die hard) 1890 ((uri gorelik) (garry whoa))))
		> mq
		(((matrix) 2001 ((keanu reeves) (trinity)))
		 ((donnie darko) 2001 ((jake ghellaienhal) (his sister)))
		 ((die hard) 1890 ((uri gorelik) (garry whoa))))
		
### Finding a movie
As we can see the find movie by title method returns a movie 'object

		(find-movie '(die hard) mq)
		(find-movie '(not in the list) mq)
		(find-movie '(matrix) mq)
		
		((die hard) 1890 ((uri gorelik) (garry whoa)))
		() #=> Movie doesn't exist
		((matrix) 2001 ((keanu reeves) (trinity)))
		
### Deleting a movie
Movies are deleted from the list.
		
		mq
		(display 'deleting)
		(delete-movie '(matrix) mq)
		mq
		(display 'deleting)
		(delete-movie '(not in the list) mq)
		mq
		(display 'deleting)
		(delete-movie '(die hard) mq)
		mq


		(((matrix) 2001 ((keanu reeves) (trinity)))
		 ((donnie darko) 2001 ((jake ghellaienhal) (his sister)))
		 ((die hard) 1890 ((uri gorelik) (garry whoa))))
		deleting((matrix) 2001 ((keanu reeves) (trinity)))
		(((donnie darko) 2001 ((jake ghellaienhal) (his sister))) ((die hard) 1890 ((uri gorelik) (garry whoa))))
		deleting()
		(((donnie darko) 2001 ((jake ghellaienhal) (his sister))) ((die hard) 1890 ((uri gorelik) (garry whoa))))
		deleting((die hard) 1890 ((uri gorelik) (garry whoa)))
		(((donnie darko) 2001 ((jake ghellaienhal) (his sister))))


### Listing all movies with actor

Given that an actor is in multiple movies, the method is capable of multiple movie objects.

		(list-movies '(uri gorelik) mq)
		(list-movies '(not in the list) mq)
		(list-movies '(keanu reeves) mq)

		(((die hard) 1890 ((uri gorelik) (garry whoa))) ((matrix) 2001 ((uri gorelik) (keanu reeves) (trinity))))
		()
		(((matrix) 2001 ((uri gorelik) (keanu reeves) (trinity))))
		
----

## Q3

### Testing first triple

		(define a (triple 1 2 3))
		(first a)
		(second a)
		(third a)
		
		1
		2
		3
		
### Testing new triple

		(define a (new-triple 5 6 7))
		(first a)
		(second a)
		(third a)

		(set-first! a 88)
		(set-second! a 88)
		(set-third! a 88)

		(first a)
		(second a)
		(third a)
		
		5
		6
		7
		
		88
		88
		88
		
----

#Q4 

### Testing deep-member

		(deep-member (list 1 2 (list 3 4 (list 5 6))) 5)
		(deep-member (list 1 2 (list 3 4 (list 5 6))) 7)
		(deep-member (list 1 2 (list 3 4 (list 5 6))) 8)
		(deep-member (list 1 2 (list 3 4 (list 5 6))) 1)
		(deep-member (list 1 2 (list 3 4 (list 5 6))) 2)
		(deep-member (list 1 2 (list 3 4 (list 5 6))) 20)
		(deep-member (list 1 2 (list 3 4 (list 5 6))) 4)

		#t
		#f
		#f
		#t
		#t
		#f
		#t

### Testing sum odd

		(sum-odd (list 1 3 (list 5 7 9 (list 11 13))))
		(sum-odd (list 0 2 (list 4 6 8 (list 10 12))))
		(sum-odd (list 1 2 (list 3 4 5)))
		(sum-odd (list 1 2 (list 3 4 5) 7 7 7))
		(sum-odd (list 1))
		(sum-odd (list 0))
		(sum-odd (list 100))
		
		49
		0
		9
		30
		1
		0
		0
		
### Testing assoc list

		(define a (assoc-list '(a b c) '(1 2 3)))
		(define b (assoc-list '(1 2 3) '(a b c)))
		(define c (assoc-list '(1 2) '(a b c)))
		a
		b
		c
		
		((a . 1) (b . 2) (c . 3))
		((1 . a) (2 . b) (3 . c))
		#=> No value for c because the lists were not equal size
		
### Testing keys

		(define a (assoc-list '(a b c) '(1 2 3)))
		(define b (assoc-list '(1 2 3) '(a b c)))
		(define c (assoc-list '(1 2 3 4) '(a b c d)))

		(keys a)
		(keys b)
		(keys c)

		(a b c)
		(1 2 3)
		(1 2 3 4)
		
### Testing values

		(define a (assoc-list '(a b c) '(1 2 3)))
		(define b (assoc-list '(1 2 3) '(a b c)))
		(define c (assoc-list '(1 2 3 4) '(a b c d)))

		(values a)
		(values b)
		(values c)

		(1 2 3)
		(a b c)
		(a b c d)
		
### Testing append copy

As we can see, changing the lists of the appended lists does not affect the newly created lists.

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
		
		(1 2 3 4 5 6)
		(1 2 3 4 5 6)
		(55 66 77 88 33 44 22 1 2 3 4 5 6)
		(1 2 3 4 5 6 55 66 77 88 33 44 22)
		(1 2 3 4 5 6 55 66 77 88 33 44 22)
		
----

## Q5

----


## Q6

### Testing average

		(average 1 2 3 4 5 6 7) 
		(average 2)
		(average 2 2 2 2)
		
		4
		2
		2
		
### Testing pipeline

		(define square-cubed (pipeline square square square))
		(define test-list (list 3 (list 77 75 97 23)  99))
		
		
		(square-cubed 2)
		(square-cubed 3)
		

		256
		6561
		
#### Testing cdar cddar cdadr
	
		(car (cdr test-list))
		(cdar test-list)

		(car (cdr (cdr test-list)))
		(cddar test-list)

		(cdadr test-list)
		(cdr (car (cdr test-list)))
		
		cdar
		(77 75 97 23)
		(77 75 97 23)

		cddar
		99
		99

		cdadr
		(75 97 23)
		(75 97 23)