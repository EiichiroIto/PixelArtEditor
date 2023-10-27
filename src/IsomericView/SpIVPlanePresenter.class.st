Class {
	#name : #SpIVPlanePresenter,
	#superclass : #SpIVObjectPresenter,
	#instVars : [
		'planeList',
		'topMaterialPane'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #layout }
SpIVPlanePresenter >> addRemainingOptionsTo: aLayout [

	aLayout add: self materialOptions
]

{ #category : #layout }
SpIVPlanePresenter >> buildMaterialOptions: aBuilder [

	aBuilder
		add: 'top:';
		add: topMaterialPane
]

{ #category : #layout }
SpIVPlanePresenter >> buildOptions: aBuilder [

	super buildOptions: aBuilder.
	aBuilder
		nextRow;
		add: 'Plane:';
		add: planeList span: 3 @ 1
]

{ #category : #initialization }
SpIVPlanePresenter >> connectPresenters [

	super connectPresenters.
	planeList
		items: #( x y z );
		display: [ :each | each ];
		yourself
]

{ #category : #initialization }
SpIVPlanePresenter >> initializePresenters [

	super initializePresenters.
	planeList := self newDropList.
	topMaterialPane := SpIVMaterialPresenter new
		                   color: Color red;
		                   yourself
]

{ #category : #layout }
SpIVPlanePresenter >> materialOptions [

	^ SpGridLayout new
		  beColumnNotHomogeneous;
		  column: 1 expand: false;
		  column: 2 expand: true;
		  build: [ :builder | self buildMaterialOptions: builder ]
]

{ #category : #accessing }
SpIVPlanePresenter >> objectExtent [

	^ self creatingObject extent
]

{ #category : #accessing }
SpIVPlanePresenter >> plane [

	^ planeList selectedItem
]

{ #category : #accessing }
SpIVPlanePresenter >> plane: aSymbol [

	planeList selectItem: aSymbol
]

{ #category : #actions }
SpIVPlanePresenter >> restore [

	self plane: model plane
]

{ #category : #actions }
SpIVPlanePresenter >> submit [

	model plane: self plane.
	owner ifNotNil: [ owner updateObjects ]
]

{ #category : #accessing }
SpIVPlanePresenter >> topMaterial [

	^ topMaterialPane colorOrForm
]

{ #category : #accessing }
SpIVPlanePresenter >> topMaterial: aColorOrForm [

	aColorOrForm isColor ifTrue: [ ^ topMaterialPane color: aColorOrForm ].
	aColorOrForm isForm ifTrue: [ ^ topMaterialPane form: aColorOrForm ].
	topMaterialPane color: Color transparent
]

{ #category : #api }
SpIVPlanePresenter >> updateSurface: aRenderer [

	| arr renderer |
	topMaterialPane ifNil: [ ^ nil ].
	renderer := aRenderer
		            ifNotNil: [ aRenderer ]
		            ifNil: [
		            owner ifNil: [ ^ self ] ifNotNil: [ owner renderer ] ].
	arr := renderer formExtentFor: self objectExtent.
	self plane = #x ifTrue: [ ^ topMaterialPane formExtent: arr first ].
	self plane = #y ifTrue: [ ^ topMaterialPane formExtent: arr second ].
	self plane = #z ifTrue: [ ^ topMaterialPane formExtent: arr third ]
]
