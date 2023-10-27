"
An IVImageTest is a test class for testing the behavior of IVImage
"
Class {
	#name : #IVImageTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVImageTest >> newObj [

	^ IVImage new
]

{ #category : #test }
IVImageTest >> testExtent [

	| obj r |
	obj := self newObj.
	r := obj extent.
	self assert: r isZero.
	obj form: (Form extent: 5 @ 6 depth: 32).
	r := obj extent.
	self assert: r x equals: 5.
	self assert: r y equals: 6.
	self assert: r z equals: 0
]

{ #category : #test }
IVImageTest >> testHasSurface [

	self deny: self newObj hasSurface
]

{ #category : #test }
IVImageTest >> testIsImage [

	self assert: self newObj isImage
]

{ #category : #test }
IVImageTest >> testOrigin [

	| obj p |
	obj := self newObj.
	self assert: obj origin isNil.
	p := IVPoint x: 2 y: 1 z: 3.
	obj origin: p.
	self assert: obj origin identicalTo: p
]

{ #category : #test }
IVImageTest >> testRenderSelector [

	self assert: self newObj renderSelector isSymbol
]
