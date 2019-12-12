"
I model a simple computer, defined by its name and ip.
"
Class {
	#name : #Computer,
	#superclass : #Object,
	#instVars : [
		'name',
		'ip'
	],
	#category : #'GToolkit-Demo-ComputersNetwork'
}

{ #category : #accessing }
Computer >> ip [
	^ ip.
]

{ #category : #accessing }
Computer >> ip: anIp [
	ip := anIp.
]

{ #category : #accessing }
Computer >> name [
	^ name.
]

{ #category : #accessing }
Computer >> name: aName [
	name := aName.
]
