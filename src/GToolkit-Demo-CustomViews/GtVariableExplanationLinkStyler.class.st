Class {
	#name : #GtVariableExplanationLinkStyler,
	#superclass : #GtCoderBodyStyler,
	#instVars : [
		'variablesDictionary'
	],
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #adding }
GtVariableExplanationLinkStyler >> addVariableName: aVariableName [
	self addVariableName: aVariableName withIdentifier: aVariableName.
]

{ #category : #adding }
GtVariableExplanationLinkStyler >> addVariableName: aVariableName withIdentifier: anIdentifier [
	variablesDictionary at: aVariableName put: anIdentifier.
]

{ #category : #initialization }
GtVariableExplanationLinkStyler >> initialize [
	super initialize.
	variablesDictionary := IdentityDictionary new.
]

{ #category : #accessing }
GtVariableExplanationLinkStyler >> variablesAssociations [
	^ variablesDictionary associations.
]

{ #category : #visiting }
GtVariableExplanationLinkStyler >> visitVariableNode: aVariableNode [
	self variablesAssociations do: [:association |
		super visitVariableNode: aVariableNode.
		(aVariableNode name asString = association key) ifTrue:
			[ self styleFrom: (aVariableNode start - 1) to: (aVariableNode start - 1) 
				with: { self yellowCircleAttributeFor: (association value) } ]].
]

{ #category : #utilities }
GtVariableExplanationLinkStyler >> yellowCircleAttributeFor: aSymbol [
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
