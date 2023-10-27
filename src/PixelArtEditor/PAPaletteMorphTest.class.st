"
A PAPaletteMorphTest is a test class for testing the behavior of PAPaletteMorph
"
Class {
	#name : #PAPaletteMorphTest,
	#superclass : #TestCase,
	#category : #'PixelArtEditor-Tests'
}

{ #category : #'instance creation' }
PAPaletteMorphTest >> newMorph [

	^ PAPaletteMorph new
]

{ #category : #test }
PAPaletteMorphTest >> testColorAt [

	| morph form |
	morph := self newMorph.
	form := Form extent: 10 @ 10 depth: 32.
	morph form: form.
	self assert: (morph colorAt: 0 @ 0) equals: Color transparent.
	self assert: (morph colorAt: 1 @ 1) equals: Color transparent.
	self assert: (morph colorAt: 2 @ 2) equals: Color transparent.
	morph colorAt: 0 @ 0 put: Color red.
	morph colorAt: 1 @ 1 put: Color green.
	morph colorAt: 2 @ 2 put: Color blue.
	self assert: (morph colorAt: 0 @ 0) equals: Color red.
	self assert: (morph colorAt: 1 @ 1) equals: Color green.
	self assert: (morph colorAt: 2 @ 2) equals: Color blue
]

{ #category : #test }
PAPaletteMorphTest >> testColorAtPut [

	| morph form |
	morph := self newMorph.
	form := Form extent: 10 @ 10 depth: 32.
	morph form: form.
	self assert: (form colorAt: 0 @ 0) equals: Color transparent.
	self assert: (form colorAt: 1 @ 1) equals: Color transparent.
	self assert: (form colorAt: 2 @ 2) equals: Color transparent.
	morph colorAt: 1 @ 1 put: Color red.
	self assert: (form colorAt: 0 @ 0) equals: Color transparent.
	self assert: (form colorAt: 1 @ 1) equals: Color red.
	self assert: (form colorAt: 2 @ 2) equals: Color transparent.
	morph penSize: 3 @ 3.
	morph colorAt: 1 @ 1 put: Color red.
	self assert: (form colorAt: 0 @ 0) equals: Color red.
	self assert: (form colorAt: 1 @ 1) equals: Color red.
	self assert: (form colorAt: 2 @ 2) equals: Color red
]

{ #category : #test }
PAPaletteMorphTest >> testInitialize [

	| morph |
	morph := self newMorph.
	self assert: morph penSize equals: 1 @ 1
]

{ #category : #test }
PAPaletteMorphTest >> testPenSize [

	| morph |
	morph := self newMorph.
	self assert: morph penSize equals: 1 @ 1.
	morph penSize: 2 @ 2.
	self assert: morph penSize equals: 2 @ 2
]
