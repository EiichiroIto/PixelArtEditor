Class {
	#name : #IVRendererMixer,
	#superclass : #Object,
	#instVars : [
		'outlineRenderer',
		'surfaceRenderer',
		'formRenderer',
		'drawOutline',
		'drawForm'
	],
	#category : #'IsomericView-Renderer'
}

{ #category : #converting }
IVRendererMixer >> asRendererMixer [

	^ self
]

{ #category : #accessing }
IVRendererMixer >> drawForm [

	^ drawForm
]

{ #category : #accessing }
IVRendererMixer >> drawForm: anObject [

	drawForm := anObject
]

{ #category : #private }
IVRendererMixer >> drawObject: anObject on: aCanvas [

	drawForm
		ifTrue: [ formRenderer drawObject: anObject on: aCanvas ]
		ifFalse: [ surfaceRenderer drawObject: anObject on: aCanvas ].
	drawOutline ifTrue: [
		outlineRenderer drawObject: anObject on: aCanvas ]
]

{ #category : #accessing }
IVRendererMixer >> drawOutline [

	^ drawOutline
]

{ #category : #accessing }
IVRendererMixer >> drawOutline: anObject [

	drawOutline := anObject
]

{ #category : #api }
IVRendererMixer >> drawingRange [

	| result |
	result := nil.
	outlineRenderer drawingRange ifNotNil: [ :rect |
		result := result ifNil: [ rect ] ifNotNil: [ result merge: rect ] ].
	surfaceRenderer drawingRange ifNotNil: [ :rect |
		result := result ifNil: [ rect ] ifNotNil: [ result merge: rect ] ].
	formRenderer drawingRange ifNotNil: [ :rect |
		result := result ifNil: [ rect ] ifNotNil: [ result merge: rect ] ].
	^ result
]

{ #category : #api }
IVRendererMixer >> drawingRange: aRectangleOrNil [

	outlineRenderer drawingRange: aRectangleOrNil.
	surfaceRenderer drawingRange: aRectangleOrNil.
	formRenderer drawingRange: aRectangleOrNil
]

{ #category : #api }
IVRendererMixer >> extent [

	^ outlineRenderer extent
]

{ #category : #api }
IVRendererMixer >> extent: aPoint [

	outlineRenderer extent: aPoint
]

{ #category : #api }
IVRendererMixer >> formExtentFor: anIVPoint [

	^ self projector formExtentFor: anIVPoint
]

{ #category : #accessing }
IVRendererMixer >> formRenderer [

	^ formRenderer
]

{ #category : #accessing }
IVRendererMixer >> formRenderer: anObject [

	formRenderer := anObject
]

{ #category : #initialization }
IVRendererMixer >> initialize [

	outlineRenderer := self newOutlineRenderer.
	surfaceRenderer := self newSurfaceRenderer.
	formRenderer := self newFormRenderer.
	drawOutline := true.
	drawForm := false
]

{ #category : #api }
IVRendererMixer >> ivPointToPoint: anIVPoint [

	^ self projector ivPointToPoint: anIVPoint
]

{ #category : #api }
IVRendererMixer >> lineColor [

	^ outlineRenderer lineColor
]

{ #category : #api }
IVRendererMixer >> lineColor: aColor [

	outlineRenderer lineColor: aColor.
	surfaceRenderer lineColor: aColor.
	formRenderer lineColor: aColor
]

{ #category : #'instance creation' }
IVRendererMixer >> newFormRenderer [

	^ IVFormRenderer new
		  yourself
]

{ #category : #'instance creation' }
IVRendererMixer >> newOutlineRenderer [

	^ IVOutlineRenderer new
		  yourself
]

{ #category : #'instance creation' }
IVRendererMixer >> newSurfaceRenderer [

	^ IVSurfaceRenderer new
		  yourself
]

{ #category : #accessing }
IVRendererMixer >> outlineRenderer [

	^ outlineRenderer
]

{ #category : #accessing }
IVRendererMixer >> outlineRenderer: anObject [

	outlineRenderer := anObject
]

{ #category : #api }
IVRendererMixer >> projector [

	^ outlineRenderer projector
]

{ #category : #api }
IVRendererMixer >> projector: aProjector [

	outlineRenderer projector: aProjector.
	surfaceRenderer projector: aProjector.
	formRenderer projector: aProjector
]

{ #category : #api }
IVRendererMixer >> render: aCollection [

	| form |
	aCollection ifNil: [ ^ nil ].
	form := Form extent: self extent depth: 32.
	self render: aCollection onForm: form.
	^ form
]

{ #category : #api }
IVRendererMixer >> render: aCollection onForm: aForm [

	| canvas |
	aCollection ifNil: [ ^ nil ].
	canvas := FormCanvas on: aForm.
	aCollection do: [ :each | self drawObject: each on: canvas ]
]

{ #category : #accessing }
IVRendererMixer >> surfaceRenderer [

	^ surfaceRenderer
]

{ #category : #accessing }
IVRendererMixer >> surfaceRenderer: anObject [

	surfaceRenderer := anObject
]
