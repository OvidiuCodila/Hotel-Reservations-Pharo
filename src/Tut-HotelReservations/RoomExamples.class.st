"
!Room Examples

${example:RoomExamples>>#roomWithMoreReservations|noCode=|previewShow=#gtReservationsFor:}$
"
Class {
	#name : #RoomExamples,
	#superclass : #Object,
	#category : #'Tut-HotelReservations'
}

{ #category : #'as yet unclassified' }
RoomExamples >> roomWithCapacity [
	<gtExample>
	| room |
	room := self roomWithoutReservations.
	room setCapacity: 3.
	room addReservationFrom: Date today to: (Date today + 3 days).
	
	self assert: (room isAvailableFrom: Date tomorrow to: (Date tomorrow + 3 days) for: 3) not.
	self assert: (room isAvailableFrom: (Date tomorrow + 4 days) to: (Date tomorrow + 6 days) for: 5) not.
	self assert: (room isAvailableFrom: (Date tomorrow + 4 days) to: (Date tomorrow + 6 days) for: 3).
]

{ #category : #'as yet unclassified' }
RoomExamples >> roomWithMoreReservations [
	<gtExample>
	| room testDateInTrue testDateOutTrue testDateInFail testDateOutFail |
	room := self roomWithoutReservations.
	room setCapacity: 3.
	room addReservationFrom: (Date year: 2019 month: 06 day: 27) to: (Date year: 2019 month: 06 day: 29).
	room addReservationFrom: (Date year: 2019 month: 07 day: 01) to: (Date year: 2019 month: 07 day: 04).
	room addReservationFrom: (Date year: 2019 month: 07 day: 05) to: (Date year: 2019 month: 07 day: 06).
	
	testDateInTrue := Date year: 2019 month: 07 day: 07.
	testDateOutTrue := Date year: 2019 month: 07 day: 09.
	testDateInFail := Date year: 2019 month: 06 day: 29.
	testDateOutFail := Date year: 2019 month: 07 day: 02.
	
	self assert: (room isAvailableFrom: testDateInTrue to: testDateOutTrue).
	self assert: (room isAvailableFrom: testDateInFail to: testDateOutFail) not.
	^ room.
]

{ #category : #'as yet unclassified' }
RoomExamples >> roomWithOneReservation [
   <gtExample>
   | room |
	room := self roomWithoutReservations.
	room setCapacity: 3.
   room addReservationFrom: Date today to: Date tomorrow.
   self assert: (room isAvailableOn: Date yesterday).
   self assert: (room isAvailableOn: Date today) not.
   ^ room
]

{ #category : #'as yet unclassified' }
RoomExamples >> roomWithoutReservations [
	<gtExample>
	| room |
	room := Room new.
	self assert: room reservations isEmpty.
	^ room.
]
