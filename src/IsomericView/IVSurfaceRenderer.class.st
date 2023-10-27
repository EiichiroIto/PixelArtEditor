Class {
	#name : #IVSurfaceRenderer,
	#superclass : #IVRenderer,
	#category : #'IsomericView-Renderer'
}

{ #category : #converting }
IVSurfaceRenderer >> asRendererMixer [

	^ super asRendererMixer
		  drawOutline: false;
		  drawForm: false;
		  yourself
]

{ #category : #converting }
IVSurfaceRenderer >> asSurfaceRenderer [

	^ self
]

{ #category : #drawing }
IVSurfaceRenderer >> drawXImage: aForm y: anInteger z: anInteger2 at: aPoint on: aCanvas [

	| form p |
	form := projector xSkewedForm: aForm y: anInteger z: anInteger2.
	p := self ivPointToPoint:
		     aPoint + (IVPoint x: 0 y: anInteger z: anInteger2).
	aCanvas translucentImage: form at: p.
	self recordRectangle: (Rectangle origin: p extent: form extent)
]

{ #category : #drawing }
IVSurfaceRenderer >> drawYImage: aForm x: anInteger z: anInteger2 at: aPoint on: aCanvas [

	| form p |
	form := projector ySkewedForm: aForm x: anInteger z: anInteger2.
	p := (self ivPointToPoint: aPoint) - (0 @ form extent y).
	aCanvas translucentImage: form at: p.
	self recordRectangle: (Rectangle origin: p extent: form extent)
]

{ #category : #drawing }
IVSurfaceRenderer >> drawZImage: aForm x: anInteger y: anInteger2 at: aPoint on: aCanvas [

	| form p3 p4 |
	form := projector zSkewedForm: aForm x: anInteger y: anInteger2.
	p3 := self ivPointToPoint: aPoint + (IVPoint x: 0 y: anInteger2 z: 0).
	p4 := self ivPointToPoint:
		      aPoint + (IVPoint x: anInteger y: anInteger2 z: 0).
	aCanvas translucentImage: form at: p3 x @ p4 y.
	self recordRectangle:
		(Rectangle origin: p3 x @ p4 y extent: form extent)
]

{ #category : #drawing }
IVSurfaceRenderer >> fillPolygon: aCollection color: aColor on: aCanvas [

	| list |
	list := aCollection collect: [ :each | self ivPointToPoint: each ].
	self
		drawPolygon: list
		color: aColor
		borderWidth: 0
		borderColor: Color red
		on: aCanvas
]

{ #category : #drawing }
IVSurfaceRenderer >> fillXCircle: anIVPoint color: aColor diameter: anInteger on: aCanvas [

	| center form extent |
	extent := projector extentOfXYForm: anInteger @ anInteger.
	form := self
		        ovalFormExtent: extent
		        fillColor: aColor
		        borderWidth: 0
		        borderColor: nil.
	form := projector xSkewedForm: form y: anInteger z: anInteger.
	center := self ivPointToPoint: anIVPoint.
	self drawForm: form center: center on: aCanvas
]

{ #category : #drawing }
IVSurfaceRenderer >> fillXRectangle: anIVPoint y: anInteger z: anInteger2 color: aColor on: aCanvas [

	| p1 p2 p6 p5 |
	p1 := self ivPointToPoint: anIVPoint.
	p2 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: 0 y: 0 z: anInteger2).
	p6 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: 0 y: anInteger z: anInteger2).
	p5 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: 0 y: anInteger z: 0).
	self
		drawPolygon: {
				p1.
				p2.
				p6.
				p5.
				p1 }
		color: aColor
		borderWidth: 0
		borderColor: Color red
		on: aCanvas
]

{ #category : #drawing }
IVSurfaceRenderer >> fillYCircle: anIVPoint color: aColor diameter: anInteger on: aCanvas [

	| center form extent |
	extent := projector extentOfXYForm: anInteger @ anInteger.
	form := self
		        ovalFormExtent: extent
		        fillColor: aColor
		        borderWidth: 0
		        borderColor: nil.
	form := projector ySkewedForm: form x: anInteger z: anInteger.
	center := self ivPointToPoint: anIVPoint.
	self drawForm: form center: center on: aCanvas
]

{ #category : #drawing }
IVSurfaceRenderer >> fillYRectangle: anIVPoint x: anInteger z: anInteger2 color: aColor on: aCanvas [

	| p1 p2 p3 p4 |
	p1 := self ivPointToPoint: anIVPoint.
	p2 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: 0 y: 0 z: anInteger2).
	p3 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: anInteger y: 0 z: anInteger2).
	p4 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: anInteger y: 0 z: 0).
	self
		drawPolygon: {
				p1.
				p2.
				p3.
				p4.
				p1 }
		color: aColor
		borderWidth: 0
		borderColor: Color red
		on: aCanvas
]

{ #category : #drawing }
IVSurfaceRenderer >> fillZCircle: anIVPoint color: aColor diameter: anInteger on: aCanvas [

	| center form extent |
	extent := projector extentOfSquareSide: anInteger.
	form := self
		        ovalFormExtent: extent
		        fillColor: aColor
		        borderWidth: 0
		        borderColor: nil.
	center := self ivPointToPoint: anIVPoint.
	self drawForm: form center: center on: aCanvas
]

{ #category : #drawing }
IVSurfaceRenderer >> fillZRectangle: anIVPoint x: anInteger y: anInteger2 color: aColor on: aCanvas [

	| p2 p3 p7 p6 |
	p2 := self ivPointToPoint: anIVPoint.
	p3 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: anInteger y: 0 z: 0).
	p7 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: anInteger y: anInteger2 z: 0).
	p6 := self ivPointToPoint:
		      anIVPoint + (IVPoint x: 0 y: anInteger2 z: 0).
	self
		drawPolygon: {
				p2.
				p3.
				p7.
				p6.
				p2 }
		color: aColor
		borderWidth: 0
		borderColor: Color red
		on: aCanvas
]

{ #category : #private }
IVSurfaceRenderer >> renderBox: anObject at: aPoint extent: aPoint2 on: aCanvas [

	anObject xMaterial
		renderXRectangle: self
		y: aPoint2 y
		z: aPoint2 z
		at: aPoint
		on: aCanvas.
	anObject yMaterial
		renderYRectangle: self
		x: aPoint2 x
		z: aPoint2 z
		at: aPoint
		on: aCanvas.
	anObject zMaterial
		renderZRectangle: self
		x: aPoint2 x
		y: aPoint2 y
		at: aPoint + (IVPoint x: 0 y: 0 z: aPoint2 z)
		on: aCanvas
]

{ #category : #rendering }
IVSurfaceRenderer >> renderBox: anObject on: aCanvas [

	anObject isSurfaceDefined ifFalse: [ ^ self ].
	self
		renderBox: anObject
		at: anObject origin
		extent: anObject extent
		on: aCanvas
]

{ #category : #rendering }
IVSurfaceRenderer >> renderCircle: anObject on: aCanvas [

	anObject onXPlane ifTrue: [
		anObject topMaterial
			renderXCircle: self
			diameter: anObject radius * 2
			at: anObject center
			on: aCanvas ].
	anObject onYPlane ifTrue: [
		anObject topMaterial
			renderYCircle: self
			diameter: anObject radius * 2
			at: anObject center
			on: aCanvas ].
	anObject onZPlane ifTrue: [
		anObject topMaterial
			renderZCircle: self
			diameter: anObject radius * 2
			at: anObject center
			on: aCanvas ]
]

{ #category : #rendering }
IVSurfaceRenderer >> renderCylinder: anObject on: aCanvas [

	| values back topExtent bottomExtent p1 p2 topDelta bottomDelta form angle |
	values := self cylinderValuesOf: anObject.
	back := values first.
	angle := values second.

	topExtent := projector extentOfSquareSide: anObject radius * 2.
	topDelta := Point r: topExtent x // 2 degrees: angle.
	bottomExtent := projector extentOfSquareSide:
		                anObject bottomRadius * 2.
	bottomDelta := Point r: bottomExtent x // 2 degrees: angle.
	p1 := self ivPointToPoint: anObject center.
	p2 := self ivPointToPoint: back.
	aCanvas
		drawPolygon: {
				(p1 + topDelta).
				(p2 + bottomDelta).
				(p2 + (Point r: bottomExtent min // 4 degrees: angle - 90)).
				(p2 - bottomDelta).
				(p1 - topDelta).
				(p1 + topDelta) }
		color: anObject sideMaterial
		borderWidth: 0
		borderColor: Color transparent.

	form := self
		        semiOvalFormExtent: bottomExtent
		        fillColor: anObject sideMaterial
		        borderWidth: 1
		        borderColor: Color transparent.
	form := form rotateBy: angle.
	self drawForm: form center: p2 on: aCanvas.

	form := self
		        ovalFormExtent: topExtent
		        fillColor: anObject topMaterial
		        borderWidth: 0
		        borderColor: nil.
	form := form rotateBy: angle.
	self drawForm: form center: p1 on: aCanvas
]

{ #category : #rendering }
IVSurfaceRenderer >> renderFrame: anObject on: aCanvas [

	anObject onXPlane ifTrue: [ self renderXFrame: anObject on: aCanvas ].
	anObject onYPlane ifTrue: [ self renderYFrame: anObject on: aCanvas ].
	anObject onZPlane ifTrue: [ self renderZFrame: anObject on: aCanvas ]
]

{ #category : #rendering }
IVSurfaceRenderer >> renderHole: anObject on: aCanvas [

	anObject isSurfaceDefined ifFalse: [ ^ self ].
	self
		renderBox: anObject
		at: anObject origin
		extent: anObject extent
		on: aCanvas.
	self asOutlineRenderer renderHole: anObject on: aCanvas
]

{ #category : #rendering }
IVSurfaceRenderer >> renderImage: anObject on: aCanvas [

	| origin h |
	origin := self ivPointToPoint: anObject origin.
	h := anObject form height.
	aCanvas translucentImage: anObject form at: origin + (0 @ h negated)
]

{ #category : #rendering }
IVSurfaceRenderer >> renderMirror: anObject on: aCanvas [

	| vertices |
	anObject isSurfaceDefined ifFalse: [ ^ self ].
	vertices := anObject yVertices.
	anObject mirrorStyle
		render: self
		polygon: {
				vertices first.
				vertices second.
				vertices third.
				vertices fourth }
		on: aCanvas.
	self
		drawLineFrom: vertices first
		to: vertices second
		width: 2
		color: anObject xMaterial
		on: aCanvas.
	self
		drawLineFrom: vertices second
		to: vertices third
		width: 2
		color: anObject xMaterial
		on: aCanvas.
	self
		drawLineFrom: vertices third
		to: vertices fourth
		width: 2
		color: anObject xMaterial
		on: aCanvas.
	self
		drawLineFrom: vertices fourth
		to: vertices first
		width: 2
		color: anObject xMaterial
		on: aCanvas
]

{ #category : #rendering }
IVSurfaceRenderer >> renderPolyhedron: anObject on: aCanvas [

	| vertices v1 v2 |
	vertices := anObject vertices.
	anObject otherColors withIndexDo: [ :each :index |
		v1 := anObject visibleVertices at: index.
		v2 := anObject visibleVertices at: index + 1.
		each
			render: self
			polygon: {
					(vertices first at: v1).
					(vertices second at: v1).
					(vertices second at: v2).
					(vertices first at: v2) }
			on: aCanvas ].
	anObject topMaterial render: self polygon: vertices first on: aCanvas
]

{ #category : #rendering }
IVSurfaceRenderer >> renderRectangle: anObject on: aCanvas [

	| p |
	anObject isSurfaceDefined ifFalse: [ ^ self ].
	p := anObject vertices first.
	anObject onXPlane ifTrue: [
		^ anObject topMaterial
			  renderXRectangle: self
			  y: anObject width
			  z: anObject height
			  at: p
			  on: aCanvas ].
	anObject onYPlane ifTrue: [
		^ anObject topMaterial
			  renderYRectangle: self
			  x: anObject width
			  z: anObject height
			  at: p
			  on: aCanvas ].
	anObject onZPlane ifTrue: [
		^ anObject topMaterial
			  renderZRectangle: self
			  x: anObject width
			  y: anObject height
			  at: p
			  on: aCanvas ].
	self error
]

{ #category : #rendering }
IVSurfaceRenderer >> renderWoodenFloor: anObject on: aCanvas [

	| vertices count from to delta |
	anObject isSurfaceDefined ifFalse: [ ^ self ].
	self
		renderBox: anObject
		at: anObject origin
		extent: anObject extent
		on: aCanvas.
	vertices := anObject vertices.
	count := vertices third y - vertices second y // anObject timberSpace.
	from := vertices second.
	to := vertices sixth.
	delta := IVPoint x: 0 y: anObject timberSpace z: 0.
	count timesRepeat: [
		self
			drawLineFrom: from
			to: to
			width: anObject timberWidth
			color: anObject timberColor
			on: aCanvas.
		from := from + delta.
		to := to + delta ]
]

{ #category : #private }
IVSurfaceRenderer >> renderXFrame: anObject on: aCanvas [

	self shouldBeImplemented
]

{ #category : #private }
IVSurfaceRenderer >> renderYFrame: anObject on: aCanvas [

	| vertices |
	vertices := anObject frameVertices.
	anObject zMaterial
		render: self polygon: {
				vertices second.
				vertices third.
				vertices seventh.
				vertices sixth }
		on: aCanvas;
		render: self polygon: {
				vertices ninth.
				(vertices at: 13).
				(vertices at: 14).
				(vertices at: 11) }
		on: aCanvas.
	anObject xMaterial
		render: self polygon: {
				vertices first.
				vertices second.
				vertices third.
				vertices fourth }
		on: aCanvas;
		render: self polygon: {
				(vertices at: 11).
				(vertices at: 14).
				(vertices at: 15).
				(vertices at: 12) }
		on: aCanvas.

	anObject yMaterial
		render: self polygon: {
				vertices first.
				vertices second.
				vertices sixth.
				(vertices at: 12).
				(vertices at: 10).
				vertices ninth }
		on: aCanvas;
		render: self polygon: {
				vertices first.
				vertices fifth.
				vertices sixth.
				(vertices at: 12).
				(vertices at: 11).
				vertices ninth }
		on: aCanvas
]

{ #category : #private }
IVSurfaceRenderer >> renderZFrame: anObject on: aCanvas [

	self shouldBeImplemented
]
