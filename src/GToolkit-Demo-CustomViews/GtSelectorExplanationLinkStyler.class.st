"
I am a copy of class GtLinkStyler. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	selector:		<Object>


    Implementation Points
"
Class {
	#name : #GtSelectorExplanationLinkStyler,
	#superclass : #GtCoderBodyStyler,
	#instVars : [
		'selectorsDictionary'
	],
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #accessing }
GtSelectorExplanationLinkStyler >> addSelector: aSymbol [	
	self addSelector: aSymbol withIdentifier: aSymbol.
]

{ #category : #adding }
GtSelectorExplanationLinkStyler >> addSelector: aSymbol withIdentifier: anIdentifier [
	selectorsDictionary at: aSymbol put: anIdentifier.
]

{ #category : #initialization }
GtSelectorExplanationLinkStyler >> initialize [
	super initialize.
	selectorsDictionary := IdentityDictionary new.
]

{ #category : #accessing }
GtSelectorExplanationLinkStyler >> selectorsAssociations [
	^ selectorsDictionary associations.
]

{ #category : #visiting }
GtSelectorExplanationLinkStyler >> visitLiteralNode: aNode [
	self selectorsAssociations do: [:association |
		super visitLiteralNode: aNode.
		(aNode value = association key) ifTrue:
			[ self styleFrom: (aNode start - 1) to: (aNode start - 1) with: 
				{self yellowCircleAttributeFor: (association value) } ]].
]

{ #category : #visiting }
GtSelectorExplanationLinkStyler >> visitMessageNode: aMessageNode [
	self selectorsAssociations do: [:association |
		super visitMessageNode: aMessageNode.
		aMessageNode selector = association key
			ifTrue:
				[  aMessageNode selectorParts
					with: aMessageNode keywordsPositions
					do: [ :keyword :position | 
						self styleFrom: (position - 1) to: (position - 1) 
							with: {self yellowCircleAttributeFor: (association value) } ]]].
]

{ #category : #visiting }
GtSelectorExplanationLinkStyler >> visitPragmaNode: aNode [
	self selectorsAssociations do: [:association |
		super visitPragmaNode: aNode.
		(aNode selector = association key) ifTrue: 
			[ self styleFrom: (aNode start - 1) to: (aNode start - 1) 
				with: {self yellowCircleAttributeFor: (association value) } ]].
]

{ #category : #utilities }
GtSelectorExplanationLinkStyler >> yellowCircleAttributeFor: aSymbol [
	| circleElement |
	
	circleElement := BlElement new
				geometry: BlEllipse new;
				size: 10@10;
				background: Color red;
				look: (GtExplainerTargetLook new explanationModel: aSymbol).
	^ BrTextAdornmentDynamicAttribute new
				beReplace;
				stencil: circleElement.
]
