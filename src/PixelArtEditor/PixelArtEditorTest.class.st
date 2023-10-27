"
A PixelArtEditorTest is a test class for testing the behavior of PixelArtEditor
"
Class {
	#name : #PixelArtEditorTest,
	#superclass : #TestCase,
	#category : #'PixelArtEditor-Tests'
}

{ #category : #'instance creation' }
PixelArtEditorTest >> newEditor [

	^ PixelArtEditor new
]

{ #category : #test }
PixelArtEditorTest >> testColorAt [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 20 depth: 32.
	editor form: form.
	self assert: (editor colorAt: 0 @ 0) equals: Color transparent.
	self assert: (editor colorAt: 1 @ 1) equals: Color transparent.
	self assert: (editor colorAt: 2 @ 2) equals: Color transparent.
	editor colorAt: 0 @ 0 put: Color red.
	editor colorAt: 1 @ 1 put: Color green.
	editor colorAt: 2 @ 2 put: Color blue.
	self assert: (editor colorAt: 0 @ 0) equals: Color red.
	self assert: (editor colorAt: 1 @ 1) equals: Color green.
	self assert: (editor colorAt: 2 @ 2) equals: Color blue
]

{ #category : #test }
PixelArtEditorTest >> testColorAtPut [

	self testColorAt
]

{ #category : #test }
PixelArtEditorTest >> testContainsPoint [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 20 depth: 32.
	editor form: form.
	self assert: (editor containsPoint: 9 @ 19).
	self deny: (editor containsPoint: 10 @ 20).
	form := Form extent: 11 @ 21 depth: 32.
	editor form: form.
	self assert: (editor containsPoint: 9 @ 19).
	self assert: (editor containsPoint: 10 @ 20)
]

{ #category : #test }
PixelArtEditorTest >> testExtent [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 20 depth: 32.
	editor form: form.
	self assert: editor extent equals: 10 @ 20.
	form := Form extent: 11 @ 21 depth: 32.
	editor form: form.
	self assert: editor extent equals: 11 @ 21
]

{ #category : #test }
PixelArtEditorTest >> testForm [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	self assert: editor form identicalTo: form
]

{ #category : #test }
PixelArtEditorTest >> testHeight [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 20 depth: 32.
	editor form: form.
	self assert: editor height equals: 20
]

{ #category : #test }
PixelArtEditorTest >> testIsTransparentCol [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	editor colorAt: 2 @ 3 put: Color red.
	editor colorAt: 7 @ 8 put: Color green.
	self assert: (editor isTransparentCol: 0).
	self assert: (editor isTransparentCol: 1).
	self deny: (editor isTransparentCol: 2).
	self assert: (editor isTransparentCol: 3).
	self assert: (editor isTransparentCol: 4).
	self assert: (editor isTransparentCol: 5).
	self assert: (editor isTransparentCol: 6).
	self deny: (editor isTransparentCol: 7).
	self assert: (editor isTransparentCol: 8).
	self assert: (editor isTransparentCol: 9)
]

{ #category : #test }
PixelArtEditorTest >> testIsTransparentRow [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	editor colorAt: 2 @ 3 put: Color red.
	editor colorAt: 7 @ 8 put: Color green.
	self assert: (editor isTransparentRow: 0).
	self assert: (editor isTransparentRow: 1).
	self assert: (editor isTransparentRow: 2).
	self deny: (editor isTransparentRow: 3).
	self assert: (editor isTransparentRow: 4).
	self assert: (editor isTransparentRow: 5).
	self assert: (editor isTransparentRow: 6).
	self assert: (editor isTransparentRow: 7).
	self deny: (editor isTransparentRow: 8).
	self assert: (editor isTransparentRow: 9)
]

{ #category : #test }
PixelArtEditorTest >> testNewExtent [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	editor newExtent: 20 @ 20.
	self assert: editor extent equals: 20 @ 20.
	self assert: form extent equals: 10 @ 10
]

{ #category : #test }
PixelArtEditorTest >> testNewHeight [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	editor newHeight: 30.
	self assert: editor extent equals: 10 @ 30.
	self assert: form extent equals: 10 @ 10
]

{ #category : #test }
PixelArtEditorTest >> testNewWidth [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	editor newWidth: 30.
	self assert: editor extent equals: 30 @ 10.
	self assert: form extent equals: 10 @ 10
]

{ #category : #test }
PixelArtEditorTest >> testNumColors [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	self assert: editor numColors equals: 1.
	editor colorAt: 0 @ 0 put: Color red.
	self assert: editor numColors equals: 2.
	editor colorAt: 1 @ 1 put: Color green.
	self assert: editor numColors equals: 3
]

{ #category : #test }
PixelArtEditorTest >> testReplaceColorWithColor [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	editor colorAt: 0 @ 0 put: Color red.
	editor colorAt: 1 @ 1 put: Color green.
	editor colorAt: 2 @ 2 put: Color blue.
	self assert: (editor colorAt: 0 @ 0) equals: Color red.
	self assert: (editor colorAt: 1 @ 1) equals: Color green.
	self assert: (editor colorAt: 2 @ 2) equals: Color blue.
	editor replaceColor: Color green withColor: Color white.
	self assert: (editor colorAt: 0 @ 0) equals: Color red.
	self assert: (editor colorAt: 1 @ 1) equals: Color white.
	self assert: (editor colorAt: 2 @ 2) equals: Color blue
]

{ #category : #test }
PixelArtEditorTest >> testTrimHorizontally [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	editor colorAt: 2 @ 3 put: Color red.
	editor colorAt: 7 @ 8 put: Color green.
	self assert: (editor colorAt: 2 @ 3) equals: Color red.
	self assert: (editor colorAt: 7 @ 8) equals: Color green.
	editor trimHorizontally.
	self assert: (editor colorAt: 0 @ 3) equals: Color red.
	self assert: (editor colorAt: 5 @ 8) equals: Color green.
	self assert: editor extent equals: 6 @ 10
]

{ #category : #test }
PixelArtEditorTest >> testTrimVertically [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 10 depth: 32.
	editor form: form.
	editor colorAt: 2 @ 3 put: Color red.
	editor colorAt: 7 @ 8 put: Color green.
	self assert: (editor colorAt: 2 @ 3) equals: Color red.
	self assert: (editor colorAt: 7 @ 8) equals: Color green.
	editor trimVertically.
	self assert: (editor colorAt: 2 @ 0) equals: Color red.
	self assert: (editor colorAt: 7 @ 5) equals: Color green.
	self assert: editor extent equals: 10 @ 6
]

{ #category : #test }
PixelArtEditorTest >> testWidth [

	| editor form |
	editor := self newEditor.
	form := Form extent: 10 @ 20 depth: 32.
	editor form: form.
	self assert: editor width equals: 10
]
