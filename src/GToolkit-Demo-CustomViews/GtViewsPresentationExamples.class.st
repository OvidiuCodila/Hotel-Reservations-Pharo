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
	| container inspectorContainer subject editor coder stylersList selectors variables |
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
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelector: #title:.
	selectors addSelector: #gtView.
	selectors addSelector: #list.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariableName: 'aView'.
	
	stylersList := OrderedCollection new.
	stylersList add: selectors.
	stylersList add: variables.
	
	coder := GtMethodCoder forMethod: GtComputersNetwork>>#gtNetworksIpsViewFor:.
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: stylersList).
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
	| container inspectorContainer subject editor coder selectorStyler variableStyler |
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
	
	selectorStyler := GtSelectorExplanationLinkStyler new.
	selectorStyler addSelector: #gtView.
	selectorStyler addSelector: #title: withIdentifier: #title.
	selectorStyler addSelector: #list.
	
	variableStyler := GtVariableExplanationLinkStyler new.
	variableStyler addVariableName: 'aView'.
	
	coder := GtMethodCoder forMethod: (GtComputersNetwork>>#gtNetworksIpsViewFor:).
	coder selectorsExplanationLink: selectorStyler.
	coder variablesExplanationLink: variableStyler.
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
GtViewsPresentationExamples >> viewCodeExplanationText [
	| text |
	text := '
	
	Every method gets a ' asRopedText,
	('view' asRopedText glamorousExplanationFor: 'aView'),
	' object as a parameter and returns a view object.
	At the same time, all methods start with the ' asRopedText,
	('gtView' asRopedText glamorousExplanationFor: #gtView),
	'pragma.
	The returned view gets a ' asRopedText,
	('title' asRopedText glamorousExplanationFor: #title),
	' for easy identification amongst other views and a ' asRopedText,
	('type' asRopedText glamorousExplanationFor: #list),
	'.
	There are lots of types for the views. So lets take a look at some of them.' asRopedText.
	
	^ text
		glamorousRegularFont;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewColumnedListCodeExample [
	<gtExample>
	| container inspectorContainer subject editor coder selectorStyler |
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
	
	selectorStyler := GtSelectorExplanationLinkStyler new.
	selectorStyler addSelector: #columnedList withIdentifier: #type.
	selectorStyler addSelector: #items: withIdentifier: #items.
	selectorStyler addSelector: #column:item:.
	selectorStyler addSelector: 'Name'.
	
	coder := GtMethodCoder forMethod: (GtComputersNetwork>>#gtNetworksComputersViewFor:).
	coder selectorsExplanationLink: selectorStyler.
	subject := (coder expanded: true) asElement.
	subject forceLayout.
	
	inspectorContainer addChild: subject.
	
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
	('columned list' asRopedText glamorousExplanationFor: #type),
	'view, after the title, we specify what ' asRopedText,
	('items' asRopedText glamorousExplanationFor: #items),
	' to use. 
	Then we define each ' asRopedText,
	('column' asRopedText glamorousExplanationFor: #column:),
	' by giving it a ' asRopedText,
	('name' asRopedText glamorousExplanationFor: 'Name'),
	' and the ' asRopedText,
	('items' asRopedText glamorousExplanationFor: #item:),
	' it has.' asRopedText.
	
	^ text
		glamorousRegularFont;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtViewsPresentationExamples >> viewListCodeExample [
	<gtExample>
	| container inspectorContainer subject editor coder selectorStyler |
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
	
	selectorStyler := GtSelectorExplanationLinkStyler new.
	selectorStyler addSelector: #list withIdentifier: #type.
	selectorStyler addSelector: #items: withIdentifier: #items.
	
	coder := GtMethodCoder forMethod: (GtComputersNetwork>>#gtNetworksIpsViewFor:).
	coder selectorsExplanationLink: selectorStyler.
	subject := (coder expanded: true) asElement.
	subject forceLayout.
	
	inspectorContainer addChild: subject.
	
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
	('list' asRopedText glamorousExplanationFor: #type),
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
	| container inspectorContainer subject editor coder selectorStyler |
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
	
	selectorStyler := GtSelectorExplanationLinkStyler new.
	selectorStyler addSelector: #mondrian.
	selectorStyler addSelector: #painting: withIdentifier: #painting.
	selectorStyler addSelector: #nodes.
	selectorStyler addSelector: #shape: withIdentifier: #shape.
	selectorStyler addSelector: #with: withIdentifier: #with.
	selectorStyler addSelector: #edges.
	selectorStyler addSelector: #connect:from:toAll: withIdentifier: #connect.
	selectorStyler addSelector: #layout.
	selectorStyler addSelector: #fromCenterBottom withIdentifier: #from.
	selectorStyler addSelector: #toCenterTop withIdentifier: #to.
	
	coder := GtMethodCoder forMethod: (GtComputersNetwork>>#gtSchematicViewFor:).
	coder selectorsExplanationLink: selectorStyler.
	subject := (coder expanded: true) asElement.
	subject forceLayout.
	
	inspectorContainer addChild: subject.
	
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
	'message that gets a block as a parameter. In that block we define the follwing things.
	The ' asRopedText,
	('nodes' asRopedText glamorousExplanationFor: #nodes),
	', by giving them a ' asRopedText,
	('shape' asRopedText glamorousExplanationFor: #shape),
	' and a list of ' asRopedText,
	('values' asRopedText glamorousExplanationFor: #with),
	'.
	The ' asRopedText,
	('edges' asRopedText glamorousExplanationFor: #edges),
	', by giving them a shape, the values to ' asRopedText,
	('connect' asRopedText glamorousExplanationFor: #connect),
	' and how and ' asRopedText,
	('from' asRopedText glamorousExplanationFor: #from),
	' where ' asRopedText,
	('to' asRopedText glamorousExplanationFor: #to),
	' where to draw the connecting lines.
	Finally, we give a ' asRopedText,
	('layout' asRopedText glamorousExplanationFor: #layout),
	' that says how the nodes are arranged.' asRopedText.
	
	^ text
		glamorousRegularFont;
		foreground: Color black.
]
