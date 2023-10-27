"
An IVPixelartProjectorTest is a test class for testing the behavior of IVPixelartProjector
"
Class {
	#name : #IVPixelartProjectorTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVPixelartProjectorTest >> newObj [

	^ IVPixelartProjector new
]

{ #category : #test }
IVPixelartProjectorTest >> testAxisAngle [

	self
		assert: self newObj axisAngle
		closeTo: 0.5 arcTan radiansToDegrees
		precision: 0.0001
]

{ #category : #test }
IVPixelartProjectorTest >> testCosValue [

	| obj |
	obj := self newObj.
	self
		assert: obj cosValue
		closeTo: 0.8944271909999159
		precision: 0.0001.
	self
		assert: obj cosValue
		closeTo: obj axisAngle degreeCos
		precision: 0.001

]

{ #category : #test }
IVPixelartProjectorTest >> testCosValue2 [

	| obj |
	obj := self newObj.
	self
		assert: obj cosValue2
		closeTo: 0.8
		precision: 0.0001.
	self
		assert: obj cosValue2
		closeTo: (90 - (obj axisAngle * 2)) degreeCos
		precision: 0.001
]

{ #category : #test }
IVPixelartProjectorTest >> testSinValue [

	self
		assert: self newObj sinValue
		closeTo: 0.4472135954999579
		precision: 0.0001
]

{ #category : #test }
IVPixelartProjectorTest >> testTanValue [

	| obj |
	obj := self newObj.
	self assert: obj tanValue closeTo: 0.5 precision: 0.0001.
	self
		assert: obj tanValue
		closeTo: obj axisAngle degreesToRadians tan
		precision: 0.0001
]

{ #category : #test }
IVPixelartProjectorTest >> testTanValue2 [

	| obj |
	obj := self newObj.
	self assert: obj tanValue2 closeTo: 0.75 precision: 0.0001.
	self
		assert: obj tanValue2
		closeTo: (90 - (obj axisAngle * 2)) degreesToRadians tan
		precision: 0.0001
]
