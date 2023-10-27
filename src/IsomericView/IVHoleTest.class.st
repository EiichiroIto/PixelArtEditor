"
An IVHoleTest is a test class for testing the behavior of IVHole
"
Class {
	#name : #IVHoleTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #'instance creation' }
IVHoleTest >> newObj [

	^ IVHole new
]

{ #category : #test }
IVHoleTest >> testRenderSelector [

	self assert: self newObj renderSelector isSymbol
]
