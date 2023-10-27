"
An IVProjectorTest is a test class for testing the behavior of IVProjector
"
Class {
	#name : #IVProjectorTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVProjectorTest >> newObj [

	^ IVProjector new
]

{ #category : #test }
IVProjectorTest >> testExtent [

	| obj |
	obj := self newObj.
	self assert: obj extent isNil.
	obj extent: 123 @ 456.
	self assert: obj extent equals: 123 @ 456
]
