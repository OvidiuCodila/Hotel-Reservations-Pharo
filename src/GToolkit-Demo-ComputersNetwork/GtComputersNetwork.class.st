"
I model a computer network. I have more computers connected between them.
"
Class {
	#name : #GtComputersNetwork,
	#superclass : #Object,
	#instVars : [
		'name',
		'computers'
	],
	#category : #'GToolkit-Demo-ComputersNetwork'
}

{ #category : #adding }
GtComputersNetwork >> addComputer: aComputer [
	computers add: aComputer.
]

{ #category : #accessing }
GtComputersNetwork >> computers [
	^ computers.
]

{ #category : #'as yet unclassified' }
GtComputersNetwork >> gtNetworksComputersViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Computers' translated;
		items: [ self computers ];
		column: 'Name' translated
			item: [:aComputer | 
				aComputer name ];
		column: 'Ip' translated
			item: [:aComputer | 
				aComputer ip ].
]

{ #category : #'as yet unclassified' }
GtComputersNetwork >> gtNetworksIpsViewFor: aView [
	<gtView>
	^ aView list
		title: 'Ips' translated;
		items: [ self computers 
			collect: [:aComputer |
				aComputer ip ]].
]

{ #category : #'as yet unclassified' }
GtComputersNetwork >> gtSchematicViewFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Schematic' translated;
		painting: [ :view | 
			view nodes
				shape: [:x | 
					self viewNodeShapeOfSize: (40 @ 10) 
						withText: (x name) 
						ofFontSize: 10];
				with: { self }.
			view nodes
				shape: [:x |
					self viewNodeShapeOfSize: (60 @ 10) 
						withText: (x ip) 
						ofFontSize: 8];
				with: self computers.
			view edges
				fromCenterBottom; toCenterTop;
				shape: [:x |
					BlLineElement new border: (BlBorder paint: (Color blue alpha: 0.3) width: 1.2)];
				connect: { self } from: [:n | n] toAll: [:n | n computers].
			view layout tree].
]

{ #category : #initialization }
GtComputersNetwork >> initialize [
	super initialize.
	name := '' asRopedText.
	computers := OrderedCollection new.
]

{ #category : #accessing }
GtComputersNetwork >> name [
	^ name.
]

{ #category : #accessing }
GtComputersNetwork >> name: aName [
	name := aName.
]

{ #category : #'as yet unclassified' }
GtComputersNetwork >> viewNodeShapeOfSize: aSize withText: aText ofFontSize: aFontSize [
	^ BlTextElement new 
					text: (aText asRopedText 
						glamorousRegularFont;
						foreground: Color black;
						fontSize: aFontSize);
					geometry: BlEllipse new;
					border: (BlBorder paint: Color green); 
					background: Color paleGreen;
					size: aSize; constraintsDo: [ :c | c padding: (BlInsets all: 10) ].
]
