"
An IVCylinderTest is a test class for testing the behavior of IVCylinder
"
Class {
	#name : #IVCylinderTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVCylinderTest >> newObj [

	^ IVCylinder new
]

{ #category : #test }
IVCylinderTest >> testBottomRadius [

	| obj |
	obj := self newObj.
	self assert: obj bottomRadius isNil.
	obj plane: #x.
	obj center: (IVPoint x: 10 y: 20 z: 30).
	obj radius: 123.
	self assert: obj bottomRadius equals: 123.
	obj bottomRadius: 456.
	self assert: obj bottomRadius equals: 456.
	self assert: obj radius equals: 123
]

{ #category : #test }
IVCylinderTest >> testCenter [

	| obj r |
	obj := self newObj.
	self assert: obj center isNil.
	obj center: (IVPoint x: 1 y: 2 z: 3).
	r := obj center.
	self assert: r x equals: 1.
	self assert: r y equals: 2.
	self assert: r z equals: 3
]

{ #category : #test }
IVCylinderTest >> testHeight [

	| obj |
	obj := self newObj.
	self assert: obj height isNil.
	obj height: 123.
	self assert: obj height equals: 123.
	obj height: 456.
	self assert: obj height equals: 456
]

{ #category : #test }
IVCylinderTest >> testOrigin [

	| obj r |
	obj := self newObj.
	self assert: obj origin isNil.
	obj origin: (IVPoint x: 1 y: 2 z: 3).
	r := obj origin.
	self assert: r x equals: 1.
	self assert: r y equals: 2.
	self assert: r z equals: 3
]

{ #category : #test }
IVCylinderTest >> testRadius [

	| obj |
	obj := self newObj.
	self assert: obj radius isNil.
	obj plane: #x.
	obj center: (IVPoint x: 10 y: 20 z: 30).
	obj radius: 123.
	self assert: obj radius equals: 123.
	obj radius: 456.
	self assert: obj radius equals: 456
]

{ #category : #test }
IVCylinderTest >> testRenderSelector [

	self assert: self newObj renderSelector isSymbol
]
