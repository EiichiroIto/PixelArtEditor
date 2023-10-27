Class {
	#name : #PixelArtEditor,
	#superclass : #Object,
	#instVars : [
		'form'
	],
	#category : #'PixelArtEditor-Core'
}

{ #category : #abstract }
PixelArtEditor class >> pointsOfline: aPoint to: aPoint2 [

	| delta sign err err2 pos result |
	result := Set new.
	delta := (aPoint2 - aPoint) abs.
	sign := (aPoint2 - aPoint) sign.
	err := delta x - delta y.
	pos := aPoint.
	[
	result add: pos.
	pos = aPoint2 ifTrue: [ ^ result ].
	err2 := 2 * err.
	err2 > delta y negated ifTrue: [
		err := err - delta y.
		pos := pos x + sign x @ pos y ].
	err2 < delta x ifTrue: [
		err := err + delta x.
		pos := pos x @ (pos y + sign y) ] ] repeat
]

{ #category : #api }
PixelArtEditor >> colorAt: aPoint [

	(self containsPoint: aPoint) ifFalse: [ ^ nil ].
	^ form colorAt: aPoint
]

{ #category : #api }
PixelArtEditor >> colorAt: aPoint put: aColor [

	(self containsPoint: aPoint) ifFalse: [ ^ nil ].
	form colorAt: aPoint put: aColor
]

{ #category : #testing }
PixelArtEditor >> containsPoint: aPoint [

	^ (0 @ 0 extent: form extent) containsPoint: aPoint
]

{ #category : #api }
PixelArtEditor >> drawOval: aRectangle color: aColor [

	| canvas |
	canvas := FormCanvas on: form.
	canvas
		fillOval: (aRectangle extendBy: (0 @ 0 corner: 1 @ 1))
		color: aColor
		borderWidth: 0
		borderColor: nil
]

{ #category : #api }
PixelArtEditor >> drawRectangle: aRectangle color: aColor [

	form
		fill: (aRectangle extendBy: (0 @ 0 corner: 1 @ 1))
		rule: Form over
		fillColor: aColor
]

{ #category : #accessing }
PixelArtEditor >> extent [

	^ form extent
]

{ #category : #api }
PixelArtEditor >> flipHorizontally [

	form := form flipBy: #horizontal centerAt: 0 @ 0
]

{ #category : #api }
PixelArtEditor >> flipVertically [

	form := form flipBy: #vertical centerAt: 0 @ 0
]

{ #category : #accessing }
PixelArtEditor >> form [

	^ form
]

{ #category : #accessing }
PixelArtEditor >> form: anObject [

	form := anObject
]

{ #category : #accessing }
PixelArtEditor >> height [

	^ form height
]

{ #category : #testing }
PixelArtEditor >> isTransparentCol: anInteger [

	| pos c |
	0 to: form height - 1 do: [ :each |
		pos := anInteger @ each.
		c := self colorAt: pos.
		(c isNil or: [ c = Color transparent ]) ifFalse: [ ^ false ].
		pos := pos + (0 @ 1) ].
	^ true
]

{ #category : #testing }
PixelArtEditor >> isTransparentRow: anInteger [

	| pos |
	0 to: form width - 1 do: [ :each |
		pos := each @ anInteger.
		(self colorAt: pos) = Color transparent ifFalse: [ ^ false ].
		pos := pos + (1 @ 0) ].
	^ true
]

{ #category : #api }
PixelArtEditor >> line: aPoint to: aPoint2 color: aColor [

	| points |
	points := self class pointsOfline: aPoint to: aPoint2.
	points do: [ :each | form colorAt: each put: aColor ]
]

{ #category : #api }
PixelArtEditor >> newExtent: aPoint [

	form := form newExtent: aPoint
]

{ #category : #api }
PixelArtEditor >> newHeight: anInteger [

	form := form newExtent: form width @ anInteger
]

{ #category : #api }
PixelArtEditor >> newWidth: anInteger [

	form := form newExtent: anInteger @ form height
]

{ #category : #api }
PixelArtEditor >> numColors [

	^ form colorsUsed size
]

{ #category : #api }
PixelArtEditor >> paint: aColor baseColor: aColor2 at: aPoint direction: aPoint2 threshold: anInteger [

	| pos continue c |
	self colorAt: aPoint put: aColor.
	pos := aPoint + aPoint2.
	continue := true.
	[ (self containsPoint: pos) & continue ] whileTrue: [
		c := self colorAt: pos.
		(c diff: aColor2) > anInteger
			ifTrue: [ continue := false ]
			ifFalse: [
				self colorAt: pos put: aColor.
				pos := pos + aPoint2 ] ].
	pos := aPoint - aPoint2.
	continue := true.
	[ (self containsPoint: pos) & continue ] whileTrue: [
		c := self colorAt: pos.
		(c diff: aColor2) > anInteger
			ifTrue: [ continue := false ]
			ifFalse: [
				self colorAt: pos put: aColor.
				pos := pos - aPoint2 ] ]
]

{ #category : #api }
PixelArtEditor >> reduceColors [

	| newForm |
	newForm := Form extent: form extent depth: 32.
	form as8BitColorForm displayOn: newForm at: 0 @ 0.
	form := newForm
]

{ #category : #api }
PixelArtEditor >> replaceColor: aColor withColor: aColor2 [

	form replaceColor: aColor withColor: aColor2
]

{ #category : #api }
PixelArtEditor >> rotateLeft [

	form := form rotateBy: -90
]

{ #category : #api }
PixelArtEditor >> rotateRight [

	form := form rotateBy: 90
]

{ #category : #api }
PixelArtEditor >> trimHorizontally [

	| left right continue newForm |
	left := 0.
	continue := true.
	[ left < form width and: [ continue ] ] whileTrue: [
		(self isTransparentCol: left)
			ifTrue: [ left := left + 1 ]
			ifFalse: [ continue := false ] ].
	left >= form width ifTrue: [ ^ self ].
	right := form width - 1.
	continue := true.
	[ right >= 0 and: [ continue ] ] whileTrue: [
		(self isTransparentCol: right)
			ifTrue: [ right := right - 1 ]
			ifFalse: [ continue := false ] ].
	left > right ifTrue: [ ^ self ].
	newForm := Form extent: (right - left + 1) @ form height depth: 32.
	(BitBlt
		 destForm: newForm
		 sourceForm: form
		 halftoneForm: nil
		 combinationRule: Form over
		 destOrigin: 0 @ 0
		 sourceOrigin: left @ 0
		 extent: right - left + 1 @ form height
		 clipRect: newForm boundingBox) copyBits.
	form := newForm
]

{ #category : #api }
PixelArtEditor >> trimVertically [

	| top bottom continue newForm newExtent |
	top := 0.
	continue := true.
	[ top < form height and: [ continue ] ] whileTrue: [
		(self isTransparentRow: top)
			ifTrue: [ top := top + 1 ]
			ifFalse: [ continue := false ] ].
	top >= form height ifTrue: [ ^ self ].
	bottom := form height - 1.
	continue := true.
	[ bottom >= 0 and: [ continue ] ] whileTrue: [
		(self isTransparentRow: bottom)
			ifTrue: [ bottom := bottom - 1 ]
			ifFalse: [ continue := false ] ].
	top > bottom ifTrue: [ ^ self ].
	newExtent := form width @ (bottom - top + 1).
	newForm := Form extent: newExtent depth: 32.
	(BitBlt
		 destForm: newForm
		 sourceForm: form
		 halftoneForm: nil
		 combinationRule: Form over
		 destOrigin: 0 @ 0
		 sourceOrigin: 0 @ top
		 extent: newExtent
		 clipRect: newForm boundingBox) copyBits.
	form := newForm
]

{ #category : #accessing }
PixelArtEditor >> width [

	^ form width
]
