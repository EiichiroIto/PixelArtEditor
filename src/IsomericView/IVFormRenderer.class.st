Class {
	#name : #IVFormRenderer,
	#superclass : #IVRenderer,
	#category : #'IsomericView-Renderer'
}

{ #category : #converting }
IVFormRenderer >> asFormRenderer [

	^ self
]

{ #category : #converting }
IVFormRenderer >> asRendererMixer [

	^ super asRendererMixer
		  drawOutline: false;
		  drawForm: true;
		  yourself
]

{ #category : #testing }
IVFormRenderer >> isFormRenderer [

	^ true
]

{ #category : #rendering }
IVFormRenderer >> renderBox: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderCircle: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderCylinder: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderForm: anObject on: aCanvas [

	| p |
	p := (self ivPointToPoint: anObject origin) + anObject form offset.
	aCanvas translucentImage: anObject form at: p
]

{ #category : #rendering }
IVFormRenderer >> renderFrame: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderHole: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderImage: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self asSurfaceRenderer renderImage: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderMirror: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderPolyhedron: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderRectangle: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]

{ #category : #rendering }
IVFormRenderer >> renderWoodenFloor: anObject on: aCanvas [

	anObject hasForm ifFalse: [ ^ self ].
	self renderForm: anObject on: aCanvas
]
