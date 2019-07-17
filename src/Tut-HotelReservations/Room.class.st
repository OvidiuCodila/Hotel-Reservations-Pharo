"
I represent a room inside of a hotel and i can store reservations made to that hotel.
"
Class {
	#name : #Room,
	#superclass : #Object,
	#instVars : [
		'reservations',
		'capacity',
		'name'
	],
	#category : #'Tut-HotelReservations'
}

{ #category : #adding }
Room >> addReservationFrom: aBeginDate to: andEndDate [
	| res |
	res := Reservation new.
	res setBeginDate: aBeginDate.
	res setEndDate: andEndDate.
	res setNumberOfPeople: self capacity.
	reservations add: res.
]

{ #category : #accessing }
Room >> capacity [
	^ capacity.
]

{ #category : #accessing }
Room >> gtReservationsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Reservations' translated;
		items: [reservations];
		column: 'NumberOfPeople' translated
			item: [:anElement | anElement getNumberOfPeople];
		column: 'BeginDate' translated
			item: [:anElement | anElement getBeginDate];
		column: 'EndDate' translated
			item: [:anElement | anElement getEndDate].
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

{ #category : #accessing }
Room >> name [
	^ name.
]

{ #category : #accessing }
Room >> reservations [
	^ reservations
]

{ #category : #initialization }
Room >> setCapacity: aCapacity [
	capacity := aCapacity.
]

{ #category : #initialization }
Room >> setName: aName [
	name := aName.
]
