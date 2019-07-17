"
!Hotel

I represent a way of managing a system based on hotel with rooms and reservations.
"
Class {
	#name : #Hotel,
	#superclass : #Object,
	#instVars : [
		'name',
		'rooms'
	],
	#category : #'Tut-HotelReservations'
}

{ #category : #adding }
Hotel >> addReservationFor: aCapacity from: aBeginDate to: anEndDate [
	| fittingRoom |
	fittingRoom := rooms detect: [ :aRoom |
		aRoom isAvailableFrom: aBeginDate to: anEndDate for: aCapacity] ifNone: [ nil ].
	( fittingRoom notNil ) 
		ifTrue: [fittingRoom addReservationFrom: aBeginDate to: anEndDate. ^ fittingRoom ]
		ifFalse: [ ^ nil ].
]

{ #category : #adding }
Hotel >> addRoomFor: aCapacity [
	| room |
	room := Room new.
	room setCapacity: aCapacity.
	rooms add: room.
	room setName: rooms size.
]

{ #category : #'as yet unclassified' }
Hotel >> allReservations [
	| reservations |
	reservations := OrderedCollection new.
	self rooms do: [ :aRoom |
		(aRoom reservations isEmpty) 
			ifFalse: [ reservations addAll: aRoom reservations ] ].
	^ reservations.
]

{ #category : #testing }
Hotel >> availableRoomsFrom: aBeginDate to: anEndDate for: aCapacity [
	| sc cap room res |
	sc := SortedCollection sortBlock: [ :r1 :r2 | r1 capacity >= r2 capacity ].
	sc addAll: rooms.
	res := OrderedCollection new.
	[ sc isEmpty ] whileFalse: [
		res removeAll.
		cap := aCapacity.
		[ cap > 0 ] whileTrue: [  
			room := sc detect: [:aRoom |
				(aRoom isAvailableFrom: aBeginDate to: anEndDate) and: [(aRoom capacity <= cap)
					and: [ (res includes: aRoom) not] ]] ifNone: [ nil ].
				( room isNil )
					ifTrue: [ cap := -1 ]
					ifFalse: [ cap := cap - room capacity. res add: room ]. 
			].
		(cap == 0) ifTrue: [ ^ res ].
		sc remove: (sc at: 1).
		].
	res removeAll.
	^ res.
]

{ #category : #'as yet unclassified' }
Hotel >> edgeStyle [
	| style |
	style := BlLineElement new
					border: (BlBorder paint: (Color blue alpha: 0.8) width: 1.2).
	^ style.
]

{ #category : #accessing }
Hotel >> gtRoomsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Rooms' translated;
		items: [rooms];
		column: 'Number' translated
			item: [:aRoom | aRoom name];
		column: 'Capacity' translated
			item: [:aRoom | aRoom capacity].
]

{ #category : #ui }
Hotel >> gtTreeFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Tree' translated;
		painting: [ :view |
			view nodes 
				shape: [ :x | 
					self nodeStyleWithText: (x name) andFontSize: 10 andSize: (50 @ 9)];
			with: { self }.
			view nodes 
				shape: [ :x | 
					self nodeStyleWithText: (x capacity) andFontSize: 8 andSize: (8 @ 8)];
			with: self rooms.
			view nodes 
				shape: [ :x |
					self nodeStyleWithText: ((x dateAsDayMonthString: (x getBeginDate)),' - ',
						(x dateAsDayMonthString: (x getEndDate))) andFontSize: 7 andSize: (50 @ 8)];
			with: self allReservations.
			view edges 
				fromCenterBottom;
				toCenterTop;
				shape: [ :x |
					self edgeStyle];
				connect: { self } from: [:h | h] toAll: [:h | h rooms].
			view edges
				fromCenterBottom; 
				toCenterTop;
				shape: [ :x |
					self edgeStyle];
				connect: (self rooms) from: [ :r | r ] toAll: [:r | r reservations].
			view layout tree.
			]
]

{ #category : #initialization }
Hotel >> initialize [
	super initialize.
	rooms := OrderedCollection new.
]

{ #category : #accessing }
Hotel >> name [
	^ name.
]

{ #category : #'as yet unclassified' }
Hotel >> nodeStyleWithText: aText andFontSize: aFontSize andSize: aSize [
	| style |
	style := BlTextElement new 
					text: (aText asString asRopedText 
						attributes: {BlTextForegroundAttribute paint: Color black}; fontSize: aFontSize);
					geometry: BlRectangle new;
					border: (BlBorder paint: Color black);
					background: Color paleOrange;
					size: aSize;
					constraintsDo: [ :c | c padding: (BlInsets all: 10) ].
	^ style.
]

{ #category : #accessing }
Hotel >> rooms [
	^ rooms.
]

{ #category : #initialization }
Hotel >> setName: aName [
	name := aName.
]
