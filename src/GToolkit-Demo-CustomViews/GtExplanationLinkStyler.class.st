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
	#name : #GtExplanationLinkStyler,
	#superclass : #GtCoderBodyStyler,
	#instVars : [
		'selectorsDictionary',
		'variablesDictionary'
	],
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #accessing }
GtExplanationLinkStyler >> addSelector: aSymbol [	
	selectorsDictionary at: aSymbol put: {self yellowCircleAttributeFor: aSymbol}.
]

{ #category : #adding }
GtExplanationLinkStyler >> addVariableName: aVariableName [
	variablesDictionary at: (aVariableName asString) put: {self yellowCircleAttributeFor: aVariableName}.
]

{ #category : #initialization }
GtExplanationLinkStyler >> initialize [
	super initialize.
	selectorsDictionary := IdentityDictionary new.
	variablesDictionary := IdentityDictionary new.
]

{ #category : #accessing }
GtExplanationLinkStyler >> selectorsAssociations [
	^ selectorsDictionary associations.
]

{ #category : #accessing }
GtExplanationLinkStyler >> variablesAssociations [
	^ variablesDictionary associations.
]

{ #category : #visiting }
GtExplanationLinkStyler >> visitLiteralNode: aNode [
	self selectorsAssociations do: [:association |
		super visitLiteralNode: aNode.
		(aNode value = association key) ifTrue:
			[ self styleFrom: (aNode start - 1) to: (aNode start - 1) with: association value ]].
]

{ #category : #visiting }
GtExplanationLinkStyler >> visitMessageNode: aMessageNode [
	self selectorsAssociations do: [:association |
		super visitMessageNode: aMessageNode.
		aMessageNode selector = association key
			ifTrue:
				[  aMessageNode selectorParts
					with: aMessageNode keywordsPositions
					do: [ :keyword :position | 
						self styleFrom: (position - 1) to: (position - 1) with: (association value) ]]].
]

{ #category : #visiting }
GtExplanationLinkStyler >> visitPragmaNode: aNode [
	self selectorsAssociations do: [:association |
		super visitPragmaNode: aNode.
		(aNode selector = association key) ifTrue: 
			[ self styleFrom: (aNode start - 1) to: (aNode start - 1) with: association value ]].
]

{ #category : #visiting }
GtExplanationLinkStyler >> visitVariableNode: aVariableNode [
	self variablesAssociations do: [:association |
		super visitVariableNode: aVariableNode.
		(aVariableNode name asString = association key) ifTrue:
			[ self styleFrom: (aVariableNode start - 1) to: (aVariableNode start - 1) with: association value ]].
]

{ #category : #utilities }
GtExplanationLinkStyler >> yellowCircleAttributeFor: aSymbol [
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
