Class {
	#name : #PAPaletteMorph,
	#superclass : #PAViewerMorph,
	#instVars : [
		'penSize'
	],
	#category : #'PixelArtEditor-View'
}

{ #category : #accessing }
PAPaletteMorph >> colorAt: aPoint [

	form ifNil: [ ^ Color transparent ].
	^ form colorAt: aPoint
]

{ #category : #accessing }
PAPaletteMorph >> colorAt: aPoint put: aColor [

	| canvas rect |
	form ifNil: [ ^ self ].
	canvas := FormCanvas on: form.
	rect := Rectangle center: aPoint extent: penSize.
	canvas fillRectangle: rect color: aColor.
	self changed
]

{ #category : #initialization }
PAPaletteMorph >> initialize [

	super initialize.
	penSize := 1 @ 1
]

{ #category : #accessing }
PAPaletteMorph >> penSize [

	^ penSize
]

{ #category : #accessing }
PAPaletteMorph >> penSize: anObject [

	penSize := anObject
]
