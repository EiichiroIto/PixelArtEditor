"
A PAStatusTest is a test class for testing the behavior of PAStatus
"
Class {
	#name : #PAStatusTest,
	#superclass : #TestCase,
	#category : #'PixelArtEditor-Tests'
}

{ #category : #'instance creation' }
PAStatusTest >> newObj [

	^ PAStatus new
]

{ #category : #test }
PAStatusTest >> testBaseColor [

	| obj |
	obj := self newObj.
	self assert: obj baseColor isNil.
	obj baseColor: Color red.
	self assert: obj baseColor equals: Color red
]

{ #category : #test }
PAStatusTest >> testBeCopying [

	self testIsCopying
]

{ #category : #test }
PAStatusTest >> testBeDrawing [

	self testIsDrawing
]

{ #category : #test }
PAStatusTest >> testBeDrawingLine [

	self testIsDrawingLine
]

{ #category : #test }
PAStatusTest >> testBeDrawingOval [

	self testIsDrawingOval
]

{ #category : #test }
PAStatusTest >> testBeDrawingRectangle [

	self testIsDrawingRectangle
]

{ #category : #test }
PAStatusTest >> testBeErasing [

	self testIsErasing
]

{ #category : #test }
PAStatusTest >> testBePaintingHorizontally [

	self testIsPaintingHorizontally
]

{ #category : #test }
PAStatusTest >> testBePaintingVertically [

	self testIsPaintingVertically
]

{ #category : #test }
PAStatusTest >> testBePicking [

	self testIsPicking
]

{ #category : #test }
PAStatusTest >> testBeReplacing [

	self testIsReplacing
]

{ #category : #test }
PAStatusTest >> testCommand [

	| obj |
	obj := self newObj.
	self assert: obj command equals: #draw.
	obj command: #erase.
	self assert: obj command equals: #erase
]

{ #category : #test }
PAStatusTest >> testDragging [

	| obj |
	obj := self newObj.
	self deny: obj dragging.
	obj dragging: true.
	self assert: obj dragging.
	obj dragging: false.
	self deny: obj dragging
]

{ #category : #test }
PAStatusTest >> testEndDragging [

	self testIsDragging
]

{ #category : #test }
PAStatusTest >> testInitialize [

	| obj |
	obj := self newObj.
	self assert: obj isDrawing.
	self deny: obj isDragging.
	self assert: obj lastPoint equals: 0 @ 0
]

{ #category : #test }
PAStatusTest >> testIsCopying [

	| obj |
	obj := self newObj.
	self deny: obj isCopying.
	obj beCopying.
	self assert: obj isCopying
]

{ #category : #test }
PAStatusTest >> testIsDragging [

	| obj |
	obj := self newObj.
	self deny: obj isDragging.
	obj startDragging.
	self assert: obj isDragging.
	obj endDragging.
	self deny: obj isDragging
]

{ #category : #test }
PAStatusTest >> testIsDrawing [

	| obj |
	obj := self newObj.
	self assert: obj isDrawing.
	obj beErasing.
	self deny: obj isDrawing.
	obj beDrawing.
	self assert: obj isDrawing
]

{ #category : #test }
PAStatusTest >> testIsDrawingLine [

	| obj |
	obj := self newObj.
	self deny: obj isDrawingLine.
	obj beDrawingLine.
	self assert: obj isDrawingLine
]

{ #category : #test }
PAStatusTest >> testIsDrawingOval [

	| obj |
	obj := self newObj.
	self deny: obj isDrawingOval.
	obj beDrawingOval.
	self assert: obj isDrawingOval
]

{ #category : #test }
PAStatusTest >> testIsDrawingRectangle [

	| obj |
	obj := self newObj.
	self deny: obj isDrawingRectangle.
	obj beDrawingRectangle.
	self assert: obj isDrawingRectangle
]

{ #category : #test }
PAStatusTest >> testIsErasing [

	| obj |
	obj := self newObj.
	self deny: obj isErasing.
	obj beErasing.
	self assert: obj isErasing
]

{ #category : #test }
PAStatusTest >> testIsPaintingHorizontally [

	| obj |
	obj := self newObj.
	self deny: obj isPaintingHorizontally.
	obj bePaintingHorizontally.
	self assert: obj isPaintingHorizontally
]

{ #category : #test }
PAStatusTest >> testIsPaintingVertically [

	| obj |
	obj := self newObj.
	self deny: obj isPaintingVertically.
	obj bePaintingVertically.
	self assert: obj isPaintingVertically
]

{ #category : #test }
PAStatusTest >> testIsPicking [

	| obj |
	obj := self newObj.
	self deny: obj isPicking.
	obj bePicking.
	self assert: obj isPicking
]

{ #category : #test }
PAStatusTest >> testIsReplacing [

	| obj |
	obj := self newObj.
	self deny: obj isReplacing.
	obj beReplacing.
	self assert: obj isReplacing
]

{ #category : #test }
PAStatusTest >> testLastExportedClass [

	| obj |
	obj := self newObj.
	self assert: obj lastExportedClass isNil.
	obj lastExportedClass: #Test1.
	self assert: obj lastExportedClass equals: #Test1.
	obj lastExportedClass: #Test2.
	self assert: obj lastExportedClass equals: #Test2
]

{ #category : #test }
PAStatusTest >> testLastImportedFile [

	| obj file |
	obj := self newObj.
	self assert: obj lastImportedFile isNil.
	file := 'abc' asFileReference.
	obj lastImportedFile: file.
	self assert: obj lastImportedFile identicalTo: file
]

{ #category : #test }
PAStatusTest >> testLastPoint [

	| obj |
	obj := self newObj.
	self assert: obj lastPoint equals: 0 @ 0.
	obj lastPoint: 1 @ 2.
	self assert: obj lastPoint equals: 1 @ 2.
	obj lastPoint: 3 @ 4.
	self assert: obj lastPoint equals: 3 @ 4
]

{ #category : #test }
PAStatusTest >> testLastProjectFile [

	| obj file |
	obj := self newObj.
	self assert: obj lastProjectFile isNil.
	file := 'abc' asFileReference.
	obj lastProjectFile: file.
	self assert: obj lastProjectFile identicalTo: file
]

{ #category : #test }
PAStatusTest >> testStartDragging [

	self testIsDragging
]

{ #category : #test }
PAStatusTest >> testUndoForm [

	| obj form |
	obj := self newObj.
	self assert: obj undoForm isNil.
	form := Form extent: 1 @ 2 depth: 32.
	obj undoForm: form.
	self assert: obj undoForm identicalTo: form
]
