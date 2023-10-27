"
An IVPolyhedronTest is a test class for testing the behavior of IVPolyhedron
"
Class {
	#name : #IVPolyhedronTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVPolyhedronTest >> newObj [

	^ IVPolyhedron new
]

{ #category : #test }
IVPolyhedronTest >> testHeight [

	| obj |
	obj := self newObj.
	self assert: obj height isNil.
	obj height: 123.
	self assert: obj height equals: 123.
	obj height: 456.
	self assert: obj height equals: 456
]

{ #category : #test }
IVPolyhedronTest >> testOrigin [

	| obj |
	obj := self newObj.
	self assert: obj origin isNil.
	obj origin: (IVPoint x: 1 y: 2 z: 3).
	self assert: obj origin x equals: 1.
	self assert: obj origin y equals: 2.
	self assert: obj origin z equals: 3
]

{ #category : #test }
IVPolyhedronTest >> testOtherColors [

	| obj a |
	obj := self newObj.
	self assert: obj otherColors isNil.
	a := {
		     Color red.
		     Color blue }.
	obj otherColors: a.
	self assert: obj otherColors identicalTo: a
]

{ #category : #test }
IVPolyhedronTest >> testPolygon [

	| obj a |
	obj := self newObj.
	self assert: obj polygon isNil.
	a := {
		     (1 @ 2).
		     (2 @ 3).
		     (3 @ 4) }.
	obj polygon: a.
	self assert: obj polygon identicalTo: a
]

{ #category : #test }
IVPolyhedronTest >> testRenderSelector [

	self assert: self newObj renderSelector isSymbol
]

{ #category : #test }
IVPolyhedronTest >> testVisibleVertices [

	| obj a |
	obj := self newObj.
	self assert: obj polygon isNil.
	a := #( 1 2 3 ).
	obj polygon: a.
	self assert: obj polygon identicalTo: a
]
