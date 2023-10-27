"
An IVRectangleTest is a test class for testing the behavior of IVRectangle
"
Class {
	#name : #IVRectangleTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVRectangleTest >> newObj [

	^ IVRectangle new
]

{ #category : #test }
IVRectangleTest >> testCorner [

	| obj r |
	obj := self newObj.
	obj origin: (IVPoint x: 100 y: 200 z: 300).
	obj width: 10.
	obj height: 20.
	obj plane: #x.
	r := obj corner.
	self assert: r x equals: 101.
	self assert: r y equals: 210.
	self assert: r z equals: 320.
	obj plane: #y.
	r := obj corner.
	self assert: r x equals: 110.
	self assert: r y equals: 201.
	self assert: r z equals: 320.
	obj plane: #z.
	r := obj corner.
	self assert: r x equals: 110.
	self assert: r y equals: 220.
	self assert: r z equals: 301
]

{ #category : #test }
IVRectangleTest >> testExtent [

	| obj r |
	obj := self newObj.
	obj width: 123.
	obj height: 456.
	obj plane: #x.
	r := obj extent.
	self assert: r x equals: 1.
	self assert: r y equals: 123.
	self assert: r z equals: 456.
	obj plane: #y.
	r := obj extent.
	self assert: r x equals: 123.
	self assert: r y equals: 1.
	self assert: r z equals: 456.
	obj plane: #z.
	r := obj extent.
	self assert: r x equals: 123.
	self assert: r y equals: 456.
	self assert: r z equals: 1
]

{ #category : #test }
IVRectangleTest >> testHeight [

	| obj |
	obj := self newObj.
	self assert: obj height isNil.
	obj height: 123.
	self assert: obj height equals: 123.
	obj height: 456.
	self assert: obj height equals: 456
]

{ #category : #test }
IVRectangleTest >> testOrigin [

	| obj p |
	obj := self newObj.
	self assert: obj origin isNil.
	p := IVPoint x: 2 y: 1 z: 3.
	obj origin: p.
	self assert: obj origin identicalTo: p
]

{ #category : #test }
IVRectangleTest >> testRenderSelector [

	self assert: self newObj renderSelector isSymbol
]

{ #category : #test }
IVRectangleTest >> testVertices [

	| obj r |
	obj := self newObj.
	obj origin: (IVPoint x: 100 y: 200 z: 300).
	obj width: 10.
	obj height: 20.
	self should: [ obj vertices ] raise: Error.
	obj plane: #x.
	r := obj vertices.
	self assert: r first x equals: 100.
	self assert: r first y equals: 200.
	self assert: r first z equals: 300.
	self assert: r second x equals: 100.
	self assert: r second y equals: 200.
	self assert: r second z equals: 320.
	self assert: r third x equals: 100.
	self assert: r third y equals: 210.
	self assert: r third z equals: 320.
	self assert: r fourth x equals: 100.
	self assert: r fourth y equals: 210.
	self assert: r fourth z equals: 300.
	obj plane: #y.
	r := obj vertices.
	self assert: r first x equals: 100.
	self assert: r first y equals: 200.
	self assert: r first z equals: 300.
	self assert: r second x equals: 100.
	self assert: r second y equals: 200.
	self assert: r second z equals: 320.
	self assert: r third x equals: 110.
	self assert: r third y equals: 200.
	self assert: r third z equals: 320.
	self assert: r fourth x equals: 110.
	self assert: r fourth y equals: 200.
	self assert: r fourth z equals: 300.
	obj plane: #z.
	r := obj vertices.
	self assert: r first x equals: 100.
	self assert: r first y equals: 200.
	self assert: r first z equals: 300.
	self assert: r second x equals: 100.
	self assert: r second y equals: 220.
	self assert: r second z equals: 300.
	self assert: r third x equals: 110.
	self assert: r third y equals: 220.
	self assert: r third z equals: 300.
	self assert: r fourth x equals: 110.
	self assert: r fourth y equals: 200.
	self assert: r fourth z equals: 300
]

{ #category : #test }
IVRectangleTest >> testWidth [

	| obj |
	obj := self newObj.
	self assert: obj width isNil.
	obj width: 123.
	self assert: obj width equals: 123.
	obj width: 456.
	self assert: obj width equals: 456
]
