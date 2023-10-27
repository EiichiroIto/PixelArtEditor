"
An IVXCircleTest is a test class for testing the behavior of IVXCircle
"
Class {
	#name : #IVCircleTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVCircleTest >> newObj [

	^ IVCircle new
]

{ #category : #test }
IVCircleTest >> testCenter [

	| obj |
	obj := self newObj.
	self assert: obj center isNil.
	obj center: (IVPoint x: 1 y: 2 z: 3).
	self assert: obj center x equals: 1.
	self assert: obj center y equals: 2.
	self assert: obj center z equals: 3.
	obj plane: #x.
	obj radius: 5.
	self assert: obj center x equals: 1.
	self assert: obj center y equals: 2.
	self assert: obj center z equals: 3.
	obj plane: #y.
	obj center: (IVPoint x: 1 y: 2 z: 3).
	self assert: obj center x equals: 1.
	self assert: obj center y equals: 2.
	self assert: obj center z equals: 3.
	obj plane: #z.
	obj center: (IVPoint x: 1 y: 2 z: 3).
	self assert: obj center x equals: 1.
	self assert: obj center y equals: 2.
	self assert: obj center z equals: 3
]

{ #category : #test }
IVCircleTest >> testCorner [

	| obj r |
	obj := self newObj.
	obj plane: #x.
	obj center: (IVPoint x: 10 y: 20 z: 30).
	obj radius: 5.
	r := obj corner.
	self assert: r x equals: 10.
	self assert: r y equals: 25.
	self assert: r z equals: 35.
	obj plane: #y.
	obj center: (IVPoint x: 10 y: 20 z: 30).
	obj radius: 5.
	r := obj corner.
	self assert: r x equals: 15.
	self assert: r y equals: 20.
	self assert: r z equals: 35.
	obj plane: #z.
	obj center: (IVPoint x: 10 y: 20 z: 30).
	obj radius: 5.
	r := obj corner.
	self assert: r x equals: 15.
	self assert: r y equals: 25.
	self assert: r z equals: 30
]

{ #category : #test }
IVCircleTest >> testExtent [

	| obj r |
	obj := self newObj.
	obj plane: #x.
	obj origin: (IVPoint x: 1 y: 2 z: 3).
	obj radius: 123.
	r := obj extent.
	self assert: r x equals: 0.
	self assert: r y equals: 246.
	self assert: r z equals: 246.
	obj := self newObj.
	obj plane: #y.
	obj origin: (IVPoint x: 1 y: 2 z: 3).
	obj radius: 123.
	r := obj extent.
	self assert: r x equals: 246.
	self assert: r y equals: 0.
	self assert: r z equals: 246.
	obj := self newObj.
	obj plane: #z.
	obj origin: (IVPoint x: 1 y: 2 z: 3).
	obj radius: 123.
	r := obj extent.
	self assert: r x equals: 246.
	self assert: r y equals: 246.
	self assert: r z equals: 0
]

{ #category : #test }
IVCircleTest >> testIsSurfaceDefained [

	| obj |
	obj := self newObj.
	obj plane: #z.
	self deny: obj isSurfaceDefined.
	obj topMaterial: Color red.
	self assert: obj isSurfaceDefined
]

{ #category : #test }
IVCircleTest >> testOrigin [

	| obj r |
	obj := self newObj.
	obj plane: #x.
	obj center: (IVPoint x: 10 y: 20 z: 30).
	obj radius: 3.
	r := obj origin.
	self assert: r x equals: 10.
	self assert: r y equals: 17.
	self assert: r z equals: 27.
	obj origin: (IVPoint x: 10 y: 20 z: 30).
	self assert: obj radius equals: 3.
	r := obj center.
	self assert: r x equals: 10.
	self assert: r y equals: 23.
	self assert: r z equals: 33.
	obj := self newObj.
	obj plane: #y.
	obj center: (IVPoint x: 10 y: 20 z: 30).
	obj radius: 3.
	r := obj origin.
	self assert: r x equals: 7.
	self assert: r y equals: 20.
	self assert: r z equals: 27.
	obj origin: (IVPoint x: 10 y: 20 z: 30).
	self assert: obj radius equals: 3.
	r := obj center.
	self assert: r x equals: 13.
	self assert: r y equals: 20.
	self assert: r z equals: 33.
	obj := self newObj.
	obj plane: #z.
	obj center: (IVPoint x: 10 y: 20 z: 30).
	obj radius: 3.
	r := obj origin.
	self assert: r x equals: 7.
	self assert: r y equals: 17.
	self assert: r z equals: 30.
	obj origin: (IVPoint x: 10 y: 20 z: 30).
	self assert: obj radius equals: 3.
	r := obj center.
	self assert: r x equals: 13.
	self assert: r y equals: 23.
	self assert: r z equals: 30
]

{ #category : #test }
IVCircleTest >> testRadius [

	| obj r |
	#( x y z ) do: [ :each |
		obj := self newObj.
		obj plane: each.
		obj center: (IVPoint x: 10 y: 20 z: 30).
		obj radius: 10.
		r := obj center.
		self assert: r x equals: 10.
		self assert: r y equals: 20.
		self assert: r z equals: 30.
		self assert: obj radius equals: 10 ]
]

{ #category : #test }
IVCircleTest >> testRenderSelector [

	| obj |
	obj := self newObj.
	self assert: obj renderSelector isSymbol
]

{ #category : #test }
IVCircleTest >> testSetRadius [

	| obj r |
	obj := self newObj.
	obj origin: (IVPoint x: 10 y: 20 z: 30).
	obj setRadius: 10.
	r := obj origin.
	self assert: r x equals: 10.
	self assert: r y equals: 20.
	self assert: r z equals: 30.
	self assert: obj radius equals: 10
]
