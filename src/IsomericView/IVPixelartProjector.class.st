Class {
	#name : #IVPixelartProjector,
	#superclass : #IVProjector,
	#category : #'IsomericView-Renderer'
}

{ #category : #examples }
IVPixelartProjector class >> exampleOval [

	| f c cos sin r r2 ex k ox mx |
	f := Form extent: 360 @ 180 depth: 32.
	f fillColor: Color white.
	c := FormCanvas on: f.
	c
		line: 0 @ 89
		to: 179 @ 0
		width: 1
		color: Color black.
	c
		line: 179 @ 0
		to: 359 @ 89
		width: 1
		color: Color black.
	c
		line: 0 @ 89
		to: 179 @ 179
		width: 1
		color: Color black.
	c
		line: 179 @ 179
		to: 359 @ 89
		width: 1
		color: Color black.

	cos := 0.5 arcTan cos.
	sin := 0.5 arcTan sin.
	k := (180 / cos) rounded.
	ox := k * cos / 2.
	mx := k * sin / 2.
	r2 := Rectangle center: 179 @ 89 extent: ox @ mx * 2.
	c
		drawRectangle: r2
		color: Color transparent
		borderWidth: 1
		borderColor: Color green.
	f.

	ex := IVPixelartProjector new extentOfSquareSide: k.
	r2 := Rectangle center: 179 @ 89 extent: ex.
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
IVPixelartProjector >> asPixelartProjector [

	^ self
]

{ #category : #constants }
IVPixelartProjector >> axisAngle [

	^ 0.5 arcTan radiansToDegrees
]

{ #category : #constants }
IVPixelartProjector >> cosValue [
	"cos(26.56505117707799)"

	^ 0.5 arcTan cos
]

{ #category : #constants }
IVPixelartProjector >> cosValue2 [
	"(90 - (self axisAngle * 2)) degreeCos"

	^ 0.8
]

{ #category : #accessing }
IVPixelartProjector >> name [

	^ 'PixelartProjector'
]

{ #category : #constants }
IVPixelartProjector >> sinValue [
	"sin(26.56505117707799)"

	^ 0.5 arcTan sin
]

{ #category : #constants }
IVPixelartProjector >> sinValue2 [
	"(90 - (self axisAngle * 2)) degreeSin"

	^ 0.6
]

{ #category : #constants }
IVPixelartProjector >> tanValue [

	^ 0.5
]

{ #category : #constants }
IVPixelartProjector >> tanValue2 [
	"tan(90 - (26.56505117707799 * 2))"

	^ 0.75
]
