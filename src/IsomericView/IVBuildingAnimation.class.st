Class {
	#name : #IVBuildingAnimation,
	#superclass : #Object,
	#instVars : [
		'color',
		'extent',
		'objects',
		'outlineRenderer',
		'surfaceRenderer',
		'frameDelay'
	],
	#category : #'IsomericView-Examples'
}

{ #category : #examples }
IVBuildingAnimation class >> example2 [

	| obj |
	obj := IVBuildingAnimation new objects:
		       HorimiyaEndingScene1 new objects.
	obj writeFileNamed: 'horimiya-ending1-animation.gif'
]

{ #category : #private }
IVBuildingAnimation >> animationDoing: aBlock [

	self
		phase1AnimationDoing: aBlock;
		phase2AnimationDoing: aBlock
]

{ #category : #accessing }
IVBuildingAnimation >> color [

	^ color
]

{ #category : #accessing }
IVBuildingAnimation >> color: anObject [

	color := anObject
]

{ #category : #constants }
IVBuildingAnimation >> defaultColor [

	^ Color white
]

{ #category : #constants }
IVBuildingAnimation >> defaultExtent [

	^ 480 @ 480
]

{ #category : #constants }
IVBuildingAnimation >> defaultFrameDelay [

	^ 10
]

{ #category : #constants }
IVBuildingAnimation >> defaultRate [

	^ 1
]

{ #category : #accessing }
IVBuildingAnimation >> extent [

	^ extent
]

{ #category : #accessing }
IVBuildingAnimation >> extent: anObject [

	extent := anObject
]

{ #category : #private }
IVBuildingAnimation >> frameFromForm: aForm [

	| form |
	form := aForm scaledToSize: extent.
	^ AnimatedImageFrame new
		  delay: frameDelay;
		  form: form as8BitColorForm
]

{ #category : #initialization }
IVBuildingAnimation >> initialize [

	extent := self defaultExtent.
	color := self defaultColor.
	frameDelay := self defaultFrameDelay.
	outlineRenderer := IVOutlineRenderer new
		                   extent: self renderingExtent;
		                   yourself.
	surfaceRenderer := IVSurfaceRenderer new
		                   extent: self renderingExtent;
		                   yourself
]

{ #category : #private }
IVBuildingAnimation >> newForm [

	^ (Form extent: extent depth: 32)
		  fillColor: color;
		  yourself
]

{ #category : #accessing }
IVBuildingAnimation >> objects [

	^ objects
]

{ #category : #accessing }
IVBuildingAnimation >> objects: anObject [

	objects := anObject
]

{ #category : #accessing }
IVBuildingAnimation >> outlineRenderer [

	^ outlineRenderer
]

{ #category : #accessing }
IVBuildingAnimation >> outlineRenderer: anObject [

	outlineRenderer := anObject
]

{ #category : #private }
IVBuildingAnimation >> phase1AnimationDoing: aBlock [

	| form list |
	0 to: objects size do: [ :each |
		list := objects copyFrom: 1 to: each.
		form := outlineRenderer render: list.
		aBlock value: (self frameFromForm: form) ]
]

{ #category : #private }
IVBuildingAnimation >> phase2AnimationDoing: aBlock [

	| form list1 list2 |
	0 to: objects size do: [ :each |
		list1 := objects copyFrom: 1 to: each.
		list2 := objects copyFrom: each + 1 to: objects size.
		form := surfaceRenderer render: list1.
		outlineRenderer render: list2 onForm: form.
		aBlock value: (self frameFromForm: form) ]
]

{ #category : #constants }
IVBuildingAnimation >> renderingExtent [

	^ 240 @ 240
]

{ #category : #accessing }
IVBuildingAnimation >> surfaceRenderer [

	^ surfaceRenderer
]

{ #category : #accessing }
IVBuildingAnimation >> surfaceRenderer: anObject [

	surfaceRenderer := anObject
]

{ #category : #writing }
IVBuildingAnimation >> writeFileNamed: aString [

	| writer |
	writer := GIFReadWriter on: aString asFileReference binaryWriteStream.
	writer ifNil: [ ^ self ].
	self animationDoing: [ :form | writer nextPutFrame: form ].
	writer close
]
