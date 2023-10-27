"
An IVBoxTest is a test class for testing the behavior of IVBox
"
Class {
	#name : #IVBoxTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVBoxTest >> newObj [

	^ IVBox new
]

{ #category : #private }
IVBoxTest >> newPoint [

	^ IVPoint new
]

{ #category : #test }
IVBoxTest >> testCorner [

	| obj |
	obj := self newObj.
	self should: [ obj corner ] raise: Error.
	obj origin: (IVPoint x: 1 y: 2 z: 3).
	obj corner: (IVPoint x: 4 y: 5 z: 6).
	self assert: obj origin x equals: 1.
	self assert: obj origin y equals: 2.
	self assert: obj origin z equals: 3.
	self assert: obj corner x equals: 4.
	self assert: obj corner y equals: 5.
	self assert: obj corner z equals: 6
]

{ #category : #test }
IVBoxTest >> testExtent [

	| obj p1 p2 r |
	obj := self newObj.
	p1 := IVPoint x: 1 y: 2 z: 3.
	obj origin: p1.
	p2 := IVPoint x: 4 y: 6 z: 8.
	obj corner: p2.
	r := obj extent.
	self assert: r x equals: 4 - 1.
	self assert: r y equals: 6 - 2.
	self assert: r z equals: 8 - 3.
	obj := self newObj.
	p1 := IVPoint x: 1 y: 2 z: 3.
	obj origin: p1.
	p2 := IVPoint x: 4 y: 6 z: 8.
	obj extent: p2.
	r := obj extent.
	self assert: r x equals: 4.
	self assert: r y equals: 6.
	self assert: r z equals: 8
]

{ #category : #test }
IVBoxTest >> testHasSurface [

	| obj |
	obj := self newObj.
	self assert: obj hasSurface.
	obj surface: nil.
	self deny: obj hasSurface
]

{ #category : #test }
IVBoxTest >> testIsSurfaceDefained [

	| obj surface |
	obj := self newObj.
	self deny: obj isSurfaceDefined.
	surface := IVSurface new.
	obj surface: surface.
	self deny: obj isSurfaceDefined.
	surface yMaterial: Color red.
	surface xMaterial: Color green.
	surface zMaterial: Color blue.
	self assert: obj isSurfaceDefined
]

{ #category : #test }
IVBoxTest >> testIsSurfaceDefined [

	| obj |
	obj := self newObj.
	self deny: obj isSurfaceDefined.
	obj surface xMaterial: Color red.
	self deny: obj isSurfaceDefined.
	obj surface yMaterial: Color red.
	self deny: obj isSurfaceDefined.
	obj surface zMaterial: Color red.
	self assert: obj isSurfaceDefined
]

{ #category : #test }
IVBoxTest >> testOnXPlane [

	| obj |
	obj := self newObj.
	obj origin: (IVPoint x: 0 y: 0 z: 0).
	self should: [ obj onXPlane ] raise: Error.
	obj extent: (IVPoint x: 1 y: 2 z: 3).
	self assert: obj onXPlane.
	obj extent: (IVPoint x: 2 y: 1 z: 3).
	self deny: obj onXPlane.
	obj extent: (IVPoint x: 2 y: 3 z: 1).
	self deny: obj onXPlane
]

{ #category : #test }
IVBoxTest >> testOnYPlane [

	| obj |
	obj := self newObj.
	obj origin: (IVPoint x: 0 y: 0 z: 0).
	self should: [ obj onYPlane ] raise: Error.
	obj extent: (IVPoint x: 1 y: 2 z: 3).
	self deny: obj onYPlane.
	obj extent: (IVPoint x: 2 y: 1 z: 3).
	self assert: obj onYPlane.
	obj extent: (IVPoint x: 2 y: 3 z: 1).
	self deny: obj onYPlane
]

{ #category : #test }
IVBoxTest >> testOnZPlane [

	| obj |
	obj := self newObj.
	obj origin: (IVPoint x: 0 y: 0 z: 0).
	self should: [ obj onZPlane ] raise: Error.
	obj extent: (IVPoint x: 2 y: 1 z: 3).
	self deny: obj onZPlane.
	obj extent: (IVPoint x: 1 y: 2 z: 3).
	self deny: obj onZPlane.
	obj extent: (IVPoint x: 2 y: 3 z: 1).
	self assert: obj onZPlane
]

{ #category : #test }
IVBoxTest >> testPrintOn [

	| obj p1 p2 s |
	obj := self newObj.
	s := WriteStream on: String new.
	obj printOn: s.
	self assert: s contents equals: 'IVBox[origin=(nil),extent=(nil)]'.

	obj := self newObj.
	obj label: 'abc'.
	p1 := IVPoint x: 1 y: 2 z: 3.
	obj origin: p1.
	p2 := IVPoint x: 4 y: 6 z: 8.
	obj corner: p2.

	s := WriteStream on: String new.
	obj printOn: s.
	self assert: s contents equals: 'IVBox["abc",origin=(1,2,3),extent=(3,4,5)]'
]

{ #category : #test }
IVBoxTest >> testRenderSelector [

	self assert: self newObj renderSelector isSymbol
]

{ #category : #test }
IVBoxTest >> testSurface [

	| obj surface |
	obj := self newObj.
	self assert: (obj surface isKindOf: IVSurface).
	surface := IVSurface new.
	obj surface: surface.
	self assert: obj surface identicalTo: surface
]

{ #category : #test }
IVBoxTest >> testVertices [

	| obj r |
	obj := IVBox new.
	self should: [ obj vertices ] raise: Error.
	obj origin: (IVPoint x: 1 y: 2 z: 3).
	obj corner: (IVPoint x: 10 y: 20 z: 30).
	r := obj vertices.
	self assert: r isArray.
	self assert: r size equals: 8.
	r do: [ :each | self assert: (each isKindOf: IVPoint) ]
]

{ #category : #test }
IVBoxTest >> testXMaterial [

	| obj |
	obj := self newObj.
	self assert: obj xMaterial isNil.
	obj surface xMaterial: Color red.
	self assert: obj xMaterial equals: Color red
]

{ #category : #test }
IVBoxTest >> testYMaterial [

	| obj |
	obj := self newObj.
	self assert: obj yMaterial isNil.
	obj surface yMaterial: Color red.
	self assert: obj yMaterial equals: Color red
]

{ #category : #test }
IVBoxTest >> testZMaterial [

	| obj |
	obj := self newObj.
	self assert: obj zMaterial isNil.
	obj surface zMaterial: Color red.
	self assert: obj zMaterial equals: Color red
]
