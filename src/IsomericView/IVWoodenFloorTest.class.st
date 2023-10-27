"
An IVWoodenFloorTest is a test class for testing the behavior of IVWoodenFloor
"
Class {
	#name : #IVWoodenFloorTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVWoodenFloorTest >> newObj [

	^ IVWoodenFloor new
]

{ #category : #test }
IVWoodenFloorTest >> testRenderSelector [

	| obj |
	obj := self newObj.
	self assert: obj renderSelector isSymbol
]

{ #category : #test }
IVWoodenFloorTest >> testTimberColor [

	| obj |
	obj := self newObj.
	self assert: obj timberColor isNil.
	obj timberColor: Color red.
	self assert: obj timberColor equals: Color red.
	obj timberColor: Color black.
	self assert: obj timberColor equals: Color black
]

{ #category : #test }
IVWoodenFloorTest >> testTimberSpace [

	| obj |
	obj := self newObj.
	self assert: obj timberSpace isNil.
	obj timberSpace: 123.
	self assert: obj timberSpace equals: 123.
	obj timberSpace: 456.
	self assert: obj timberSpace equals: 456
]

{ #category : #test }
IVWoodenFloorTest >> testTimberWidth [

	| obj |
	obj := self newObj.
	self assert: obj timberWidth isNil.
	obj timberWidth: 123.
	self assert: obj timberWidth equals: 123.
	obj timberWidth: 456.
	self assert: obj timberWidth equals: 456
]
