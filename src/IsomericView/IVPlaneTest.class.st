"
An IVPlaneTest is a test class for testing the behavior of IVPlane
"
Class {
	#name : #IVPlaneTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVPlaneTest >> newObj [

	^ IVPlane new
]

{ #category : #test }
IVPlaneTest >> testHasSurface [

	self assert: self newObj hasSurface
]

{ #category : #test }
IVPlaneTest >> testIsSurfaceDefined [

	self deny: self newObj isSurfaceDefined
]

{ #category : #test }
IVPlaneTest >> testOnXPlane [

	| obj |
	obj := self newObj.
	self deny: obj onXPlane.
	obj plane: #x.
	self assert: obj onXPlane
]

{ #category : #test }
IVPlaneTest >> testOnYPlane [

	| obj |
	obj := self newObj.
	self deny: obj onYPlane.
	obj plane: #y.
	self assert: obj onYPlane
]

{ #category : #test }
IVPlaneTest >> testOnZPlane [

	| obj |
	obj := self newObj.
	self deny: obj onZPlane.
	obj plane: #z.
	self assert: obj onZPlane
]

{ #category : #test }
IVPlaneTest >> testOrigin [

	| obj |
	obj := self newObj.
	self assert: obj origin isNil.
	obj origin: (IVPoint x: 10 y: 20 z: 30).
	self assert: obj origin x equals: 10.
	self assert: obj origin y equals: 20.
	self assert: obj origin z equals: 30.
	obj origin: (IVPoint x: 100 y: 200 z: 300).
	self assert: obj origin x equals: 100.
	self assert: obj origin y equals: 200.
	self assert: obj origin z equals: 300
]

{ #category : #test }
IVPlaneTest >> testPlane [

	| obj |
	obj := self newObj.
	self assert: obj plane isNil.
	obj plane: #x.
	self assert: obj plane equals: #x.
	obj plane: #y.
	self assert: obj plane equals: #y.
	obj plane: #z.
	self assert: obj plane equals: #z
]

{ #category : #test }
IVPlaneTest >> testTopMaterial [

	| obj |
	obj := self newObj.
	self assert: obj topMaterial isNil.
	obj topMaterial: Color red.
	self assert: obj topMaterial equals: Color red.
	obj topMaterial: Color blue.
	self assert: obj topMaterial equals: Color blue
]
