Class {
	#name : #GtComputersNetworkExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-ComputersNetwork'
}

{ #category : #'as yet unclassified' }
GtComputersNetworkExamples >> computerWithNameAndIp [
	<gtExample>
	| computer |
	
	computer := GtComputer new
		name: 'Asus' asRopedText;
		ip: '192.168.0.104' asRopedText.
		
	self assert: (computer name isNotNil).
	self assert: (computer ip isNotNil).
	
	^ computer.
]

{ #category : #'as yet unclassified' }
GtComputersNetworkExamples >> emptyNetwork [
	<gtExample>
	
	| network |
	network := GtComputersNetwork new
		name: 'Network1'.
		
	self assert: network computers isEmpty.
	
	^ network.
]

{ #category : #'as yet unclassified' }
GtComputersNetworkExamples >> networkWithOneComputer [
	<gtExample>

	| network computer |
	computer := self computerWithNameAndIp.
	network := self emptyNetwork.
	network addComputer: computer.
	
	self assert: network computers size equals: 1.
	
	^ network.
]

{ #category : #'as yet unclassified' }
GtComputersNetworkExamples >> networkWithThreeComputers [
	<gtExample>
	
	|network thirdComputer|
	thirdComputer := GtComputer new
		name: 'Lenovo' asRopedText;
		ip: '192.168.0.102' asRopedText.
	network := self networkWithTwoComputers.
	network addComputer: thirdComputer.
	
	self assert: network computers size equals: 3.
	
	^ network.
]

{ #category : #'as yet unclassified' }
GtComputersNetworkExamples >> networkWithTwoComputers [
	<gtExample>
	
	|network secondComputer|
	secondComputer := GtComputer new
		name: 'Hp' asRopedText;
		ip: '192.168.0.103' asRopedText.
	network := self networkWithOneComputer.
	network addComputer: secondComputer.
	
	self assert: network computers size equals: 2.
	
	^ network.
]
