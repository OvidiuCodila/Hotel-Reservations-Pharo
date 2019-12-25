Class {
	#name : #GtLinkStyler,
	#superclass : #GtCoderBodyStyler,
	#instVars : [
		'selector'
	],
	#classVars : [
		'CircleAttribute'
	],
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #'instance creation' }
GtLinkStyler class >> forSelector: aSymbol [
	| circleElement attribute |
	
	circleElement := BlElement new
				geometry: BlEllipse new;
				size: 10@10;
				background: Color red;
				look: (GtExplainerTargetLook new explanationModel: aSymbol).
	attribute := BrTextAdornmentDynamicAttribute new
				beReplace;
				stencil: circleElement.
	
	CircleAttribute := {attribute}.
				
	^ self new
		selector: aSymbol;
		yourself.
]

{ #category : #accessing }
GtLinkStyler >> selector [
	^ selector.
]

{ #category : #accessing }
GtLinkStyler >> selector: aSymbol [
	selector := aSymbol.
]

{ #category : #visiting }
GtLinkStyler >> visitArrayNode: aNode [
	super visitArrayNode: aNode.
	aNode value = selector
		ifTrue: [ self styleFrom: (aNode start - 1) to: (aNode start - 1) with: CircleAttribute ]
]

{ #category : #visiting }
GtLinkStyler >> visitLiteralArrayNode: aNode [
	super visitLiteralArrayNode: aNode.
	aNode value = selector
		ifTrue: [ self styleFrom: (aNode start - 1) to: (aNode start - 1) with: CircleAttribute]
]

{ #category : #visiting }
GtLinkStyler >> visitLiteralNode: aNode [
	super visitLiteralNode: aNode.
	aNode value = selector
		ifTrue: [ self styleFrom: (aNode start - 1) to: (aNode start - 1) with: CircleAttribute ]
]

{ #category : #visiting }
GtLinkStyler >> visitMessageNode: aMessageNode [
	super visitMessageNode: aMessageNode.
	aMessageNode selector = selector
		ifTrue: [ aMessageNode selectorParts
				with: aMessageNode keywordsPositions
				do: [ :keyword :position | self styleFrom: (position - 1) to: (position - 1) with: CircleAttribute ] ]
]
