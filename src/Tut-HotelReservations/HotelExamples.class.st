"
!Hotel Basics

Hotel is a class made for an easy way of managing hotels. A hotel has a name, to be easily identified and a list of the rooms it has. As its main responsibilities it can: add more rooms to the hotel, add reservations to those rooms and check if there are available rooms for a specified period and number of people.

Its main collaborator is the Room class, that stores a room from the hotel with its according reservations.
You can learn more about it here: ${class:RoomExamples}$.

To get a better idea of what this is about, we will consider some examples.

!!Hotel Examples

First we will create a new hotel, without rooms and set its name.

${example:HotelExamples>>#hotelWithoutRooms|previewExpanded}$

Then we can add a room to our newly created hotel.

${example:HotelExamples>>#hotelWithOneRoom|previewExpanded}$

After that we add a reservation to the hotel. The reservation is added to the first room that is available and fits the number of people. And we can see the reservation is made by checking if the hotel has a free room for the same perios and number of people.

${example:HotelExamples>>#hotelWithFourRoomsAndReservation|previewExpanded}$

!!Custom views

To have a better understanding of the design, we implemented some custom views.
One of them uses the Mondrian engine to create a tree view.

First we added the nodes: the hotel, the rooms and the reservations, and the edges between them.

${example:HotelExamples>>#addTreeNodesAndEdges|previewExpanded}$

And then we lay them out.

${example:HotelExamples>>#layoutForTree|previewExpanded}$
"
Class {
	#name : #HotelExamples,
	#superclass : #Object,
	#category : #'Tut-HotelReservations'
}

{ #category : #adding }
HotelExamples >> addTreeNodesAndEdges [
	<gtExample>
	| view hotel |
	view := self emptyView.
	hotel := self hotelWithFourRoomsAndReservation.
	view nodes 
		shape: [ :x | 
			hotel nodeStyleWithText: (x name) andFontSize: 10 andSize: (50 @ 9) ];
		with: { hotel }.
	view nodes 
		shape: [ :x | 
			hotel nodeStyleWithText: (x capacity) andFontSize: 8 andSize: (8 @ 8)];
		with: hotel rooms.
	view nodes 
		shape: [ :x |
			hotel nodeStyleWithText: ((x dateAsDayMonthString: (x getBeginDate)),' - ',
			(x dateAsDayMonthString: (x getEndDate))) andFontSize: 7 andSize: (50 @ 8)];
		with: hotel allReservations.
	self assert: view topStep root children size equals: 6.
	view edges 
		fromCenterBottom;
		toCenterTop;
		shape: [ :x |
			hotel edgeStyle ];
		connect: { hotel } from: [:h | h] toAll: [:h | h rooms].
	view edges
		fromCenterBottom; 
		toCenterTop;
		shape: [ :x |
			hotel edgeStyle ];
		connect: (hotel rooms) from: [ :r | r ] toAll: [:r | r reservations].
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
	self assert: hotel rooms size equals: 1.
	^ hotel.
]

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithOneRoomAndOneReservation [
	<gtExample>
	| hotel |
	hotel := self hotelWithOneRoom.
	hotel addReservationFor: 4 from: Date today to: Date today + 1 days.
	self assert: 
		(hotel availableRoomsFrom: Date today to: Date today + 2 days for: 4) size equals: 0.
	self assert: 
		(hotel availableRoomsFrom: Date today + 2 days to: Date today + 4 days for: 4) size equals: 1.
	^ hotel.
]

{ #category : #'as yet unclassified' }
HotelExamples >> hotelWithThreeRooms [
	<gtExample>
	| hotel |
	hotel := self hotelWithoutRooms.
	hotel addRoomFor: 4.
	hotel addRoomFor: 3.
	hotel addRoomFor: 4.
	
	self assert: hotel rooms size equals: 3.
	
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
