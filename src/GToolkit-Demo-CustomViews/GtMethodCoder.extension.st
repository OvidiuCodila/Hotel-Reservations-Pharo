Extension { #name : #GtMethodCoder }

{ #category : #'*GToolkit-Demo-CustomViews' }
GtMethodCoder >> explanationFor: anAST into: coderAddOns [
	<gtAstCoderAddOns: 10>
	coderAddOns removeStylerOfType: GtSourceExplanationLinkStyler.
	self explanationLink notNil
		ifTrue: [ coderAddOns addStyler: self explanationLink ].
]

{ #category : #'*GToolkit-Demo-CustomViews' }
GtMethodCoder >> explanationLink [
	^ self attributeNamed: #explanationLink
]

{ #category : #'*GToolkit-Demo-CustomViews' }
GtMethodCoder >> explanationLink: anExplanation [
	self explanationLink == anExplanation ifTrue: [ ^ self ].
	self attributeNamed: #explanationLink put: anExplanation.
	isBuilt ifFalse: [ ^ self ].
	self updateAddOns.
	self styleText
]
