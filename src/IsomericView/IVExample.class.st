Class {
	#name : #IVExample,
	#superclass : #Object,
	#instVars : [
		'morph',
		'renderer',
		'objects'
	],
	#category : #'IsomericView-Examples'
}

{ #category : #examples }
IVExample class >> example1 [

	| obj |
	obj := self new.
	obj changeSurfaceRenderer.
	obj objects: HorimiyaEndingScene1 new objects.
	obj show.
	PNGReadWriter
		putForm: obj morph form
		onFileNamed: 'horimiya-ending-scene1.png'
]

{ #category : #api }
IVExample >> changeNormalProjector [

	renderer projector: renderer projector asNormalProjector
]

{ #category : #api }
IVExample >> changeOutlineRenderer [

	renderer := renderer asOutlineRenderer
]

{ #category : #api }
IVExample >> changeParallelProjector [

	renderer projector: renderer projector asParallelProjector
]

{ #category : #api }
IVExample >> changePixelartProjector [

	renderer projector: renderer projector asPixelartProjector
]

{ #category : #api }
IVExample >> changeSurfaceRenderer [

	renderer := renderer asSurfaceRenderer
]

{ #category : #api }
IVExample >> extent: aPoint [

	morph extent: aPoint.
	renderer extent: aPoint
]

{ #category : #api }
IVExample >> hide [

	morph delete
]

{ #category : #initialization }
IVExample >> initialize [

	morph := IVMorph new.
	morph color: Color white.
	objects := OrderedCollection new.
	renderer := self newOutlineRenderer
]

{ #category : #accessing }
IVExample >> morph [

	^ morph
]

{ #category : #accessing }
IVExample >> morph: anObject [

	morph := anObject
]

{ #category : #'instance creation' }
IVExample >> newOutlineRenderer [

	^ IVOutlineRenderer new
		  projector: IVNormalProjector new;
		  yourself
]

{ #category : #accessing }
IVExample >> objects [

	^ objects
]

{ #category : #accessing }
IVExample >> objects: anObject [

	objects := anObject
]

{ #category : #accessing }
IVExample >> renderer [

	^ renderer
]

{ #category : #accessing }
IVExample >> renderer: anObject [

	renderer := anObject
]

{ #category : #api }
IVExample >> show [

	| form |
	renderer ifNil: [ ^ self ].
	form := renderer render: objects.
	morph
		form: form;
		changed;
		openInWorld
]
