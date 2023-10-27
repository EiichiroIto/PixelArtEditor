Class {
	#name : #IVOutlineRenderer,
	#superclass : #IVRenderer,
	#category : #'IsomericView-Renderer'
}

{ #category : #converting }
IVOutlineRenderer >> asOutlineRenderer [

	^ self
]

{ #category : #converting }
IVOutlineRenderer >> asRendererMixer [

	^ super asRendererMixer
		  drawOutline: true;
		  drawForm: false;
		  yourself
]

{ #category : #rendering }
IVOutlineRenderer >> renderBox: anObject on: aCanvas [

	self renderOutline: anObject on: aCanvas
]

{ #category : #rendering }
IVOutlineRenderer >> renderCircle: anObject on: aCanvas [

	anObject onXPlane ifTrue: [
		^ self
			  drawXCircle: anObject center
			  diameter: anObject radius * 2
			  on: aCanvas ].
	anObject onYPlane ifTrue: [
		^ self
			  drawYCircle: anObject center
			  diameter: anObject radius * 2
			  on: aCanvas ].
	anObject onZPlane ifTrue: [
		^ self
			  drawZCircle: anObject center
			  diameter: anObject radius * 2
			  on: aCanvas ]
]

{ #category : #rendering }
IVOutlineRenderer >> renderCylinder: anObject on: aCanvas [

	| values bottomExtent topExtent back p1 p2 topDelta bottomDelta form center angle |
	values := self cylinderValuesOf: anObject.
	back := values first.
	angle := values second.

	bottomExtent := projector extentOfSquareSide:
		                anObject bottomRadius * 2.
	center := self ivPointToPoint: back.
	form := self
		        semiOvalFormExtent: bottomExtent
		        fillColor: Color transparent
		        borderWidth: 1
		        borderColor: lineColor.
	form := form rotateBy: angle.
	self drawForm: form center: center on: aCanvas.

	topExtent := projector extentOfSquareSide: anObject radius * 2.
	center := self ivPointToPoint: anObject center.
	form := self
		        ovalFormExtent: topExtent
		        fillColor: Color transparent
		        borderWidth: 1
		        borderColor: lineColor.
	form := form rotateBy: angle.
	self drawForm: form center: center on: aCanvas.

	topDelta := Point r: topExtent x // 2 degrees: angle.
	bottomDelta := Point r: bottomExtent x // 2 degrees: angle.
	p1 := self ivPointToPoint: anObject center.
	p2 := self ivPointToPoint: back.
	aCanvas
		line: p1 + topDelta
		to: p2 + bottomDelta
		width: 1
		color: lineColor.
	aCanvas
		line: p1 - topDelta
		to: p2 - bottomDelta
		width: 1
		color: lineColor
]

{ #category : #rendering }
IVOutlineRenderer >> renderFrame: anObject on: aCanvas [

	| vertices |
	self renderOutline: anObject on: aCanvas.
	vertices := anObject frameVertices.
	self drawLineFrom: vertices ninth to: (vertices at: 10) on: aCanvas.
	self drawLineFrom: (vertices at: 10) to: (vertices at: 12) on: aCanvas.
	self
		drawLineFrom: (vertices at: 12)
		to: (vertices at: 11)
		on: aCanvas.
	self drawLineFrom: (vertices at: 11) to: vertices ninth on: aCanvas
]

{ #category : #rendering }
IVOutlineRenderer >> renderHole: anObject on: aCanvas [

	| vertices |
	vertices := anObject vertices.
	self drawLineFrom: vertices first to: vertices fourth on: aCanvas.
	self drawLineFrom: vertices second to: vertices third on: aCanvas.
	self drawLineFrom: vertices sixth to: vertices seventh on: aCanvas.
	self drawLineFrom: vertices first to: vertices fifth on: aCanvas.
	self drawLineFrom: vertices second to: vertices sixth on: aCanvas.
	self drawLineFrom: vertices third to: vertices seventh on: aCanvas.
	self drawLineFrom: vertices fourth to: vertices third on: aCanvas.
	self drawLineFrom: vertices first to: vertices second on: aCanvas.
	self drawLineFrom: vertices fifth to: vertices sixth on: aCanvas.
	self drawLineFrom: vertices eighth to: vertices fourth on: aCanvas.
	self drawLineFrom: vertices eighth to: vertices seventh on: aCanvas.
	self drawLineFrom: vertices eighth to: vertices fifth on: aCanvas
]

{ #category : #rendering }
IVOutlineRenderer >> renderImage: anObject on: aCanvas [

	| origin w h |
	origin := self ivPointToPoint: anObject origin.
	w := anObject form width.
	h := anObject form height.
	aCanvas
		line: origin
		to: origin + (w @ 0)
		width: 1
		color: lineColor.
	aCanvas
		line: origin + (w @ 0)
		to: origin + (w @ h negated)
		width: 1
		color: lineColor.
	aCanvas
		line: origin + (w @ h negated)
		to: origin + (0 @ h negated)
		width: 1
		color: lineColor.
	aCanvas
		line: origin + (0 @ h negated)
		to: origin
		width: 1
		color: lineColor
]

{ #category : #rendering }
IVOutlineRenderer >> renderMirror: anObject on: aCanvas [

	| vertices |
	vertices := anObject yVertices.
	self drawLineFrom: vertices first to: vertices second on: aCanvas.
	self drawLineFrom: vertices second to: vertices third on: aCanvas.
	self drawLineFrom: vertices third to: vertices fourth on: aCanvas.
	self drawLineFrom: vertices fourth to: vertices first on: aCanvas
]

{ #category : #private }
IVOutlineRenderer >> renderOutline: anObject on: aCanvas [

	| vertices |
	vertices := anObject vertices.
	self drawLineFrom: vertices first to: vertices fourth on: aCanvas.
	self drawLineFrom: vertices second to: vertices third on: aCanvas.
	self drawLineFrom: vertices sixth to: vertices seventh on: aCanvas.
	self drawLineFrom: vertices first to: vertices fifth on: aCanvas.
	self drawLineFrom: vertices second to: vertices sixth on: aCanvas.
	self drawLineFrom: vertices third to: vertices seventh on: aCanvas.
	self drawLineFrom: vertices fourth to: vertices third on: aCanvas.
	self drawLineFrom: vertices first to: vertices second on: aCanvas.
	self drawLineFrom: vertices fifth to: vertices sixth on: aCanvas
]

{ #category : #rendering }
IVOutlineRenderer >> renderPolyhedron: anObject on: aCanvas [

	| vertices first last pos pos2 |
	vertices := anObject vertices.
	vertices do: [ :each |
		last := first := each first.
		each allButFirstDo: [ :each2 |
			self drawLineFrom: last to: each2 on: aCanvas.
			last := each2 ].
		self drawLineFrom: last to: first on: aCanvas ].
	anObject visibleVertices do: [ :each |
		pos := vertices first at: each.
		pos2 := vertices second at: each.
		self drawLineFrom: pos to: pos2 on: aCanvas ]
]

{ #category : #rendering }
IVOutlineRenderer >> renderRectangle: anObject on: aCanvas [

	| vertices |
	vertices := anObject vertices.
	self drawLineFrom: vertices first to: vertices second on: aCanvas.
	self drawLineFrom: vertices second to: vertices third on: aCanvas.
	self drawLineFrom: vertices third to: vertices fourth on: aCanvas.
	self drawLineFrom: vertices fourth to: vertices first on: aCanvas
]

{ #category : #rendering }
IVOutlineRenderer >> renderWoodenFloor: anObject on: aCanvas [

	self renderOutline: anObject on: aCanvas
]
