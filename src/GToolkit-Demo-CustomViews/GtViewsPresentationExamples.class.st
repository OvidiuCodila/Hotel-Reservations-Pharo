"
I am an auxiliary class that contains views examples to be included in the presentation.
"
Class {
	#name : #GtViewsPresentationExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-CustomViews'
}

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
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				geometry: BlCircle new;
				size: 30 @ 30;
				elevation: (BlRelativeElevation elevation: 10);
				look: (GtExplainerTargetLook new explanationModel: #object);
				relocate:
					(inspectorContainer
						globalPointToLocal: (inspectorHeader localPointToGlobal: 10 @ 5))).
	inspectorContainer
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 30 @ 30;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #Raw);
				relocate:
					(inspectorContainer
						globalPointToLocal: (inspectorView localPointToGlobal: 120 @ 5))).
	inspectorContainer
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 30 @ 30;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #Rooms);
				relocate:
					(inspectorContainer
						globalPointToLocal: (inspectorView localPointToGlobal: 70 @ 5))).
	inspectorContainer
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 40 @ 30;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #Tree);
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
	<gtExample>
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
