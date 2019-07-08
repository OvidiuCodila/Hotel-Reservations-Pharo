Class {
	#name : #Reservation,
	#superclass : #Object,
	#instVars : [
		'beginDate',
		'endDate'
	],
	#category : #'Tut-HotelReservations'
}

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
