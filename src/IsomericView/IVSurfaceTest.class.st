"
An IVSurfaceTest is a test class for testing the behavior of IVSurface
"
Class {
	#name : #IVSurfaceTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVSurfaceTest >> newSurface [

	^ IVSurface new
]

{ #category : #test }
IVSurfaceTest >> testIsDefined [

	| obj |
	obj := self newSurface.
	self deny: obj isDefined.
	obj yMaterial: Color red.
	self deny: obj isDefined.
	obj xMaterial: Color green.
	self deny: obj isDefined.
	obj zMaterial: Color blue.
	self assert: obj isDefined
]

{ #category : #test }
IVSurfaceTest >> testIsDefined2 [

	| obj |
	obj := self newSurface.
	self deny: obj isDefined.
	obj yMaterial: (Form extent: 1 @ 1 depth: 1).
	self deny: obj isDefined.
	obj xMaterial: (Form extent: 1 @ 1 depth: 1).
	self deny: obj isDefined.
	obj zMaterial: (Form extent: 1 @ 1 depth: 1).
	self assert: obj isDefined
]

{ #category : #test }
IVSurfaceTest >> testIsDefinedPlane [

	| obj |
	obj := self newSurface.
	self deny: (obj isDefinedPlane: #x).
	self deny: (obj isDefinedPlane: #y).
	self deny: (obj isDefinedPlane: #z).
	obj xMaterial: Color red.
	self assert: (obj isDefinedPlane: #x).
	self deny: (obj isDefinedPlane: #y).
	self deny: (obj isDefinedPlane: #z).
	obj yMaterial: Color green.
	self assert: (obj isDefinedPlane: #x).
	self assert: (obj isDefinedPlane: #y).
	self deny: (obj isDefinedPlane: #z).
	obj zMaterial: Color blue.
	self assert: (obj isDefinedPlane: #x).
	self assert: (obj isDefinedPlane: #z).
	self assert: (obj isDefinedPlane: #z)
]

{ #category : #test }
IVSurfaceTest >> testIsDefinedPlane2 [

	| obj |
	obj := self newSurface.
	self deny: (obj isDefinedPlane: #x).
	self deny: (obj isDefinedPlane: #y).
	self deny: (obj isDefinedPlane: #z).
	obj xMaterial: (Form extent: 1 @ 1 depth: 1).
	self assert: (obj isDefinedPlane: #x).
	self deny: (obj isDefinedPlane: #y).
	self deny: (obj isDefinedPlane: #z).
	obj yMaterial: (Form extent: 1 @ 1 depth: 1).
	self assert: (obj isDefinedPlane: #x).
	self assert: (obj isDefinedPlane: #y).
	self deny: (obj isDefinedPlane: #z).
	obj zMaterial: (Form extent: 1 @ 1 depth: 1).
	self assert: (obj isDefinedPlane: #x).
	self assert: (obj isDefinedPlane: #y).
	self assert: (obj isDefinedPlane: #z)
]

{ #category : #test }
IVSurfaceTest >> testIsFormSurface [

	self deny: self newSurface isFormSurface
]

{ #category : #test }
IVSurfaceTest >> testIsMaterialSurface [

	self deny: self newSurface isMaterialSurface
]

{ #category : #test }
IVSurfaceTest >> testXMaterial [

	| obj |
	obj := self newSurface.
	self assert: obj yMaterial isNil.
	obj yMaterial: Color red.
	self assert: obj yMaterial equals: Color red.
	self assert: obj xMaterial isNil.
	self assert: obj zMaterial isNil
]

{ #category : #test }
IVSurfaceTest >> testYMaterial [

	| obj |
	obj := self newSurface.
	self assert: obj xMaterial isNil.
	obj xMaterial: Color red.
	self assert: obj xMaterial equals: Color red.
	self assert: obj yMaterial isNil.
	self assert: obj zMaterial isNil
]

{ #category : #test }
IVSurfaceTest >> testZMaterial [

	| obj |
	obj := self newSurface.
	self assert: obj zMaterial isNil.
	obj zMaterial: Color red.
	self assert: obj zMaterial equals: Color red.
	self assert: obj yMaterial isNil.
	self assert: obj xMaterial isNil
]
