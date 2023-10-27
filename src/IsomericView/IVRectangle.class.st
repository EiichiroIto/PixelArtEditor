Class {
	#name : #IVRectangle,
	#superclass : #IVPlane,
	#instVars : [
		'height',
		'width'
	],
	#category : #'IsomericView-Core'
}

{ #category : #converting }
IVRectangle >> asPresenter [

	^ SpIVRectanglePresenter new
		  label: label;
		  origin: origin;
		  plane: plane;
		  width: width;
		  height: height;
		  topMaterial: topMaterial;
		  form: form;
		  model: self;
		  yourself
]

{ #category : #accessing }
IVRectangle >> corner [

	^ origin + self extent
]

{ #category : #accessing }
IVRectangle >> extent [

	self onXPlane ifTrue: [ ^ IVPoint x: 1 y: width z: height ].
	self onYPlane ifTrue: [ ^ IVPoint x: width y: 1 z: height ].
	self onZPlane ifTrue: [ ^ IVPoint x: width y: height z: 1 ].
	^ IVPoint x: 0 y: 0 z: 0
]

{ #category : #accessing }
IVRectangle >> height [

	^ height
]

{ #category : #accessing }
IVRectangle >> height: anObject [

	height := anObject
]

{ #category : #api }
IVRectangle >> renderSelector [

	^ #renderRectangle:on:
]

{ #category : #accessing }
IVRectangle >> vertices [

	self onXPlane ifTrue: [
		^ {
			  origin.
			  (origin + (IVPoint x: 0 y: 0 z: height)).
			  (origin + (IVPoint x: 0 y: width z: height)).
			  (origin + (IVPoint x: 0 y: width z: 0)) } ].
	self onYPlane ifTrue: [
		^ {
			  origin.
			  (origin + (IVPoint x: 0 y: 0 z: height)).
			  (origin + (IVPoint x: width y: 0 z: height)).
			  (origin + (IVPoint x: width y: 0 z: 0)) } ].
	self onZPlane ifTrue: [
		^ {
			  origin.
			  (origin + (IVPoint x: 0 y: height z: 0)).
			  (origin + (IVPoint x: width y: height z: 0)).
			  (origin + (IVPoint x: width y: 0 z: 0)) } ].
	self error
]

{ #category : #accessing }
IVRectangle >> width [

	^ width
]

{ #category : #accessing }
IVRectangle >> width: anObject [

	width := anObject
]
