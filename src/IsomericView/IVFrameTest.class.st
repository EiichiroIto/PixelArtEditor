"
An IVFrameTest is a test class for testing the behavior of IVFrame
"
Class {
	#name : #IVFrameTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVFrameTest >> newObj [

	^ IVFrame new
]

{ #category : #test }
IVFrameTest >> testFrameWidth [

	| obj |
	obj := self newObj.
	self assert: obj frameWidth isNil.
	obj frameWidth: 1.
	self assert: obj frameWidth equals: 1.
	obj frameWidth: 2.
	self assert: obj frameWidth equals: 2
]

{ #category : #test }
IVFrameTest >> testRenderSelector [

	self assert: self newObj renderSelector isSymbol
]
