Extension { #name : #Color }

{ #category : #'*IsomericView' }
Color >> render: aRenderer polygon: aCollection on: aCanvas [

	aRenderer fillPolygon: aCollection color: self on: aCanvas
]

{ #category : #'*IsomericView' }
Color >> renderXCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer
		fillXCircle: aPoint
		color: self
		diameter: anInteger
		on: aCanvas
]

{ #category : #'*IsomericView' }
Color >> renderXRectangle: aRenderer y: anInteger z: anInteger2 at: aPoint on: aCanvas [

	aRenderer
		fillXRectangle: aPoint
		y: anInteger
		z: anInteger2
		color: self
		on: aCanvas
]

{ #category : #'*IsomericView' }
Color >> renderYCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer
		fillYCircle: aPoint
		color: self
		diameter: anInteger
		on: aCanvas
]

{ #category : #'*IsomericView' }
Color >> renderYRectangle: aRenderer x: anInteger z: anInteger2 at: aPoint on: aCanvas [

	aRenderer
		fillYRectangle: aPoint
		x: anInteger
		z: anInteger2
		color: self
		on: aCanvas
]

{ #category : #'*IsomericView' }
Color >> renderZCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer
		fillZCircle: aPoint
		color: self
		diameter: anInteger
		on: aCanvas
]

{ #category : #'*IsomericView' }
Color >> renderZRectangle: aRenderer x: anInteger y: anInteger2 at: aPoint on: aCanvas [

	aRenderer
		fillZRectangle: aPoint
		x: anInteger
		y: anInteger2
		color: self
		on: aCanvas
]
