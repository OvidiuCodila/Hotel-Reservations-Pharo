Class {
	#name : #YellowCircleExplanationTextAdornment,
	#superclass : #Object,
	#instVars : [
		'identifier'
	],
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #'as yet unclassified' }
YellowCircleExplanationTextAdornment class >> forIdentifier: anIdentifier [
	| circleElement |
	
	circleElement := BlElement new
				geometry: BlEllipse new;
				size: 10@10;
				background: Color red;
				look: (GtExplainerTargetLook new explanationModel: anIdentifier).
	^ BrTextAdornmentDynamicAttribute new
				beReplace;
				stencil: circleElement.
		
]
