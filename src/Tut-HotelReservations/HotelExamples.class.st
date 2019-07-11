Class {
	#name : #HotelExamples,
	#superclass : #Object,
	#category : #'Tut-HotelReservations'
}

{ #category : #adding }
HotelExamples >> addTreeEdges [
	<gtExample>
	| view |
	view := self addTreeNodes.
	^ view.
]

{ #category : #adding }
HotelExamples >> addTreeNodes [
	<gtExample>
	| view hotel reservations rooms numberOfNodes |
	view := self emptyView.
	hotel := self hotelWithFourRoomsAndReservation.
	rooms := hotel rooms.
	reservations := hotel allReservations.
	numberOfNodes := rooms size + reservations size + 1.
	view nodes 
		shape: [ :x | 
			BlTextElement new text: (x asString asRopedText 
				attributes: {BlTextForegroundAttribute paint: Color black}) ];
		with: { hotel }.
	view nodes 
		shape: [ :x | 
			BlTextElement new text: (x asString asRopedText 
				attributes: {BlTextForegroundAttribute paint: Color black}) ];
		with: rooms.
	view nodes 
		shape: [ :x | 
			BlTextElement new text: (x asString asRopedText 
				attributes: {BlTextForegroundAttribute paint: Color black}) ];
		with: reservations.
	self assert: view topStep root children size equals: numberOfNodes.
	view edges 
		fromCenterBottom;
		toCenterTop;
		connectFrom: [:x | hotel] to: [:x | (hotel rooms includes: x) ifTrue: [x]].
	self assert: view topStep root graph edgeChildren size equals: 4.
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
	hotel := Hotel new.
	hotel addRoomFor: 3.
	hotel addRoomFor: 4.
	hotel addRoomFor: 2.
	hotel addRoomFor: 2.
	hotel addReservationFor: 4 from: Date today to: Date today + 2 days.
	
	self assert: (hotel availableRoomsFrom: Date today to: Date today + 2 days for: 7) size equals: 3.
	^ hotel.
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

{ #category : #'as yet unclassified' }
HotelExamples >> layoutForTree [
	<gtExample>
	| view |
	view := self addTreeEdges.
	view layout tree.
	self assert: (view root layout isKindOf: BlOnceLayout).
	self assert: (view root layout layout isKindOf: GtGradVerticalTreeLayout).
	^ view.
]
