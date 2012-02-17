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


