Class {
	#name : #SpIVSurfacePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'xMaterialPane',
		'yMaterialPane',
		'zMaterialPane'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #converting }
SpIVSurfacePresenter >> asSurface [

	^ IVSurface new
		  xMaterial: self xMaterial;
		  yMaterial: self yMaterial;
		  zMaterial: self zMaterial;
		  yourself
]

{ #category : #layout }
SpIVSurfacePresenter >> defaultLayout [

	^ SpGridLayout new
		  beColumnNotHomogeneous;
		  column: 1 expand: false;
		  column: 2 expand: true;
		  build: [ :builder |
			  builder
				  add: 'x:';
				  add: xMaterialPane;
				  nextRow;
				  add: 'y:';
				  add: yMaterialPane;
				  nextRow;
				  add: 'z:';
				  add: zMaterialPane ]
]

{ #category : #accessing }
SpIVSurfacePresenter >> formExtent: anArray [

	xMaterialPane formExtent: anArray first.
	yMaterialPane formExtent: anArray second.
	zMaterialPane formExtent: anArray third
]

{ #category : #initialization }
SpIVSurfacePresenter >> initializePresenters [

	xMaterialPane := SpIVMaterialPresenter new
		                 color: Color red;
		                 yourself.
	yMaterialPane := SpIVMaterialPresenter new
		                 color: Color green;
		                 yourself.
	zMaterialPane := SpIVMaterialPresenter new
		                 color: Color blue;
		                 yourself
]

{ #category : #accessing }
SpIVSurfacePresenter >> xMaterial [

	^ xMaterialPane colorOrForm
]

{ #category : #accessing }
SpIVSurfacePresenter >> xMaterial: aColorOrForm [

	aColorOrForm isColor ifTrue: [ ^ xMaterialPane color: aColorOrForm ].
	aColorOrForm isForm ifTrue: [ ^ xMaterialPane form: aColorOrForm ].
	xMaterialPane color: Color transparent
]

{ #category : #accessing }
SpIVSurfacePresenter >> yMaterial [

	^ yMaterialPane colorOrForm
]

{ #category : #accessing }
SpIVSurfacePresenter >> yMaterial: aColorOrForm [

	aColorOrForm isColor ifTrue: [ ^ yMaterialPane color: aColorOrForm ].
	aColorOrForm isForm ifTrue: [ ^ yMaterialPane form: aColorOrForm ].
	yMaterialPane color: Color transparent
]

{ #category : #accessing }
SpIVSurfacePresenter >> zMaterial [

	^ zMaterialPane colorOrForm
]

{ #category : #accessing }
SpIVSurfacePresenter >> zMaterial: aColorOrForm [

	aColorOrForm isColor ifTrue: [ ^ zMaterialPane color: aColorOrForm ].
	aColorOrForm isForm ifTrue: [ ^ zMaterialPane form: aColorOrForm ].
	zMaterialPane color: Color transparent
]
