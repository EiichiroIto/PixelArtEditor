Class {
	#name : #IVMorph,
	#superclass : #Morph,
	#instVars : [
		'form'
	],
	#category : #'IsomericView-View'
}

{ #category : #drawing }
IVMorph >> drawOn: aCanvas [

	| form2 scale |
	super drawOn: aCanvas.
	form ifNil: [ ^ self ].
	scale := self extent / form extent.
	scale := 1 @ 1 * (scale x min: scale y).
	form2 := form magnify: form boundingBox by: scale smoothing: 1.
	aCanvas translucentImage: form2 at: self topLeft
]

{ #category : #accessing }
IVMorph >> form [

	^ form
]

{ #category : #accessing }
IVMorph >> form: anObject [

	form := anObject
]
