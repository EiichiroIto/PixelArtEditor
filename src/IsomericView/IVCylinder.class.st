Class {
	#name : #IVCylinder,
	#superclass : #IVPlane,
	#instVars : [
		'height',
		'radius',
		'bottomRadius',
		'sideMaterial'
	],
	#category : #'IsomericView-Core'
}

{ #category : #converting }
IVCylinder >> asPresenter [

	^ SpIVCylinderPresenter new
		  label: label;
		  origin: origin;
		  plane: plane;
		  height: height;
		  radius: radius;
		  bottomRadius: bottomRadius;
		  topMaterial: topMaterial;
		  sideMaterial: sideMaterial;
		  form: form;
		  model: self;
		  yourself
]

{ #category : #accessing }
IVCylinder >> bottomRadius [

	^ bottomRadius ifNil: [ radius ]
]

{ #category : #accessing }
IVCylinder >> bottomRadius: anObject [

	bottomRadius := anObject
]

{ #category : #accessing }
IVCylinder >> center [

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
IVCylinder >> center: anObject [

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
IVCylinder >> extent [

	self onXPlane ifTrue: [ ^ IVPoint x: height y: radius * 2 z: radius * 2 ].
	self onYPlane ifTrue: [ ^ IVPoint x: radius * 2 y: height z: radius * 2 ].
	self onZPlane ifTrue: [ ^ IVPoint x: radius * 2 y: radius * 2 z: height ].
	^ IVPoint x: 0 y: 0 z: 0
]

{ #category : #accessing }
IVCylinder >> height [

	^ height
]

{ #category : #accessing }
IVCylinder >> height: anObject [

	height := anObject
]

{ #category : #accessing }
IVCylinder >> radius [

	^ radius
]

{ #category : #accessing }
IVCylinder >> radius: anObject [

	| c |
	c := self center.
	radius := anObject.
	self center: c
]

{ #category : #api }
IVCylinder >> renderSelector [

	^ #renderCylinder:on:
]

{ #category : #accessing }
IVCylinder >> setRadius: anInteger [

	radius := anInteger
]

{ #category : #accessing }
IVCylinder >> sideMaterial [

	^ sideMaterial
]

{ #category : #accessing }
IVCylinder >> sideMaterial: anObject [

	sideMaterial := anObject
]
