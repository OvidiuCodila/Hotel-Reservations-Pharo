Class {
	#name : #Room,
	#superclass : #Object,
	#instVars : [
		'reservations',
		'capacity'
	],
	#category : #'Tut-HotelReservations'
}

{ #category : #adding }
Room >> addReservationFrom: aBeginDate to: andEndDate [
	| res |
	res := Reservation new.
	res setBeginDate: aBeginDate.
	res setEndDate: andEndDate.
	reservations add: res.
]

{ #category : #accessing }
Room >> capacity [
	^ capacity.
]

{ #category : #testing }
Room >> hasCapacityFor: aCapacity [
	^ (aCapacity == capacity)
]

{ #category : #initialization }
Room >> initialize [
	super initialize.
	reservations := OrderedCollection new.
]

{ #category : #testing }
Room >> isAvailableFrom: aBeginDate to: anEndDate [
	^ reservations 
		noneSatisfy: [ :aReservation | 
			aReservation isFrom: aBeginDate to: anEndDate]
]

{ #category : #testing }
Room >> isAvailableFrom: aBeginDate to: anEndDate for: aCapacity [
	^ ((self isAvailableFrom: aBeginDate to: anEndDate) and: [self hasCapacityFor: aCapacity])
]

{ #category : #testing }
Room >> isAvailableOn: date [
	^ reservations
		noneSatisfy: [ :aReservation | 
			aReservation isOn: date ].
]

{ #category : #testing }
Room >> isNotAlreadySelectedIn: aSolution [
	| foundRoom |
	foundRoom := aSolution detect: [ :aRoom |
		self == aRoom ] ifNone: [ nil ].
	(foundRoom isNil)
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ].
]

{ #category : #accessing }
Room >> reservations [
	^ reservations
]

{ #category : #initialization }
Room >> setCapacity: aCapacity [
	capacity := aCapacity.
]
