"
I model a simple computer, defined by its name and ip.
"
Class {
	#name : #GtComputer,
	#superclass : #Object,
	#instVars : [
		'name',
		'ip'
	],
	#category : #'GToolkit-Demo-ComputersNetwork'
}

{ #category : #accessing }
GtComputer >> initialize [
	super initialize.
	name := nil.
	ip := nil.
]

{ #category : #accessing }
GtComputer >> ip [
	^ ip.
]

{ #category : #accessing }
GtComputer >> ip: anIp [
	ip := anIp.
]

{ #category : #accessing }
GtComputer >> name [
	^ name.
]

{ #category : #accessing }
GtComputer >> name: aName [
	name := aName.
]
