Class {
	#name : #PAViewerMorph,
	#superclass : #Morph,
	#instVars : [
		'form',
		'cachedForm',
		'scale',
		'showGrid',
		'gridColor'
	],
	#category : #'PixelArtEditor-View'
}

{ #category : #private }
PAViewerMorph >> buildCachedForm [

	| newForm newExtent canvas x y |
	newExtent := form extent * scale.
	newForm := form scaledToSize: newExtent.
	canvas := FormCanvas on: newForm.
	(showGrid and: [
		 gridColor notNil and: [ scale x > 1 and: [ scale y > 1 ] ] ])
		ifTrue: [
			1 to: form height - 1 do: [ :each |
				y := each * scale y - 1.
				canvas
					line: 0 @ y
					to: newExtent x - 1 @ y
					width: 1
					color: gridColor ].
			1 to: form width - 1 do: [ :each |
				x := each * scale x - 1.
				canvas
					line: x @ 0
					to: x @ (newExtent y - 1)
					width: 1
					color: gridColor ] ].
	^ newForm
]

{ #category : #accessing }
PAViewerMorph >> cachedForm [

	^ cachedForm
]

{ #category : #accessing }
PAViewerMorph >> cachedForm: anObject [

	cachedForm := anObject
]

{ #category : #drawing }
PAViewerMorph >> drawOn: aCanvas [

	| p1 p2 |
	super drawOn: aCanvas.
	cachedForm ifNil: [ ^ self ].
	aCanvas translucentImage: cachedForm at: self topLeft.
	p1 := self topLeft + (cachedForm width + 1 @ 0).
	p2 := self topLeft + (0 @ cachedForm height + 1).
	aCanvas
		line: p1
		to: p1 x @ p2 y
		width: 1
		color: Color black.
	aCanvas
		line: p2
		to: p1 x @ p2 y
		width: 1
		color: Color black
]

{ #category : #accessing }
PAViewerMorph >> form [

	^ form
]

{ #category : #accessing }
PAViewerMorph >> form: anObject [

	form := anObject.
	cachedForm := form ifNil: [ nil ] ifNotNil: [ self buildCachedForm ].
	self changed
]

{ #category : #api }
PAViewerMorph >> formToScreenPoint: aPoint [

	^ aPoint * scale + self topLeft
]

{ #category : #accessing }
PAViewerMorph >> gridColor [

	^ gridColor
]

{ #category : #accessing }
PAViewerMorph >> gridColor: anObject [

	gridColor := anObject
]

{ #category : #initialization }
PAViewerMorph >> initialize [

	super initialize.
	scale := 1 @ 1.
	showGrid := false
]

{ #category : #accessing }
PAViewerMorph >> scale [

	^ scale
]

{ #category : #accessing }
PAViewerMorph >> scale: anObject [

	scale := anObject asPoint
]

{ #category : #api }
PAViewerMorph >> screenToFormPoint: aPoint [

	^ aPoint - self topLeft // scale
]

{ #category : #accessing }
PAViewerMorph >> showGrid [

	^ showGrid
]

{ #category : #accessing }
PAViewerMorph >> showGrid: anObject [

	showGrid := anObject
]
