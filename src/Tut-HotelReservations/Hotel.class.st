Class {
	#name : #Hotel,
	#superclass : #Object,
	#instVars : [
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

{ #category : #accessing }
Hotel >> gtRoomsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Rooms' translated;
		items: [rooms];
		column: 'Name' translated
			item: [:aRoom | aRoom name];
		column: 'Capacity' translated
			item: [:aRoom | aRoom capacity].
]

{ #category : #initialization }
Hotel >> initialize [
	super initialize.
	rooms := OrderedCollection new.
]

{ #category : #accessing }
Hotel >> rooms [
	^ rooms.
]
