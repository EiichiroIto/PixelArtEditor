"
A PAEditorMorphTest is a test class for testing the behavior of PAEditorMorph
"
Class {
	#name : #PAEditorMorphTest,
	#superclass : #TestCase,
	#category : #'PixelArtEditor-Tests'
}

{ #category : #'instance creation' }
PAEditorMorphTest >> newMorph [

	^ PAEditorMorph new
]

{ #category : #test }
PAEditorMorphTest >> testBeLineSelection [

	| morph |
	morph := self newMorph.
	self deny: morph isLineSelection.
	morph beLineSelection.
	self assert: morph isLineSelection
]

{ #category : #test }
PAEditorMorphTest >> testBeRectangleSelection [

	| morph |
	morph := self newMorph.
	self deny: morph isRectangleSelection.
	morph beRectangleSelection.
	self assert: morph isRectangleSelection
]

{ #category : #test }
PAEditorMorphTest >> testClearSelection [

	| morph |
	morph := self newMorph.
	morph selectionStart: 3 @ 4.
	morph selectionEnd: 1 @ 2.
	self assert: morph selectionStart equals: 3 @ 4.
	self assert: morph selectionEnd equals: 1 @ 2.
	morph clearSelection.
	self assert: morph selectionStart isNil.
	self assert: morph selectionEnd isNil
]

{ #category : #test }
PAEditorMorphTest >> testEndSelecting [

	| morph |
	morph := self newMorph.
	self assert: morph selectionStart isNil.
	self assert: morph selectionEnd isNil.
	morph endSelecting: 1 @ 2.
	self assert: morph selectionStart isNil.
	self assert: morph selectionEnd isNil.
	morph selectionStart: 3 @ 4.
	morph endSelecting: 1 @ 2.
	self assert: morph selectionStart equals: 3 @ 4.
	self assert: morph selectionEnd equals: 1 @ 2
]

{ #category : #test }
PAEditorMorphTest >> testIsLineSelection [

	self testBeLineSelection
]

{ #category : #test }
PAEditorMorphTest >> testIsRectangleSelection [

	self testBeRectangleSelection
]

{ #category : #test }
PAEditorMorphTest >> testMode [

	| morph |
	morph := self newMorph.
	self assert: morph mode isNil.
	morph beLineSelection.
	self assert: morph mode equals: #line.
	morph beRectangleSelection.
	self assert: morph mode equals: #rectangle.
	morph clearSelection.
	self assert: morph mode isNil
]

{ #category : #test }
PAEditorMorphTest >> testSelection [

	| morph rect |
	morph := self newMorph.
	self assert: morph selection isNil.
	morph selectionStart: 2 @ 5.
	self assert: morph selection isNil.
	morph selectionEnd: 4 @ 1.
	rect := morph selection.
	self assert: rect isRectangle.
	self assert: rect origin equals: 2 @ 1.
	self assert: rect corner equals: 4 @ 5
]

{ #category : #test }
PAEditorMorphTest >> testSelectionColor [

	| morph |
	morph := self newMorph.
	morph color: Color white.
	self assert: morph selectionColor equals: Color lightGray.
	morph color: Color lightGray.
	self assert: morph selectionColor equals: Color white.
	morph color: Color red.
	self assert: morph selectionColor equals: Color white
]

{ #category : #test }
PAEditorMorphTest >> testSelectionEnd [

	| morph |
	morph := self newMorph.
	self assert: morph selectionEnd isNil.
	morph selectionEnd: 1 @ 2.
	self assert: morph selectionEnd equals: 1 @ 2.
	morph selectionEnd: 3 @ 4.
	self assert: morph selectionEnd equals: 3 @ 4
]

{ #category : #test }
PAEditorMorphTest >> testSelectionRectangle [

	| morph rect |
	morph := self newMorph.
	self assert: morph selectionRectangle isNil.
	morph selectionStart: 2 @ 5.
	morph selectionEnd: 4 @ 1.
	morph scale: 3.
	rect := morph selectionRectangle.
	self assert: rect isRectangle.
	self assert: rect origin equals: 6 @ 3.
	self assert: rect corner equals: 14 @ 17.
	morph selectionStart: 0 @ 0.
	morph selectionEnd: 0 @ 0.
	morph scale: 3.
	rect := morph selectionRectangle.
	self assert: rect isRectangle.
	self assert: rect origin equals: 0 @ 0.
	self assert: rect corner equals: 2 @ 2
]

{ #category : #test }
PAEditorMorphTest >> testSelectionStart [

	| morph |
	morph := self newMorph.
	self assert: morph selectionStart isNil.
	morph selectionStart: 1 @ 2.
	self assert: morph selectionStart equals: 1 @ 2.
	morph selectionStart: 3 @ 4.
	self assert: morph selectionStart equals: 3 @ 4
]

{ #category : #test }
PAEditorMorphTest >> testStartSelecting [

	| morph |
	morph := self newMorph.
	morph selectionStart: 0 @ 0.
	morph selectionEnd: 100 @ 100.
	self assert: morph selectionStart equals: 0 @ 0.
	self assert: morph selectionEnd equals: 100 @ 100.
	morph startSelecting: 1 @ 2.
	self assert: morph selectionStart equals: 1 @ 2.
	self assert: morph selectionEnd isNil
]
