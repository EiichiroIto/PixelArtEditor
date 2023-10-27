Class {
	#name : #IVPolyhedron,
	#superclass : #IVPlane,
	#instVars : [
		'polygon',
		'height',
		'visibleVertices',
		'otherColors'
	],
	#category : #'IsomericView-Core'
}

{ #category : #converting }
IVPolyhedron >> asPresenter [

	^ SpIVPolyhedronPresenter new
		  label: label;
		  origin: origin;
		  plane: plane;
		  height: height;
		  topMaterial: topMaterial;
		  polygon: polygon;
		  visibleVertices: visibleVertices;
		  otherColors: otherColors;
		  form: form;
		  model: self;
		  yourself
]

{ #category : #copying }
IVPolyhedron >> deepCopy [

	^ super deepCopy
		  polygon: polygon copy;
		  visibleVertices: visibleVertices copy;
		  otherColors: otherColors copy;
		  yourself
]

{ #category : #accessing }
IVPolyhedron >> delta [

	self onXPlane ifTrue: [ ^ IVPoint x: height y: 0 z: 0 ].
	self onYPlane ifTrue: [ ^ IVPoint x: 0 y: height z: 0 ].
	self onZPlane ifTrue: [ ^ IVPoint x: 0 y: 0 z: height negated ].
	^ IVPoint x: 0 y: 0 z: 0
]

{ #category : #accessing }
IVPolyhedron >> extent [

	| min max |
	polygon ifNil: [ ^ IVPoint zero ].
	min := max := nil.
	polygon , { self delta abs } do: [ :each |
		min := min ifNil: [ each ] ifNotNil: [ min min: each ].
		max := max ifNil: [ each ] ifNotNil: [ max max: each ] ].
	min ifNil: [ ^ IVPoint x: 0 y: 0 z: 0 ].
	^ max - min
]

{ #category : #accessing }
IVPolyhedron >> height [

	^ height
]

{ #category : #accessing }
IVPolyhedron >> height: anObject [

	height := anObject
]

{ #category : #accessing }
IVPolyhedron >> otherColors [

	^ otherColors
]

{ #category : #accessing }
IVPolyhedron >> otherColors: anObject [

	otherColors := anObject
]

{ #category : #accessing }
IVPolyhedron >> polygon [

	^ polygon
]

{ #category : #accessing }
IVPolyhedron >> polygon: anObject [

	polygon := anObject
]

{ #category : #api }
IVPolyhedron >> renderSelector [

	^ #renderPolyhedron:on:
]

{ #category : #accessing }
IVPolyhedron >> vertices [

	| top bottom |
	top := polygon collect: [ :each | origin + each ].
	bottom := top collect: [ :each | each + self delta ].
	^ {
		  top.
		  bottom }
]

{ #category : #accessing }
IVPolyhedron >> visibleVertices [

	^ visibleVertices
]

{ #category : #accessing }
IVPolyhedron >> visibleVertices: anObject [

	visibleVertices := anObject
]
