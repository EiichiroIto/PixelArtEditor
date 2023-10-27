Class {
	#name : #IVParallelProjector,
	#superclass : #IVProjector,
	#category : #'IsomericView-Renderer'
}

{ #category : #converting }
IVParallelProjector >> asParallelProjector [

	^ self
]

{ #category : #constants }
IVParallelProjector >> axisAngle [

	^ 0
]

{ #category : #constants }
IVParallelProjector >> cosValue [
	"cosValue equals (self axisAngle degreeCos)"

	^ self axisAngle degreeCos
]

{ #category : #api }
IVParallelProjector >> ivPointToPoint: anIVPoint [

	^ anIVPoint x @ (extent y - anIVPoint y - 1)
]

{ #category : #accessing }
IVParallelProjector >> name [

	^ 'ParallelProjector'
]

{ #category : #constants }
IVParallelProjector >> sinValue [

	^ self axisAngle degreeSin
]
