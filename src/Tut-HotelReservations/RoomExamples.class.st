"
!Room Basics

A room is a part of a hotel. It has a name, represented by a number, a capacity, to know how many people can fit inside it and a list of the reservations made to this room. Its main responsibilities are to add reservations to it and to check if it is available for a certain number of people on a certain period.

Its main collaborators are the Hotel class, that creates, stores and manages the room and the Reservations class.

To get a better idea of what this is about, we will consider some examples.

!!Room Examples

First we create a room without reservations.

${example:RoomExamples>>#roomWithoutReservations}$

Then we add a capcity to the room.

${example:RoomExamples>>#roomWithCapacity|previewExpanded}$

Finally we can add reservations to out room and then verify if they were correctly made by checking if the room is available on a certain period.

${example:RoomExamples>>#roomWithMoreReservations|previewExpanded}$
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
	
	self assert: (room isAvailableFrom: Date today to: Date tomorrow for: 5) not.
	self assert: (room isAvailableFrom: Date today to: Date tomorrow for: 3).
	^ room.
]

{ #category : #'as yet unclassified' }
RoomExamples >> roomWithMoreReservations [
	<gtExample>
	| room testDateInTrue testDateOutTrue testDateInFail testDateOutFail |
	room := self roomWithCapacity.
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
	room := self roomWithCapacity.
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
