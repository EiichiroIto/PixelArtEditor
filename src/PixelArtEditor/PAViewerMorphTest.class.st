"
A PAViewerMorphTest is a test class for testing the behavior of PAViewerMorph
"
Class {
	#name : #PAViewerMorphTest,
	#superclass : #TestCase,
	#category : #'PixelArtEditor-Tests'
}

{ #category : #'instance creation' }
PAViewerMorphTest >> newMorph [

	^ PAViewerMorph new
]

{ #category : #test }
PAViewerMorphTest >> testCachedForm [

	| morph form |
	morph := self newMorph.
	self assert: morph cachedForm isNil.
	form := Form extent: 1 @ 3 depth: 32.
	morph cachedForm: form.
	self assert: morph cachedForm identicalTo: form
]

{ #category : #test }
PAViewerMorphTest >> testForm [

	| morph form |
	morph := self newMorph.
	self assert: morph form isNil.
	form := Form extent: 1 @ 3 depth: 32.
	morph form: form.
	self assert: morph form identicalTo: form
]

{ #category : #test }
PAViewerMorphTest >> testGridColor [

	| morph |
	morph := self newMorph.
	self assert: morph gridColor isNil.
	morph gridColor: Color red.
	self assert: morph gridColor equals: Color red.
	morph gridColor: Color blue.
	self assert: morph gridColor equals: Color blue
]

{ #category : #test }
PAViewerMorphTest >> testScale [

	| morph |
	morph := self newMorph.
	self assert: morph scale equals: 1 @ 1.
	morph scale: 2.
	self assert: morph scale equals: 2 @ 2
]

{ #category : #test }
PAViewerMorphTest >> testShowGrid [

	| morph |
	morph := self newMorph.
	self deny: morph showGrid.
	morph showGrid: true.
	self assert: morph showGrid.
	morph showGrid: false.
	self deny: morph showGrid
]
