Class {
	#name : #IVNormalProjector,
	#superclass : #IVProjector,
	#category : #'IsomericView-Renderer'
}

{ #category : #examples }
IVNormalProjector class >> exampleOval [

	| f c cos sin r r2 ex k ox mx |
	f := Form extent: 360 @ 208 depth: 32.
	f fillColor: Color white.
	c := FormCanvas on: f.
	c
		line: 0 @ 103
		to: 179 @ 0
		width: 1
		color: Color black.
	c
		line: 179 @ 0
		to: 359 @ 103
		width: 1
		color: Color black.
	c
		line: 0 @ 103
		to: 179 @ 207
		width: 1
		color: Color black.
	c
		line: 179 @ 207
		to: 359 @ 103
		width: 1
		color: Color black.

	cos := 30 degreeCos.
	sin := 30 degreeSin.
	k := (180 / cos) rounded.
	ox := k * cos / 2.
	mx := k * sin / 2.
	r2 := Rectangle center: 179 @ 103 extent: ox @ mx * 2.
	c
		drawRectangle: r2
		color: Color transparent
		borderWidth: 1
		borderColor: Color green.
	f.

	ex := IVNormalProjector new extentOfSquareSide: k.
	r2 := Rectangle center: 179 @ 103 extent: ex.
	c
		drawRectangle: r2
		color: Color transparent
		borderWidth: 1
		borderColor: Color blue.
	c
		drawOval: r2
		color: Color transparent
		borderWidth: 1
		borderColor: Color blue.
	f inspect.
]

{ #category : #converting }
IVNormalProjector >> asNormalProjector [

	^ self
]

{ #category : #constants }
IVNormalProjector >> axisAngle [

	^ 30
]

{ #category : #constants }
IVNormalProjector >> cosValue [

	^ 30 degreeCos
]

{ #category : #constants }
IVNormalProjector >> cosValue2 [

	^ self cosValue
]

{ #category : #accessing }
IVNormalProjector >> name [

	^ 'NormalProjector'
]

{ #category : #constants }
IVNormalProjector >> sinValue [

	^ 30 degreeSin
]

{ #category : #constants }
IVNormalProjector >> tanValue [

	^ 1 / 3 sqrt
]

{ #category : #constants }
IVNormalProjector >> tanValue2 [

	^ self tanValue
]
