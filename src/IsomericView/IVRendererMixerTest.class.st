"
An IVRendererMixerTest is a test class for testing the behavior of IVRendererMixer
"
Class {
	#name : #IVRendererMixerTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #'instance creation' }
IVRendererMixerTest >> newObj [

	^ IVRendererMixer new
]

{ #category : #test }
IVRendererMixerTest >> testDrawForm [

	| obj |
	obj := self newObj.
	self deny: obj drawForm.
	obj drawForm: true.
	self assert: obj drawForm.
	obj drawForm: false.
	self deny: obj drawForm
]

{ #category : #test }
IVRendererMixerTest >> testDrawOutline [

	| obj |
	obj := self newObj.
	self assert: obj drawOutline.
	obj drawOutline: false.
	self deny: obj drawOutline.
	obj drawOutline: true.
	self assert: obj drawOutline
]

{ #category : #test }
IVRendererMixerTest >> testDrawingRange [

	| renderer rect |
	renderer := self newObj.
	rect := Rectangle origin: 10 @ 20 corner: 30 @ 40.
	self assert: renderer drawingRange isNil.
	renderer drawingRange: rect.
	renderer outlineRenderer recordPoint: 5 @ 25.
	self assert: renderer drawingRange isRectangle.
	self assert: renderer drawingRange origin equals: 5 @ 20.
	self assert: renderer drawingRange corner equals: 30 @ 40.
	renderer surfaceRenderer recordPoint: 10 @ 45.
	self assert: renderer drawingRange isRectangle.
	self assert: renderer drawingRange origin equals: 5 @ 20.
	self assert: renderer drawingRange corner equals: 30 @ 46.
	renderer formRenderer recordPoint: 0 @ 50.
	self assert: renderer drawingRange isRectangle.
	self assert: renderer drawingRange origin equals: 0 @ 20.
	self assert: renderer drawingRange corner equals: 30 @ 51
]

{ #category : #test }
IVRendererMixerTest >> testExtent [

	| renderer |
	renderer := self newObj.
	renderer projector: IVPixelartProjector new.
	self assert: renderer extent isNil.
	renderer extent: 1 @ 2.
	self assert: renderer projector extent equals: 1 @ 2.
	self assert: renderer outlineRenderer extent equals: 1 @ 2.
	self assert: renderer surfaceRenderer extent equals: 1 @ 2.
	self assert: renderer formRenderer extent equals: 1 @ 2.
	renderer extent: 3 @ 4.
	self assert: renderer projector extent equals: 3 @ 4.
	self assert: renderer outlineRenderer extent equals: 3 @ 4.
	self assert: renderer surfaceRenderer extent equals: 3 @ 4.
	self assert: renderer formRenderer extent equals: 3 @ 4
]

{ #category : #test }
IVRendererMixerTest >> testFormRenderer [

	| obj renderer |
	obj := self newObj.
	self assert: (obj formRenderer isKindOf: IVFormRenderer).
	renderer := IVFormRenderer new.
	obj formRenderer: renderer.
	self assert: obj formRenderer identicalTo: renderer
]

{ #category : #test }
IVRendererMixerTest >> testLineColor [

	| renderer |
	renderer := self newObj.
	self assert: renderer lineColor isNil.
	renderer lineColor: Color red.
	self assert: renderer lineColor equals: Color red.
	self assert: renderer outlineRenderer lineColor equals: Color red.
	self assert: renderer surfaceRenderer lineColor equals: Color red.
	self assert: renderer formRenderer lineColor equals: Color red.
	renderer lineColor: Color blue.
	self assert: renderer lineColor equals: Color blue.
	self assert: renderer outlineRenderer lineColor equals: Color blue.
	self assert: renderer surfaceRenderer lineColor equals: Color blue.
	self assert: renderer formRenderer lineColor equals: Color blue
]

{ #category : #test }
IVRendererMixerTest >> testNewFormRenderer [

	self assert:
		(self newObj newFormRenderer isKindOf: IVFormRenderer)
]

{ #category : #test }
IVRendererMixerTest >> testNewOutlineRenderer [

	self assert:
		(self newObj newOutlineRenderer isKindOf: IVOutlineRenderer)
]

{ #category : #test }
IVRendererMixerTest >> testNewSurfaceRenderer [

	self assert:
		(self newObj newSurfaceRenderer isKindOf: IVSurfaceRenderer)
]

{ #category : #test }
IVRendererMixerTest >> testOutlineRenderer [

	| obj renderer |
	obj := self newObj.
	self assert: (obj outlineRenderer isKindOf: IVOutlineRenderer).
	renderer := IVOutlineRenderer new.
	obj outlineRenderer: renderer.
	self assert: obj outlineRenderer identicalTo: renderer
]

{ #category : #test }
IVRendererMixerTest >> testProjector [

	| renderer projector |
	renderer := self newObj.
	projector := IVPixelartProjector new.
	self assert: renderer projector isNil.
	renderer projector: projector.
	self assert: renderer projector identicalTo: projector.
	self
		assert: renderer outlineRenderer projector
		identicalTo: projector.
	self
		assert: renderer surfaceRenderer projector
		identicalTo: projector.
	self assert: renderer formRenderer projector identicalTo: projector
]

{ #category : #test }
IVRendererMixerTest >> testSurfaceRenderer [

	| obj renderer |
	obj := self newObj.
	self assert: (obj surfaceRenderer isKindOf: IVSurfaceRenderer).
	renderer := IVSurfaceRenderer new.
	obj surfaceRenderer: renderer.
	self assert: obj surfaceRenderer identicalTo: renderer
]
