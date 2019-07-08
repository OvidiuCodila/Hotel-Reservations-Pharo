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
]

{ #category : #accessing }
Hotel >> gtRoomsFor: aView [
	<gtView>
	^ aView list
		title: 'Rooms';
		items: [rooms]
]

{ #category : #initialization }
Hotel >> initialize [
	super initialize.
	rooms := OrderedCollection new.
]

{ #category : #testing }
Hotel >> isAvailableFrom: aBeginDate to: anEndDate for: aCapacity [
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
					and: [ aRoom isNotAlreadySelectedIn: res ] ]] ifNone: [ nil ].
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
