Class {
	#name : #IVBox,
	#superclass : #IVObject,
	#instVars : [
		'extent',
		'surface'
	],
	#category : #'IsomericView-Core'
}

{ #category : #converting }
IVBox >> asPresenter [

	^ SpIVBoxPresenter new
		  label: label;
		  origin: origin;
		  objectExtent: extent;
		  surface: surface;
		  form: form;
		  model: self;
		  yourself
]

{ #category : #accessing }
IVBox >> corner [

	^ origin + extent
]

{ #category : #accessing }
IVBox >> corner: anObject [

	| minX minY minZ maxX maxY maxZ |
	minX := origin x min: anObject x.
	minY := origin y min: anObject y.
	minZ := origin z min: anObject z.
	maxX := origin x max: anObject x.
	maxY := origin y max: anObject y.
	maxZ := origin z max: anObject z.
	origin := IVPoint x: minX y: minY z: minZ.
	extent := IVPoint x: maxX - minX y: maxY - minY z: maxZ - minZ
]

{ #category : #copying }
IVBox >> deepCopy [

	^ self copy
		  surface: surface deepCopy;
		  yourself
]

{ #category : #accessing }
IVBox >> extent [

	^ extent
]

{ #category : #accessing }
IVBox >> extent: anObject [

	extent := anObject
]

{ #category : #testing }
IVBox >> hasSurface [

	^ surface notNil
]

{ #category : #initialization }
IVBox >> initialize [

	super initialize.
	surface := IVSurface new
]

{ #category : #testing }
IVBox >> isSurfaceDefined [

	^ surface notNil and: [ surface isDefined ]
]

{ #category : #testing }
IVBox >> onXPlane [

	^ self extent x < self extent y and: [ self extent x < self extent z ]
]

{ #category : #testing }
IVBox >> onYPlane [

	^ self extent y < self extent x and: [ self extent y < self extent z ]
]

{ #category : #testing }
IVBox >> onZPlane [

	^ self extent z < self extent x and: [ self extent z < self extent y ]
]

{ #category : #printing }
IVBox >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: '['.
	label ifNotNil: [
		aStream
			nextPutAll: '"';
			nextPutAll: label asString;
			nextPutAll: '",' ].
	aStream nextPutAll: 'origin=('.
	origin
		ifNil: [ aStream nextPutAll: 'nil' ]
		ifNotNil: [ :p | p printTripletOn: aStream ].
	aStream nextPutAll: '),extent=('.
	extent
		ifNil: [ aStream nextPutAll: 'nil' ]
		ifNotNil: [ :p | p printTripletOn: aStream ].
	aStream nextPutAll: ')]'
]

{ #category : #api }
IVBox >> renderSelector [

	^ #renderBox:on:
]

{ #category : #accessing }
IVBox >> surface [

	^ surface
]

{ #category : #accessing }
IVBox >> surface: anObject [

	surface := anObject
]

{ #category : #api }
IVBox >> vertices [

	| minX maxX minY maxY minZ maxZ |
	minX := origin x.
	minY := origin y.
	minZ := origin z.
	maxX := self corner x.
	maxY := self corner y.
	maxZ := self corner z.
	^ {
		  (IVPoint x: minX y: minY z: minZ).
		  (IVPoint x: minX y: minY z: maxZ).
		  (IVPoint x: minX y: maxY z: maxZ).
		  (IVPoint x: minX y: maxY z: minZ).
		  (IVPoint x: maxX y: minY z: minZ).
		  (IVPoint x: maxX y: minY z: maxZ).
		  (IVPoint x: maxX y: maxY z: maxZ).
		  (IVPoint x: maxX y: maxY z: minZ) }
]

{ #category : #api }
IVBox >> xMaterial [

	surface ifNil: [ ^ nil ].
	^ surface xMaterial
]

{ #category : #api }
IVBox >> yMaterial [

	surface ifNil: [ ^ nil ].
	^ surface yMaterial
]

{ #category : #api }
IVBox >> zMaterial [

	surface ifNil: [ ^ nil ].
	^ surface zMaterial
]
