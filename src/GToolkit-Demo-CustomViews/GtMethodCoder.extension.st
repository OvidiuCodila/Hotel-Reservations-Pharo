Extension { #name : #GtMethodCoder }

{ #category : #'*GToolkit-Demo-CustomViews' }
GtMethodCoder >> explanationFor: anAST into: coderAddOns [
	<gtAstCoderAddOns: 10>
	coderAddOns removeStylerOfType: GtSelectorExplanationLinkStyler.
	coderAddOns removeStylerOfType: GtVariableExplanationLinkStyler.
	self selectorsExplanationLink notNil
		ifTrue: [ coderAddOns addStyler: self selectorsExplanationLink ].
	self variablesExplanationLink notNil
		ifTrue: [ coderAddOns addStyler: self variablesExplanationLink ].
]

{ #category : #'*GToolkit-Demo-CustomViews' }
GtMethodCoder >> selectorsExplanationLink [
	^ self attributeNamed: #selectorsExplanationLink
]

{ #category : #'*GToolkit-Demo-CustomViews' }
GtMethodCoder >> selectorsExplanationLink: anExplanation [
	self selectorsExplanationLink == anExplanation ifTrue: [ ^ self ].
	self attributeNamed: #selectorsExplanationLink put: anExplanation.
	isBuilt ifFalse: [ ^ self ].
	self updateAddOns.
	self styleText
]

{ #category : #'*GToolkit-Demo-CustomViews' }
GtMethodCoder >> variablesExplanationLink [
	^ self attributeNamed: #variablesExplanationLink
]

{ #category : #'*GToolkit-Demo-CustomViews' }
GtMethodCoder >> variablesExplanationLink: anExplanation [
	self variablesExplanationLink == anExplanation ifTrue: [ ^ self ].
	self attributeNamed: #variablesExplanationLink put: anExplanation.
	isBuilt ifFalse: [ ^ self ].
	self updateAddOns.
	self styleText
]
