Class {
	#name : #IVCircle,
	#superclass : #IVPlane,
	#instVars : [
		'radius'
	],
	#category : #'IsomericView-Core'
}

{ #category : #converting }
IVCircle >> asPresenter [

	^ SpIVCirclePresenter new
		  label: label;
		  origin: origin;
		  plane: plane;
		  radius: radius;
		  topMaterial: topMaterial;
		  form: form;
		  model: self;
		  yourself
]

{ #category : #accessing }
IVCircle >> center [

	radius ifNil: [ ^ origin ].
	self onXPlane ifTrue: [
		^ IVPoint x: origin x y: origin y + radius z: origin z + radius ].
	self onYPlane ifTrue: [
		^ IVPoint x: origin x + radius y: origin y z: origin z + radius ].
	self onZPlane ifTrue: [
		^ IVPoint x: origin x + radius y: origin y + radius z: origin z ].
	self error
]

{ #category : #accessing }
IVCircle >> center: anObject [

	radius ifNil: [ ^ origin := anObject ].
	self onXPlane ifTrue: [
		^ origin := IVPoint
			            x: anObject x
			            y: anObject y - radius
			            z: anObject z - radius ].
	self onYPlane ifTrue: [
		^ origin := IVPoint
			            x: anObject x - radius
			            y: anObject y
			            z: anObject z - radius ].
	self onZPlane ifTrue: [
		^ origin := IVPoint
			            x: anObject x - radius
			            y: anObject y - radius
			            z: anObject z ].
	self error
]

{ #category : #accessing }
IVCircle >> corner [

	self onXPlane ifTrue: [
		^ IVPoint
			  x: origin x
			  y: radius * 2 + origin y
			  z: radius * 2 + origin z ].
	self onYPlane ifTrue: [
		^ IVPoint
			  x: radius * 2 + origin x
			  y: origin y
			  z: radius * 2 + origin z ].
	self onZPlane ifTrue: [
		^ IVPoint
			  x: radius * 2 + origin x
			  y: radius * 2 + origin y
			  z: origin z ].
	self error
]

{ #category : #accessing }
IVCircle >> extent [

	self onXPlane ifTrue: [ ^ IVPoint x: 0 y: radius * 2 z: radius * 2 ].
	self onYPlane ifTrue: [ ^ IVPoint x: radius * 2 y: 0 z: radius * 2 ].
	self onZPlane ifTrue: [ ^ IVPoint x: radius * 2 y: radius * 2 z: 0 ].
	^ IVPoint x: 0 y: 0 z: 0
]

{ #category : #accessing }
IVCircle >> radius [

	^ radius
]

{ #category : #accessing }
IVCircle >> radius: anObject [

	| c |
	c := self center.
	radius := anObject.
	self center: c
]

{ #category : #api }
IVCircle >> renderSelector [

	^ #renderCircle:on:
]

{ #category : #accessing }
IVCircle >> setRadius: anInteger [

	radius := anInteger
]
