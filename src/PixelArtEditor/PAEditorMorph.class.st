Class {
	#name : #PAEditorMorph,
	#superclass : #PAViewerMorph,
	#instVars : [
		'selectionStart',
		'selectionEnd',
		'mode'
	],
	#category : #'PixelArtEditor-View'
}

{ #category : #api }
PAEditorMorph >> beLineSelection [

	mode := #line
]

{ #category : #api }
PAEditorMorph >> beRectangleSelection [

	mode := #rectangle
]

{ #category : #api }
PAEditorMorph >> clearSelection [

	selectionStart := selectionEnd := mode := nil.
	self changed
]

{ #category : #drawing }
PAEditorMorph >> drawLineOn: aCanvas [

	| points |
	selectionStart ifNil: [ ^ nil ].
	selectionEnd ifNil: [ ^ nil ].
	points := PixelArtEditor
		          pointsOfline: selectionStart
		          to: selectionEnd.
	points do: [ :each | self drawPixel: each on: aCanvas ]
]

{ #category : #drawing }
PAEditorMorph >> drawOn: aCanvas [

	super drawOn: aCanvas.
	mode = #rectangle ifTrue: [ self drawRectangleOn: aCanvas ].
	mode = #line ifTrue: [ self drawLineOn: aCanvas ]
]

{ #category : #drawing }
PAEditorMorph >> drawPixel: aPoint on: aCanvas [

	| pos rect |
	pos := aPoint * scale + self topLeft.
	rect := Rectangle origin: pos corner: pos + (scale - 1).
	aCanvas frameRectangle: rect width: 1 color: Color black
]

{ #category : #drawing }
PAEditorMorph >> drawRectangleOn: aCanvas [

	| rect |
	rect := self selectionRectangle.
	rect ifNil: [ ^ self ].
	rect := rect translateBy: self topLeft.
	aCanvas
		frameRectangle: (rect expandBy: 1) width: 1 color: Color black;
		frameRectangle: rect width: 1 color: Color white;
		frameRectangle: (rect expandBy: -1) width: 1 color: Color black
]

{ #category : #api }
PAEditorMorph >> endSelecting: aPoint [

	selectionStart ifNil: [ ^ self ].
	selectionEnd := aPoint.
	self changed
]

{ #category : #testing }
PAEditorMorph >> isLineSelection [

	^ mode = #line
]

{ #category : #testing }
PAEditorMorph >> isRectangleSelection [

	^ mode = #rectangle
]

{ #category : #accessing }
PAEditorMorph >> mode [

	^ mode
]

{ #category : #api }
PAEditorMorph >> selection [

	selectionStart ifNil: [ ^ nil ].
	selectionEnd ifNil: [ ^ nil ].
	^ Rectangle
		  origin: (selectionStart min: selectionEnd)
		  corner: (selectionStart max: selectionEnd)
]

{ #category : #constants }
PAEditorMorph >> selectionColor [

	color = Color white ifTrue: [ ^ Color lightGray ].
	^ Color white
]

{ #category : #accessing }
PAEditorMorph >> selectionEnd [

	^ selectionEnd
]

{ #category : #accessing }
PAEditorMorph >> selectionEnd: anObject [

	selectionEnd := anObject
]

{ #category : #api }
PAEditorMorph >> selectionRectangle [

	| rect p1 p2 |
	rect := self selection.
	rect ifNil: [ ^ nil ].
	p1 := rect origin.
	p2 := rect corner.
	^ Rectangle origin: p1 * scale corner: ((p2 + 1) * scale) - 1
]

{ #category : #accessing }
PAEditorMorph >> selectionStart [

	^ selectionStart
]

{ #category : #accessing }
PAEditorMorph >> selectionStart: anObject [

	selectionStart := anObject
]

{ #category : #api }
PAEditorMorph >> startSelecting: aPoint [

	selectionStart := aPoint.
	selectionEnd := nil.
	self changed
]
