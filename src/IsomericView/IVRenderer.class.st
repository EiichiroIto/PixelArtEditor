Class {
	#name : #IVRenderer,
	#superclass : #Object,
	#instVars : [
		'projector',
		'lineColor',
		'drawingRange'
	],
	#category : #'IsomericView-Renderer'
}

{ #category : #converting }
IVRenderer >> asFormRenderer [

	^ IVFormRenderer new
		  projector: projector;
		  yourself
]

{ #category : #converting }
IVRenderer >> asOutlineRenderer [

	^ IVOutlineRenderer new
		  projector: projector;
		  yourself
]

{ #category : #converting }
IVRenderer >> asRendererMixer [

	^ IVRendererMixer new
		  lineColor: (lineColor ifNil: [ Color darkGray ]);
		  projector: projector;
		  extent: self extent;
		  yourself
]

{ #category : #converting }
IVRenderer >> asSurfaceRenderer [

	^ IVSurfaceRenderer new
		  projector: projector;
		  yourself
]

{ #category : #private }
IVRenderer >> cylinderValuesOf: anObject [

	anObject onXPlane ifTrue: [
		^ {
			  (anObject center + (IVPoint x: anObject height y: 0 z: 0)).
			  (90 - projector axisAngle) } ].
	anObject onYPlane ifTrue: [
		^ {
			  (anObject center + (IVPoint x: 0 y: anObject height z: 0)).
			  (projector axisAngle - 90) } ].
	anObject onZPlane ifTrue: [
		^ {
			  (anObject center + (IVPoint x: 0 y: 0 z: anObject height negated)).
			  180 } ].
	self error
]

{ #category : #drawing }
IVRenderer >> drawForm: aForm center: aPoint on: aCanvas [

	| extent |
	extent := aForm extent.
	aCanvas translucentImage: aForm at: aPoint - (extent // 2).
	self recordRectangle: (Rectangle center: aPoint extent: extent)
]

{ #category : #drawing }
IVRenderer >> drawLineFrom: anIVPoint to: anIVPoint2 on: aCanvas [

	self drawLineFrom: anIVPoint to: anIVPoint2 width: 1 color: lineColor on: aCanvas
]

{ #category : #drawing }
IVRenderer >> drawLineFrom: anIVPoint to: anIVPoint2 width: anInteger color: aColor on: aCanvas [

	| from to |
	from := self ivPointToPoint: anIVPoint.
	to := self ivPointToPoint: anIVPoint2.
	aCanvas line: from to: to width: anInteger color: aColor
]

{ #category : #drawing }
IVRenderer >> drawObject: anObject on: aCanvas [

	self perform: anObject renderSelector with: anObject with: aCanvas
]

{ #category : #drawing }
IVRenderer >> drawPolygon: aCollection color: aColor borderWidth: anInteger borderColor: aColor2 on: aCanvas [

	aCanvas
		drawPolygon: aCollection
		color: aColor
		borderWidth: anInteger
		borderColor: aColor2.
	aCollection do: [ :each | self recordPoint: each ]
]

{ #category : #drawing }
IVRenderer >> drawXCircle: anIVPoint diameter: anInteger on: aCanvas [

	| center form extent |
	extent := projector extentOfSquareSide: anInteger.
	form := self
		        ovalFormExtent: extent
		        fillColor: Color transparent
		        borderWidth: 1
		        borderColor: lineColor.
	form := projector xSkewedForm: form y: anInteger z: anInteger.
	"form := form rotateBy: 90 - projector axisAngle."
	center := self ivPointToPoint: anIVPoint.
	self drawForm: form center: center on: aCanvas
]

{ #category : #drawing }
IVRenderer >> drawYCircle: anIVPoint diameter: anInteger on: aCanvas [

	| center form extent |
	extent := projector extentOfSquareSide: anInteger.
	form := self
		        ovalFormExtent: extent
		        fillColor: Color transparent
		        borderWidth: 1
		        borderColor: lineColor.
	form := projector ySkewedForm: form x: anInteger z: anInteger.
	"form := form rotateBy: projector axisAngle - 90."
	center := self ivPointToPoint: anIVPoint.
	self drawForm: form center: center on: aCanvas
]

{ #category : #drawing }
IVRenderer >> drawZCircle: anIVPoint diameter: anInteger on: aCanvas [

	| r |
	r := Rectangle
		     center: (self ivPointToPoint: anIVPoint)
		     extent: (projector extentOfSquareSide: anInteger).
	aCanvas
		fillOval: r
		color: Color transparent
		borderWidth: 1
		borderColor: lineColor.
	self recordRectangle: r
]

{ #category : #accessing }
IVRenderer >> drawingRange [

	^ drawingRange
]

{ #category : #accessing }
IVRenderer >> drawingRange: anObject [

	drawingRange := anObject
]

{ #category : #accessing }
IVRenderer >> extent [

	^ projector extent
]

{ #category : #accessing }
IVRenderer >> extent: aPoint [

	projector extent: aPoint
]

{ #category : #api }
IVRenderer >> formExtentFor: anIVPoint [

	^ projector formExtentFor: anIVPoint
]

{ #category : #testing }
IVRenderer >> isFormRenderer [

	^ false
]

{ #category : #private }
IVRenderer >> ivPointToPoint: anIVPoint [

	| p |
	p := projector ivPointToPoint: anIVPoint.
	self recordPoint: p.
	^ p
]

{ #category : #constants }
IVRenderer >> lineColor [

	^ lineColor
]

{ #category : #accessing }
IVRenderer >> lineColor: anObject [

	lineColor := anObject
]

{ #category : #drawing }
IVRenderer >> ovalFormExtent: aPoint fillColor: aColor borderWidth: anInteger borderColor: aColor2 [

	| form rect |
	form := Form extent: aPoint depth: 32.
	rect := Rectangle origin: 0 @ 0 extent: aPoint.
	(FormCanvas on: form)
		fillOval: rect
		color: aColor
		borderWidth: anInteger
		borderColor: aColor2.
	^ form
]

{ #category : #accessing }
IVRenderer >> projector [

	^ projector
]

{ #category : #accessing }
IVRenderer >> projector: anObject [

	projector := anObject
]

{ #category : #private }
IVRenderer >> recordPoint: aPoint [

	drawingRange ifNil: [
		^ drawingRange := Rectangle origin: aPoint extent: 1 @ 1 ].
	(drawingRange containsPoint: aPoint) ifTrue: [ ^ self ].
	drawingRange := drawingRange fixedEncompass: aPoint
]

{ #category : #private }
IVRenderer >> recordRectangle: aRectangle [

	self
		recordPoint: aRectangle origin;
		recordPoint: aRectangle corner
]

{ #category : #api }
IVRenderer >> render: aCollection [

	| form |
	aCollection ifNil: [ ^ nil ].
	form := Form extent: self extent depth: 32.
	self render: aCollection onForm: form.
	^ form
]

{ #category : #api }
IVRenderer >> render: aCollection onForm: aForm [

	| canvas |
	aCollection ifNil: [ ^ nil ].
	canvas := FormCanvas on: aForm.
	aCollection do: [ :each | self drawObject: each on: canvas ]
]

{ #category : #rendering }
IVRenderer >> renderBox: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderCircle: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderCylinder: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderFrame: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderHole: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderImage: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderMirror: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderPolyhedron: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderRectangle: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
IVRenderer >> renderWoodenFloor: anObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #drawing }
IVRenderer >> semiOvalFormExtent: aPoint fillColor: aColor borderWidth: anInteger borderColor: aColor2 [

	| form form2 rect |
	form := Form extent: aPoint depth: 32.
	rect := Rectangle origin: 0 @ 0 extent: aPoint.
	(FormCanvas on: form)
		fillOval: rect
		color: aColor
		borderWidth: anInteger
		borderColor: aColor2.
	form2 := Form extent: aPoint depth: 32.
	(BitBlt
		 destForm: form2
		 sourceForm: form
		 halftoneForm: nil
		 combinationRule: Form over
		 destOrigin: 0 @ 0
		 sourceOrigin: 0 @ 0
		 extent: aPoint x @ (aPoint y // 2)
		 clipRect: form2 boundingBox) copyBits.
	^ form2
]
