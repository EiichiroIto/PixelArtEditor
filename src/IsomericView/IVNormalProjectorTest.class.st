"
An IVNormalProjectorTest is a test class for testing the behavior of IVNormalProjector
"
Class {
	#name : #IVNormalProjectorTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVNormalProjectorTest >> newObj [

	^ IVNormalProjector new
]

{ #category : #test }
IVNormalProjectorTest >> testAxisAngle [

	self assert: self newObj axisAngle equals: 30
]

{ #category : #test }
IVNormalProjectorTest >> testCosValue [

	| obj |
	obj := self newObj.
	self
		assert: obj cosValue
		closeTo: 0.8660254037844386
		precision: 0.001.
	self
		assert: obj cosValue
		closeTo: obj axisAngle degreeCos
		precision: 0.001
]

{ #category : #test }
IVNormalProjectorTest >> testCosValue2 [

	| obj |
	obj := self newObj.
	self
		assert: obj cosValue2
		closeTo: 0.8660254037844386
		precision: 0.001.
	self
		assert: obj cosValue2
		closeTo: (90 - (obj axisAngle * 2)) degreeCos
		precision: 0.001
]

{ #category : #test }
IVNormalProjectorTest >> testIvPointToPoint [

	| obj a b |
	obj := self newObj.
	obj extent: 240 @ 240.
	a := IVPoint x: 0 y: 0 z: 0.
	b := obj ivPointToPoint: a.
	self assert: b x equals: 120.
	self assert: b y equals: 240.
	a := IVPoint x: 0 y: 120 z: 0.
	b := obj ivPointToPoint: a.
	self assert: b x closeTo: 120 - 104 precision: 0.1.
	self assert: b y closeTo: 240 - 60 precision: 0.1.
	a := IVPoint x: 120 y: 120 z: 0.
	b := obj ivPointToPoint: a.
	self assert: b x closeTo: 120 precision: 0.1.
	self assert: b y closeTo: 240 - 120 precision: 0.1.
	a := IVPoint x: 120 y: 120 z: 50.
	b := obj ivPointToPoint: a.
	self assert: b x closeTo: 120 precision: 0.1.
	self assert: b y closeTo: 240 - 120 - 50 precision: 0.1
]

{ #category : #test }
IVNormalProjectorTest >> testSinValue [

	self assert: self newObj sinValue closeTo: 0.5 precision: 0.001
]

{ #category : #test }
IVNormalProjectorTest >> testTanValue [

	| obj |
	obj := self newObj.
	self
		assert: obj tanValue
		closeTo: 0.5773502691896258
		precision: 0.0001.
	self
		assert: obj tanValue
		closeTo: obj axisAngle degreesToRadians tan
		precision: 0.0001
]

{ #category : #test }
IVNormalProjectorTest >> testTanValue2 [

	| obj |
	obj := self newObj.
	self
		assert: obj tanValue2
		closeTo: 0.5773502691896258
		precision: 0.0001.
	self
		assert: obj tanValue2
		closeTo: (90 - (obj axisAngle * 2)) degreesToRadians tan
		precision: 0.0001
]
