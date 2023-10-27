Extension { #name : #Form }

{ #category : #'*IsomericView' }
Form >> asSquare [

	| newExtent dest delta |
	newExtent := self extent max asPoint.
	dest := self class extent: newExtent depth: self depth.
	delta := newExtent - self extent // 2.
	(BitBlt
		 destForm: dest
		 sourceForm: self
		 halftoneForm: nil
		 combinationRule: Form over
		 destOrigin: delta
		 sourceOrigin: 0 @ 0
		 extent: self extent
		 clipRect: dest boundingBox) copyBits.
	^ dest
]

{ #category : #'*IsomericView' }
Form >> expandTo: aPoint [

	| dest |
	dest := self class extent: aPoint depth: self depth.
	(WarpBlt toForm: dest)
		sourceForm: self destRect: dest boundingBox;
		combinationRule: self class over;
		cellSize: 2;
		warpBits.
	^ dest
]

{ #category : #'*IsomericView' }
Form >> newExtent: aPoint [

	^ (aPoint x > width or: [ aPoint y > height ])
		  ifTrue: [
			  self
				  contentsOfArea: (Rectangle origin: 0 @ 0 extent: aPoint)
				  into: (Form extent: aPoint depth: depth) ]
		  ifFalse: [
		  self contentsOfArea: (Rectangle origin: 0 @ 0 extent: aPoint) ]
]

{ #category : #'*IsomericView' }
Form >> renderXCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer drawXCircle: aPoint diameter: anInteger on: aCanvas
]

{ #category : #'*IsomericView' }
Form >> renderXRectangle: aRenderer y: anInteger z: anInteger2 at: aPoint on: aCanvas [

	aRenderer
		drawXImage: self
		y: anInteger
		z: anInteger2
		at: aPoint
		on: aCanvas
]

{ #category : #'*IsomericView' }
Form >> renderYCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer drawYCircle: aPoint diameter: anInteger on: aCanvas
]

{ #category : #'*IsomericView' }
Form >> renderYRectangle: aRenderer x: anInteger z: anInteger2 at: aPoint on: aCanvas [

	aRenderer
		drawYImage: self
		x: anInteger
		z: anInteger2
		at: aPoint
		on: aCanvas
]

{ #category : #'*IsomericView' }
Form >> renderZCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer drawZCircle: aPoint diameter: anInteger on: aCanvas
]

{ #category : #'*IsomericView' }
Form >> renderZRectangle: aRenderer x: anInteger y: anInteger2 at: aPoint on: aCanvas [

	aRenderer
		drawZImage: self
		x: anInteger
		y: anInteger2
		at: aPoint
		on: aCanvas
]

{ #category : #'*IsomericView' }
Form >> xSkewDelta: anInteger [

	| dest top |
	dest := self class
		        extent: self extent + (anInteger @ 0)
		        depth: self depth.
	0 to: self height - 1 do: [ :each |
		top := (0 interpolateTo: anInteger at: each / (self height - 1)) rounded.
		(BitBlt
			 destForm: dest
			 sourceForm: self
			 halftoneForm: nil
			 combinationRule: self class over
			 destOrigin: top @ each
			 sourceOrigin: 0 @ each
			 extent: self width @ 1
			 clipRect: dest boundingBox) copyBits ].
	^ dest
]

{ #category : #'*IsomericView' }
Form >> ySkewTan: aFloat [

	| dest delta top |
	delta := (self width * aFloat abs) rounded.
	dest := self class
		        extent: self extent + (0 @ delta)
		        depth: self depth.
	0 to: self width - 1 do: [ :each |
		top := aFloat >= 0
			       ifTrue: [ each @ (each * aFloat) rounded ]
			       ifFalse: [ each @ (delta + (each * aFloat) rounded) ].
		(BitBlt
			 destForm: dest
			 sourceForm: self
			 halftoneForm: nil
			 combinationRule: self class over
			 destOrigin: top
			 sourceOrigin: each @ 0
			 extent: 1 @ self height
			 clipRect: dest boundingBox) copyBits ].
	^ dest
]
