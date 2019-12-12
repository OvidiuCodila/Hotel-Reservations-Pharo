"
I model a computer network. I have more computers connected between them.
"
Class {
	#name : #ComputersNetwork,
	#superclass : #Object,
	#instVars : [
		'computers',
		'name'
	],
	#category : #'GToolkit-Demo-ComputersNetwork'
}

{ #category : #adding }
ComputersNetwork >> addComputer: aComputer [
	computers add: aComputer.
]

{ #category : #accessing }
ComputersNetwork >> computers [
	^ computers.
]

{ #category : #'as yet unclassified' }
ComputersNetwork >> gtNetworksComputersViewFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Computers' translated;
		items: [ self computers ];
		column: 'Name' translated
			item: [:aComputer | aComputer name ];
		column: 'Ip' translated
			item: [:aComputer | aComputer ip ].
]

{ #category : #'as yet unclassified' }
ComputersNetwork >> gtNetworksIpsViewFor: aView [
	<gtView>
	
	^ aView list
		title: 'Ips' translated;
		items: [ self computers collect: [:aComputer |
				aComputer ip ]].
]

{ #category : #'as yet unclassified' }
ComputersNetwork >> gtSchematicViewFor: aView [
	<gtView>
	
	^ aView mondrian
		title: 'Schematic' translated;
		painting: [ :view | 
			view nodes
				shape: [:x | 
					BlTextElement new 
					text: (x name asRopedText 
						attributes: {BlTextForegroundAttribute paint: Color black}; fontSize: 10);
					geometry: BlEllipse new;
					border: (BlBorder paint: Color green);
					background: Color paleGreen;
					size: 40 @ 10;
					constraintsDo: [ :c | c padding: (BlInsets all: 10) ]];
				with: {self}.
			view nodes
				shape: [:x |
					BlTextElement new 
					text: (x ip asRopedText 
						glamorousRegularFont;
						foreground: Color gray; 
						fontSize: 8);
					geometry: BlEllipse new;
					border: (BlBorder paint: Color green);
					background: Color paleGreen;
					size: 60 @ 10;
					constraintsDo: [ :c | c padding: (BlInsets all: 10) ]];
				with: self computers.
			view edges
				fromCenterBottom;
				toCenterTop;
				shape: [:x |
					BlLineElement new
						border: (BlBorder paint: (Color blue alpha: 0.8) width: 1.2)];
				connect: { self } from: [:n | n] to: [:n | n computers].
			view layout circle].
]

{ #category : #initialization }
ComputersNetwork >> initialize [
	super initialize.
	name := '' asRopedText.
	computers := OrderedCollection new.
]

{ #category : #accessing }
ComputersNetwork >> name [
	^ name.
]

{ #category : #accessing }
ComputersNetwork >> name: aName [
	name := aName.
]
