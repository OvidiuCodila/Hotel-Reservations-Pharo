Class {
	#name : #Reservation,
	#superclass : #Object,
	#instVars : [
		'beginDate',
		'endDate',
		'numberOfPeople'
	],
	#category : #'Tut-HotelReservations'
}

{ #category : #'as yet unclassified' }
Reservation >> getBeginDate [
	^ beginDate.
]

{ #category : #'as yet unclassified' }
Reservation >> getEndDate [
	^ endDate.
]

{ #category : #'as yet unclassified' }
Reservation >> getNumberOfPeople [
	^ numberOfPeople.
]

{ #category : #testing }
Reservation >> isFrom: aBeginDate to: anEndDate [
	^ ((aBeginDate < beginDate and: [anEndDate > beginDate]) 
		or: [(aBeginDate < endDate and: [anEndDate > endDate]) 
			or: [aBeginDate >= beginDate and: [anEndDate <= endDate]]]).
]

{ #category : #testing }
Reservation >> isOn: date [
	^ (date < beginDate or: [date > endDate]) not.
]

{ #category : #initialization }
Reservation >> setBeginDate: date [
	beginDate := date.
]

{ #category : #initialization }
Reservation >> setEndDate: date [
	endDate := date.
]

{ #category : #initialization }
Reservation >> setNumberOfPeople: aCapacity [
	numberOfPeople := aCapacity.
]
