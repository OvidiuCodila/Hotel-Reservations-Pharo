Class {
	#name : #HotelExamples,
	#superclass : #Object,
	#category : #'Tut-HotelReservations'
}

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithFourRoomsAndReservation [
	<gtExample>
	| hotel |
	hotel := Hotel new.
	hotel addRoomFor: 3.
	hotel addRoomFor: 4.
	hotel addRoomFor: 2.
	hotel addRoomFor: 2.
	hotel addReservationFor: 4 from: Date today to: Date today + 2 days.
	^ hotel
]

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithRooms [
	<gtExample>
	| hotel |
	hotel := self hotelWithFourRoomsAndReservation.
	self assert: (hotel availableRoomsFrom: Date today to: Date today + 2 days for: 7) size equals: 3.
	^ hotel.
]

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithoutRooms [
	<gtExample>
	| hotel |
	hotel := Hotel new.
	self assert: hotel rooms isEmpty.
	^ hotel.
]
