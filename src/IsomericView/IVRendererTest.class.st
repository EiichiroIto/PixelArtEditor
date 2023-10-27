"
An IVRendererTest is a test class for testing the behavior of IVRenderer
"
Class {
	#name : #IVRendererTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVRendererTest >> newProjector [

	^ IVProjector new
]

{ #category : #private }
IVRendererTest >> newRenderer [

	^ IVRenderer new
]

{ #category : #test }
IVRendererTest >> testDrawingRange [

	| renderer rect |
	renderer := self newRenderer.
	self assert: renderer drawingRange isNil.
	rect := Rectangle origin: 10 @ 10 corner: 20 @ 30.
	renderer drawingRange: rect.
	self assert: renderer drawingRange identicalTo: rect
]

{ #category : #test }
IVRendererTest >> testExtent [

	| renderer |
	renderer := self newRenderer.
	renderer projector: self newProjector.
	renderer extent: 123 @ 456.
	self assert: renderer extent equals: 123 @ 456
]

{ #category : #test }
IVRendererTest >> testIsFormRenderer [

	self deny: self newRenderer isFormRenderer
]

{ #category : #test }
IVRendererTest >> testLineColor [

	| renderer |
	renderer := self newRenderer.
	self assert: renderer lineColor isNil.
	renderer lineColor: Color red.
	self assert: renderer lineColor equals: Color red.
	renderer lineColor: Color blue.
	self assert: renderer lineColor equals: Color blue
]

{ #category : #test }
IVRendererTest >> testProjector [

	| renderer obj |
	renderer := self newRenderer.
	self assert: renderer projector isNil.
	obj := self newProjector.
	renderer projector: obj.
	self assert: renderer projector identicalTo: obj
]

{ #category : #test }
IVRendererTest >> testRecordPoint [

	| renderer |
	renderer := self newRenderer.
	self assert: renderer drawingRange isNil.
	renderer recordPoint: 10 @ 10.
	self assert: (renderer drawingRange containsPoint: 10 @ 10).
	self assert: renderer drawingRange origin equals: 10 @ 10.
	self assert: renderer drawingRange extent equals: 1 @ 1.
	renderer recordPoint: 12 @ 13.
	self assert: (renderer drawingRange containsPoint: 12 @ 13).
	self assert: renderer drawingRange origin equals: 10 @ 10.
	self assert: renderer drawingRange extent equals: 3 @ 4.
	renderer recordPoint: 5 @ 3.
	self assert: (renderer drawingRange containsPoint: 5 @ 3).
	self assert: renderer drawingRange origin equals: 5 @ 3.
	self assert: renderer drawingRange extent equals: 8 @ 11.
	renderer recordPoint: 2 @ 15.
	self assert: (renderer drawingRange containsPoint: 2 @ 15).
	self assert: renderer drawingRange origin equals: 2 @ 3.
	self assert: renderer drawingRange extent equals: 11 @ 13
]
