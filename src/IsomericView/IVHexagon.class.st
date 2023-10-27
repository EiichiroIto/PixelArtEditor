Class {
	#name : #IVHexagon,
	#superclass : #Object,
	#instVars : [
		'extent',
		'angle'
	],
	#category : #'IsomericView-Examples'
}

{ #category : #accessing }
IVHexagon >> angle [

	^ angle
]

{ #category : #accessing }
IVHexagon >> angle: anObject [

	angle := anObject
]

{ #category : #accessing }
IVHexagon >> extent [

	^ extent
]

{ #category : #accessing }
IVHexagon >> extent: anObject [

	extent := anObject
]

{ #category : #accessing }
IVHexagon >> vertices [

	| w h h2 d |
	w := extent x - 1.
	h := extent y - 1.
	h2 := extent y // 2.
	d := (angle degreesToRadians tan * h2) rounded.
	^ {
		  (0 @ h2).
		  (d @ 0).
		  (w - d @ 0).
		  (w @ h2).
		  (w - d @ h).
		  (d @ h) }
]
