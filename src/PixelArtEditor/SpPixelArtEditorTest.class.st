"
A SpPixelArtEditorTest is a test class for testing the behavior of SpPixelArtEditor
"
Class {
	#name : #SpPixelArtEditorTest,
	#superclass : #TestCase,
	#category : #'PixelArtEditor-Tests'
}

{ #category : #'instance creation' }
SpPixelArtEditorTest >> newPresenter [

	^ SpPixelArtEditor new
]

{ #category : #test }
SpPixelArtEditorTest >> testAppName [

	self assert: self newPresenter appName isString
]

{ #category : #test }
SpPixelArtEditorTest >> testAppicons [

	self assert: self newPresenter appicons isForm
]

{ #category : #test }
SpPixelArtEditorTest >> testColorItem [

	self assert: self newPresenter colorItem isPresenter
]

{ #category : #test }
SpPixelArtEditorTest >> testColorMorph [

	self assert: self newPresenter colorMorph isMorph
]

{ #category : #test }
SpPixelArtEditorTest >> testDefaultBackgroundColor [

	self assert: self newPresenter defaultBackgroundColor isColor
]

{ #category : #test }
SpPixelArtEditorTest >> testDefaultColor [

	self assert: self newPresenter defaultColor isColor
]

{ #category : #test }
SpPixelArtEditorTest >> testDefaultEditorScale [

	self assert: self newPresenter defaultEditorScale isNumber
]

{ #category : #test }
SpPixelArtEditorTest >> testDefaultExtent [

	self assert: self newPresenter defaultExtent isPoint
]

{ #category : #test }
SpPixelArtEditorTest >> testDefaultFormProtocol [

	self assert: self newPresenter defaultFormProtocol isString
]

{ #category : #test }
SpPixelArtEditorTest >> testDefaultGridColor [

	self assert: self newPresenter defaultGridColor isColor
]

{ #category : #test }
SpPixelArtEditorTest >> testDefaultPaletteFile [

	self assert: self newPresenter defaultPaletteFile isFile
]

{ #category : #test }
SpPixelArtEditorTest >> testDefaultViewerScale [

	self assert: self newPresenter defaultViewerScale isNumber
]

{ #category : #test }
SpPixelArtEditorTest >> testDrawButtonLabel [

	self assert: self newPresenter drawButtonLabel isString
]

{ #category : #test }
SpPixelArtEditorTest >> testEditor [

	self assert: (self newPresenter editor isKindOf: PixelArtEditor)
]

{ #category : #test }
SpPixelArtEditorTest >> testEditorMorph [

	self assert: self newPresenter editorMorph isMorph
]

{ #category : #test }
SpPixelArtEditorTest >> testEditorPane [

	self assert: self newPresenter editorPane isPresenter
]

{ #category : #test }
SpPixelArtEditorTest >> testEditorToolbar [

	self assert: self newPresenter editorToolbar isPresenter
]

{ #category : #test }
SpPixelArtEditorTest >> testIconExtent [

	self assert: self newPresenter iconExtent isPoint
]

{ #category : #test }
SpPixelArtEditorTest >> testMenu [

	self assert: self newPresenter menu isPresenter
]

{ #category : #test }
SpPixelArtEditorTest >> testPaintThreshold [

	self assert: self newPresenter paintThreshold isNumber
]

{ #category : #test }
SpPixelArtEditorTest >> testPaletteExtent [

	self assert: self newPresenter paletteExtent isPoint
]

{ #category : #test }
SpPixelArtEditorTest >> testPaletteMorph [

	self assert: self newPresenter paletteMorph isMorph
]

{ #category : #test }
SpPixelArtEditorTest >> testPalettePane [

	self assert: self newPresenter palettePane isPresenter
]

{ #category : #test }
SpPixelArtEditorTest >> testPalettePenSize [

	self assert: self newPresenter palettePenSize isPoint
]

{ #category : #test }
SpPixelArtEditorTest >> testProjectExtension [

	self assert: self newPresenter projectExtension isString
]

{ #category : #test }
SpPixelArtEditorTest >> testStatus [

	self assert: (self newPresenter status isKindOf: PAStatus)
]

{ #category : #test }
SpPixelArtEditorTest >> testStatusBar [

	self assert: self newPresenter statusBar isPresenter
]

{ #category : #test }
SpPixelArtEditorTest >> testViewerMorph [

	self assert: self newPresenter viewerMorph isMorph
]

{ #category : #test }
SpPixelArtEditorTest >> testViewerPane [

	self assert: self newPresenter viewerPane isPresenter
]
