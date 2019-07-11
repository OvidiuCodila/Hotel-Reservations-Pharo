Class {
	#name : #HotelExamples,
	#superclass : #Object,
	#category : #'Tut-HotelReservations'
}

{ #category : #adding }
HotelExamples >> addTreeNodesAndEdges [
	<gtExample>
	| view hotel reservs rooms numberOfNodes |
	view := self emptyView.
	hotel := self hotelWithFourRoomsAndReservation.
	rooms := hotel rooms.
	reservs := hotel allReservations.
	numberOfNodes := rooms size + reservs size + 1.
	view nodes 
		shape: [ :x | 
			BlTextElement new text: ((x name) asString asRopedText 
				attributes: {BlTextForegroundAttribute paint: Color black}; fontSize: 15) ];
		with: { hotel }.
	view nodes 
		shape: [ :x | 
			BlTextElement new text: ((x capacity) asString asRopedText 
				attributes: {BlTextForegroundAttribute paint: Color gray}; fontSize: 13) ];
		with: rooms.
	view nodes 
		shape: [ :x | 
			BlTextElement new text: (x asString asRopedText 
				attributes: {BlTextForegroundAttribute paint: Color lightGray}; fontSize: 8) ];
		with: reservs.
	self assert: view topStep root children size equals: numberOfNodes.
	view edges 
		fromCenterBottom;
		toCenterTop;
		shape: [ :x | 
			BlLineElement new
				border: (BlBorder paint: (Color blue alpha: 0.8) width: 1.2) ];
		connect: { hotel } from: [:h | h] toAll: [:h | h rooms].
	view edges
		fromCenterBottom; 
		toCenterTop;
		shape: [ :x | 
			BlLineElement new
				border: (BlBorder paint: (Color blue alpha: 0.8) width: 1.2) ];
		connect: rooms from: [ :r | r ] toAll: [:r | r reservations].
	self assert: view topStep root graph edgeChildren size equals: 5.
	^ view.
]

{ #category : #examples }
HotelExamples >> emptyView [
	<gtExample>
	| view |
	view := GtMondrian new.
	self assert: view topStep root children isEmpty.
	^ view.
]

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithFourRoomsAndReservation [
	<gtExample>
	| hotel |
	hotel := self hotelWithoutRooms.
	hotel addRoomFor: 3.
	hotel addRoomFor: 4.
	hotel addRoomFor: 2.
	hotel addRoomFor: 2.
	hotel addReservationFor: 4 from: Date today to: Date today + 2 days.
	
	self assert: (hotel availableRoomsFrom: Date today to: Date today + 2 days for: 7) size equals: 3.
	^ hotel.
]

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithOneRoom [
	<gtExample>
	| hotel |
	hotel := self hotelWithoutRooms.
	hotel addRoomFor: 4.
	self assert: (hotel availableRoomsFrom: Date today to: Date today + 2 days for: 4) size equals: 1.
	^ hotel.
]

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithOneRoomAndOneReservation [
	<gtExample>
	| hotel |
	hotel := self hotelWithOneRoom.
	hotel addReservationFor: 4 from: Date today to: Date today + 1 days.
	self assert: (hotel availableRoomsFrom: Date today to: Date today + 2 days for: 7) size equals: 0.
	self assert: (hotel availableRoomsFrom: Date today to: Date today + 2 days for: 4) size equals: 0.
	self assert: (hotel availableRoomsFrom: Date today + 2 days to: Date today + 4 days for: 4) size 		equals: 1.
	^ hotel.
]

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithoutRooms [
	<gtExample>
	| hotel |
	hotel := Hotel new.
	hotel setName: 'HotelName'.
	self assert: hotel rooms isEmpty.
	^ hotel.
]

{ #category : #'as yet unclassified' }
HotelExamples >> layoutForTree [
	<gtExample>
	| view |
	view := self addTreeNodesAndEdges.
	view layout tree.
	self assert: (view root layout isKindOf: BlOnceLayout).
	self assert: (view root layout layout isKindOf: GtGradVerticalTreeLayout).
	^ view.
]
