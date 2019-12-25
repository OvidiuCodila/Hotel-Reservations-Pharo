Class {
	#name : #GtSourceLinkStyler,
	#superclass : #GtCoderBodyStyler,
	#classVars : [
		'CircleAttribute'
	],
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #'class initialization' }
GtSourceLinkStyler class >> initialize [
	CircleAttribute := {(BlTextUnderlineAttribute new
		paint: BrGlamorousColors textHighlightColor;
		width: 3)}.
]
