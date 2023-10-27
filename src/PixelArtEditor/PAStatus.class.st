Class {
	#name : #PAStatus,
	#superclass : #Object,
	#instVars : [
		'command',
		'dragging',
		'undoForm',
		'lastImportedFile',
		'lastProjectFile',
		'baseColor',
		'lastPoint',
		'lastExportedClass'
	],
	#category : #'PixelArtEditor-Spec2'
}

{ #category : #accessing }
PAStatus >> baseColor [

	^ baseColor
]

{ #category : #accessing }
PAStatus >> baseColor: anObject [

	baseColor := anObject
]

{ #category : #api }
PAStatus >> beCopying [

	command := #copy
]

{ #category : #api }
PAStatus >> beDrawing [

	command := #draw
]

{ #category : #api }
PAStatus >> beDrawingLine [

	command := #drawLine
]

{ #category : #api }
PAStatus >> beDrawingOval [

	command := #drawOval
]

{ #category : #api }
PAStatus >> beDrawingRectangle [

	command := #drawRectangle
]

{ #category : #api }
PAStatus >> beErasing [

	command := #erase
]

{ #category : #api }
PAStatus >> bePaintingHorizontally [

	command := #horizontalPaint
]

{ #category : #api }
PAStatus >> bePaintingVertically [

	command := #verticalPaint
]

{ #category : #api }
PAStatus >> bePicking [

	command := #pick
]

{ #category : #api }
PAStatus >> beReplacing [

	command := #replace
]

{ #category : #accessing }
PAStatus >> command [

	^ command
]

{ #category : #accessing }
PAStatus >> command: anObject [

	command := anObject
]

{ #category : #accessing }
PAStatus >> dragging [

	^ dragging
]

{ #category : #accessing }
PAStatus >> dragging: anObject [

	dragging := anObject
]

{ #category : #api }
PAStatus >> endDragging [

	dragging := false
]

{ #category : #initialization }
PAStatus >> initialize [

	command := #draw.
	dragging := false.
	lastPoint := 0 @ 0
]

{ #category : #testing }
PAStatus >> isCopying [

	^ command = #copy
]

{ #category : #testing }
PAStatus >> isDragging [

	^ dragging
]

{ #category : #testing }
PAStatus >> isDrawing [

	^ command = #draw
]

{ #category : #testing }
PAStatus >> isDrawingLine [

	^ command = #drawLine
]

{ #category : #testing }
PAStatus >> isDrawingOval [

	^ command = #drawOval
]

{ #category : #testing }
PAStatus >> isDrawingRectangle [

	^ command = #drawRectangle
]

{ #category : #testing }
PAStatus >> isErasing [

	^ command = #erase
]

{ #category : #testing }
PAStatus >> isPaintingHorizontally [

	^ command = #horizontalPaint
]

{ #category : #testing }
PAStatus >> isPaintingVertically [

	^ command = #verticalPaint
]

{ #category : #testing }
PAStatus >> isPicking [

	^ command = #pick
]

{ #category : #testing }
PAStatus >> isReplacing [

	^ command = #replace
]

{ #category : #accessing }
PAStatus >> lastExportedClass [

	^ lastExportedClass
]

{ #category : #accessing }
PAStatus >> lastExportedClass: anObject [

	lastExportedClass := anObject
]

{ #category : #accessing }
PAStatus >> lastImportedFile [

	^ lastImportedFile
]

{ #category : #accessing }
PAStatus >> lastImportedFile: anObject [

	lastImportedFile := anObject
]

{ #category : #accessing }
PAStatus >> lastPoint [

	^ lastPoint
]

{ #category : #accessing }
PAStatus >> lastPoint: anObject [

	lastPoint := anObject
]

{ #category : #accessing }
PAStatus >> lastProjectFile [

	^ lastProjectFile
]

{ #category : #accessing }
PAStatus >> lastProjectFile: anObject [

	lastProjectFile := anObject
]

{ #category : #api }
PAStatus >> startDragging [

	dragging := true
]

{ #category : #accessing }
PAStatus >> undoForm [

	^ undoForm
]

{ #category : #accessing }
PAStatus >> undoForm: anObject [

	undoForm := anObject
]
