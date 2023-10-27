"
An IVMorphTest is a test class for testing the behavior of IVMorph
"
Class {
	#name : #IVMorphTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVMorphTest >> newMorph [

	^ IVMorph new
]

{ #category : #test }
IVMorphTest >> testForm [

	| morph form |
	morph := self newMorph.
	self assert: morph form isNil.
	form := Form extent: 1 @ 1 depth: 32.
	morph form: form.
	self assert: morph form identicalTo: form
]
