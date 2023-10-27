Class {
	#name : #IVProjector,
	#superclass : #Object,
	#instVars : [
		'extent'
	],
	#category : #'IsomericView-Renderer'
}

{ #category : #converting }
IVProjector >> asNormalProjector [

	^ IVNormalProjector new
		  extent: extent;
		  yourself
]

{ #category : #converting }
IVProjector >> asParallelProjector [

	^ IVParallelProjector new
		  extent: extent;
		  yourself
]

{ #category : #converting }
IVProjector >> asPixelartProjector [

	^ IVPixelartProjector new
		  extent: extent;
		  yourself
]

{ #category : #constants }
IVProjector >> axisAngle [

	self subclassResponsibility
]

{ #category : #constants }
IVProjector >> cosValue [

	^ self axisAngle degreeCos
]

{ #category : #constants }
IVProjector >> cosValue2 [

	^ (90 - (self axisAngle * 2)) degreeCos
]

{ #category : #accessing }
IVProjector >> extent [

	^ extent
]

{ #category : #accessing }
IVProjector >> extent: anObject [

	extent := anObject
]

{ #category : #api }
IVProjector >> extentOfSquareSide: anInteger [

	| kcos ksin a b |
	kcos := anInteger * self cosValue.
	ksin := anInteger * self sinValue.
	b := ((kcos / 2) squared + (3 * ksin / 2) squared) sqrt - ksin.
	a := ((ksin / 2) squared + (kcos / 6) squared) sqrt + (kcos / 3).
	^ (a @ b * 2) rounded
]

{ #category : #api }
IVProjector >> extentOfXYForm: aPoint [

	^ (aPoint x * self cosValue) rounded @ aPoint y
]

{ #category : #api }
IVProjector >> extentOfZForm: aPoint [

	^ (2 * aPoint x * self cosValue) rounded @ (aPoint y * self sinValue) rounded
]

{ #category : #api }
IVProjector >> formExtentFor: anIVPoint [

	^ {
		  (self extentOfXYForm: anIVPoint y @ anIVPoint z).
		  (self extentOfXYForm: anIVPoint x @ anIVPoint z).
		  (self extentOfZForm: anIVPoint x @ anIVPoint y) }
]

{ #category : #api }
IVProjector >> ivPointToPoint: anIVPoint [

	| p w2 x y |
	w2 := extent x // 2.
	p := anIVPoint asIVPoint.
	x := w2 + (p x * self cosValue) - (p y * self cosValue).
	y := extent y - (p x * self sinValue) - (p y * self sinValue) - p z.
	^ (x @ y) rounded
]

{ #category : #accessing }
IVProjector >> name [

	self subclassResponsibility
]

{ #category : #constants }
IVProjector >> sinValue [

	^ self axisAngle degreeSin
]

{ #category : #constants }
IVProjector >> sinValue2 [

	^ (90 - (self axisAngle * 2)) degreeSin
]

{ #category : #constants }
IVProjector >> tanValue [

	^ self axisAngle degreesToRadians tan
]

{ #category : #constants }
IVProjector >> tanValue2 [

	^ (90 - (self axisAngle * 2)) degreesToRadians tan
]

{ #category : #api }
IVProjector >> xSkewedForm: aForm y: anInteger z: anInteger2 [

	| dest1 |
	dest1 := self xyForm: aForm extent: anInteger @ anInteger2.
	^ dest1 ySkewTan: self tanValue
]

{ #category : #api }
IVProjector >> xyForm: aForm extent: aPoint [

	| newExtent |
	newExtent := self extentOfXYForm: aPoint.
	aForm extent = newExtent ifTrue: [ ^ aForm ].
	^ aForm expandTo: newExtent
]

{ #category : #api }
IVProjector >> ySkewedForm: aForm x: anInteger z: anInteger2 [

	| dest1 |
	dest1 := self xyForm: aForm extent: anInteger @ anInteger2.
	^ dest1 ySkewTan: self tanValue negated
]

{ #category : #api }
IVProjector >> zForm: aForm extent: aPoint [

	| newExtent |
	newExtent := self extentOfZForm: aPoint.
	aForm extent = newExtent ifTrue: [ ^ aForm ].
	^ aForm expandTo: newExtent
]

{ #category : #api }
IVProjector >> zSkewedForm: aForm x: anInteger y: anInteger2 [

	| dest1 dest2 dest3 newExtent |
	dest1 := self zForm: aForm extent: anInteger @ anInteger2.
	dest2 := dest1 ySkewTan: self tanValue / -2.
	dest3 := dest2 xSkewDelta: self cosValue * (anInteger + anInteger2).
	newExtent := (self cosValue @ self sinValue
	              * (anInteger + anInteger2)) rounded.
	^ dest3 contentsOfArea:
		  (Rectangle origin: dest3 extent - newExtent // 2 extent: newExtent)
]
