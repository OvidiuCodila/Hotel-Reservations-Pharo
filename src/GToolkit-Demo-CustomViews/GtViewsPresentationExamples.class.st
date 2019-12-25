"
I am an auxiliary class that contains views examples to be included in the presentation.
"
Class {
	#name : #GtViewsPresentationExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #example }
GtViewsPresentationExamples >> aMethodForPlayingAround [
	<gtExample>
	| container inspectorContainer subject editor coder styler |
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		background: Color white;
		margin: (BlInsets all: 10);
		look: BrShadowLook.
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	
	styler := GtExplanationLinkStyler new.
	styler addSelector: #title:.
	styler addPragma: #gtView.
	styler addVariableName: 'list'.
	
	coder := GtMethodCoder forMethod: GtComputersNetwork>>#gtNetworksIpsViewFor:.
	coder explanationLink: styler.
	subject := (coder expanded: true) asElement.
	subject forceLayout.
	inspectorContainer addChild: subject.
	
	editor := BrEditor new
		look: BrGlamorousRegularEditorLook;
		text: self viewCodeExplanationText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent.
			c linear weight: 0.3 ].
	container addChild: editor.
	container addChild: inspectorContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> buttonLayoutForModelName: aName withSize: aSize [
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: aSize;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: aName).
]

{ #category : #accessing }
GtViewsPresentationExamples >> inspectorOnHotelObjectExample [
	<gtExample>
	| container inspectorContainer subject inspectorHeader editor inspectorView |
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		background: Color white;
		margin: (BlInsets all: 10);
		look: BrShadowLook.
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	subject := ((HotelExamples new hotelWithThreeRooms) gtViewsFor: GtPhlowView empty) asElementDo: [ :e | e ].
	subject forceLayout.
	inspectorHeader := subject phlow firstChildWithView.
	inspectorView := inspectorHeader viewContentElement phlow
		firstChildWithView.
	inspectorContainer addChild: subject.
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #object withSize: (30 @ 30))
				relocate:
					(inspectorContainer
						globalPointToLocal: (inspectorHeader localPointToGlobal: 10 @ 5))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #Raw withSize: (30 @ 30))
				relocate:
					(inspectorContainer
						globalPointToLocal: (inspectorView localPointToGlobal: 120 @ 5))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #Rooms withSize: (30 @ 30))
				relocate:
					(inspectorContainer
						globalPointToLocal: (inspectorView localPointToGlobal: 70 @ 5))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #Tree withSize: (30 @ 30))
				relocate:
					(inspectorContainer
						globalPointToLocal: (inspectorView localPointToGlobal: 15 @ 5))).
	editor := BrEditor new
		look: BrGlamorousRegularEditorLook;
		text: self inspectorViewsExplanationText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent.
			c linear weight: 0.3 ].
	container addChild: editor.
	container addChild: inspectorContainer.
	^ container
]

{ #category : #accessing }
GtViewsPresentationExamples >> inspectorViewsExplanationText [
	| text |
	text := 
		'
		
		As you can see, we can make a lot of different views for an ' asRopedText,
		('object' asRopedText glamorousExplanationFor: #object),
		'.' asRopedText,
		
		'
		Besides the ' asRopedText,
		('Raw' asRopedText glamorousExplanationFor: #Raw),
		' view, we created a columned list view showing all the ' asRopedText,
		('Rooms' asRopedText glamorousExplanationFor: #Rooms),
		' and a graph like view that shows the hotel as a ' asRopedText,
		('Tree' asRopedText glamorousExplanationFor: #Tree),
		'.' asRopedText.
		
	^text
		glamorousRegularFont;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> pragmasMetricsViewExample [
	<gtExample>
	| container inspectorContainer subject editor |
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		background: Color white;
		margin: (BlInsets all: 10);
		look: BrShadowLook.
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	subject := ((#gtView gtPragmas) gtMetricsFor: GtPhlowView empty) asElementDo: [ :e | e ].
	subject forceLayout.
	inspectorContainer addChild: subject.
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #lines withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 1 @ 95))).
	editor := BrEditor new
		look: BrGlamorousRegularEditorLook;
		text: self pragmasMetricsViewExplanationText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent.
			c linear weight: 0.3 ].
	container addChild: editor.
	container addChild: inspectorContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> pragmasMetricsViewExplanationText [
	| text |
	text := 
		'


Inspecting the same querry, if we look at the Metrics view, which is another custom one,' asRopedText,
		' we can see that on average, a view method takes around 12 ' asRopedText,
		('lines' asRopedText glamorousExplanationFor: #lines),
		' of code.' asRopedText.
		
	^text
		glamorousRegularFont;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewCodeExample [
	<gtExample>
	| container inspectorContainer subject editor |
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		background: Color white;
		margin: (BlInsets all: 10);
		look: BrShadowLook.
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	subject := ((GtComputersNetwork>>#gtNetworksIpsViewFor:) gtSourceFor: GtPhlowView empty) asElementDo: [ :e | e ].
	subject forceLayout.
	inspectorContainer addChild: subject.
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #getView withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 195 @ 28))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #returnView withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 68 @ 56))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #gtView withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 50 @ 40))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #title withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 83 @ 70))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #types withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 118 @ 56))).
	editor := BrEditor new
		look: BrGlamorousRegularEditorLook;
		text: self viewCodeExplanationText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent.
			c linear weight: 0.3 ].
	container addChild: editor.
	container addChild: inspectorContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewCodeExplanationText [
	| text |
	text := '
	
	Every method gets a ' asRopedText,
	('view' asRopedText glamorousExplanationFor: #getView),
	' object as a parameter and returns a ' asRopedText,
	('view' asRopedText glamorousExplanationFor: #returnView),
	'object.
	Then, the first thing mentioned is the ' asRopedText,
	('gtView' asRopedText glamorousExplanationFor: #gtView),
	'pragma.
	The returned view gets a ' asRopedText,
	('title' asRopedText glamorousExplanationFor: #title:),
	' to be easily identified and a type.
	There are lots of ' asRopedText,
	('types' asRopedText glamorousExplanationFor: #list),
	' for the views. Next we will take a look at some of them.' asRopedText.
	
	^ text
		glamorousRegularFont;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewColumnedListCodeExample [
	<gtExample>
	| container inspectorContainer subject editor  |
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		background: Color white;
		margin: (BlInsets all: 10);
		look: BrShadowLook.
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	subject := ((GtComputersNetwork>>#gtNetworksComputersViewFor:) gtSourceFor: GtPhlowView empty) 
		asElementDo: [ :e | e ].
	subject forceLayout.
	inspectorContainer addChild: subject.
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #columnedList withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 118 @ 56))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #items withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 83 @ 85))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #columns withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 83 @ 99))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #name withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 148 @ 99))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #columnItems withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 117 @ 111))).
	editor := BrEditor new
		look: BrGlamorousRegularEditorLook;
		text: self viewColumnedListCodeExplanationText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent.
			c linear weight: 0.3 ].
	container addChild: editor.
	container addChild: inspectorContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewColumnedListCodeExplanationText [
	| text |
	text := '
	For the ' asRopedText,
	('columned list' asRopedText glamorousExplanationFor: #columnedList),
	'view, after specifying the ' asRopedText,
	('items' asRopedText glamorousExplanationFor: #items),
	', we can define the ' asRopedText,
	('columns' asRopedText glamorousExplanationFor: #columns),
	' by giving them a ' asRopedText,
	('name' asRopedText glamorousExplanationFor: #name),
	' and the ' asRopedText,
	('items' asRopedText glamorousExplanationFor: #columnItems),
	' each one has.' asRopedText.
	
	^ text
		glamorousRegularFont;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewListCodeExample [
	<gtExample>
	| container inspectorContainer subject editor  |
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		background: Color white;
		margin: (BlInsets all: 10);
		look: BrShadowLook.
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	subject := ((GtComputersNetwork>>#gtNetworksIpsViewFor:) gtSourceFor: GtPhlowView empty) asElementDo: [ :e | e ].
	subject forceLayout.
	inspectorContainer addChild: subject.
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #list withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 118 @ 56))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #items withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 83 @ 85))).
	editor := BrEditor new
		look: BrGlamorousRegularEditorLook;
		text: self viewListCodeExplanationText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent.
			c linear weight: 0.3 ].
	container addChild: editor.
	container addChild: inspectorContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewListCodeExplanationText [
	| text |
	
	text := '
	If we want to make a ' asRopedText,
	('list' asRopedText glamorousExplanationFor: #list),
	' view, besides the title, we need to mention the ' asRopedText,
	('items' asRopedText glamorousExplanationFor: #items),
	'the list will consist of.' asRopedText.
	
	^ text
		glamorousRegularFont;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewMondrianCodeExample [
	<gtExample>
	| container inspectorContainer subject editor  |
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		background: Color white;
		margin: (BlInsets all: 10);
		look: BrShadowLook.
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	subject := ((GtComputersNetwork>>#gtSchematicViewFor:) gtSourceFor: GtPhlowView empty) asElementDo: [ :e | e ].
	subject forceLayout.
	inspectorContainer addChild: subject.
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #mondrian withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 118 @ 56))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #painting withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 83 @ 85))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #nodes withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 115 @ 98))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #nodeShape withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 146 @ 112))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #nodeValues withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 146 @ 168))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #edges withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 115 @ 267))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #edgeShape withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 146 @ 293))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #connection withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 146 @ 336))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #spot withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 146 @ 279))).
	inspectorContainer
		addChild:
			((self buttonLayoutForModelName: #layout withSize: (10 @ 10))
				relocate:
					(inspectorContainer
						globalPointToLocal: (subject localPointToGlobal: 115 @ 363))).
	editor := BrEditor new
		look: BrGlamorousRegularEditorLook;
		text: self viewMondrianCodeExplanationText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent.
			c linear weight: 0.3 ].
	container addChild: editor.
	container addChild: inspectorContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewMondrianCodeExplanationText [
	| text |
	
	text := '
	The ' asRopedText,
	('mondrian' asRopedText glamorousExplanationFor: #mondrian),
	' view has a ' asRopedText,
	('painting' asRopedText glamorousExplanationFor: #painting),
	'message where we specify the following things.
	The ' asRopedText,
	('nodes' asRopedText glamorousExplanationFor: #nodes),
	', to which we give a ' asRopedText,
	('shape' asRopedText glamorousExplanationFor: #nodeShape),
	' and ' asRopedText,
	('values' asRopedText glamorousExplanationFor: #nodeValues),
	'.
	The ' asRopedText,
	('edges' asRopedText glamorousExplanationFor: #edges),
	', to which we give a ' asRopedText,
	('shape' asRopedText glamorousExplanationFor: #edgeShape),
	', the values and how to ' asRopedText,
	('connect' asRopedText glamorousExplanationFor: #connection),
	' them and a ' asRopedText,
	('spot' asRopedText glamorousExplanationFor: #spot),
	' where to connect them to the nodes.
	And finally the ' asRopedText,
	('layout' asRopedText glamorousExplanationFor: #layout),
	' that says how to arrange the nodes on the screen.' asRopedText.
	
	^ text
		glamorousRegularFont;
		foreground: Color black.
]
