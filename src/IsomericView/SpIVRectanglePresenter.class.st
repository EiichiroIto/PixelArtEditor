Class {
	#name : #SpIVRectanglePresenter,
	#superclass : #SpIVPlanePresenter,
	#instVars : [
		'widthInput',
		'heightInput'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #layout }
SpIVRectanglePresenter >> buildOptions: aBuilder [

	super buildOptions: aBuilder.
	aBuilder
		nextRow;
		add: 'Extent:';
		add: widthInput;
		add: heightInput
]

{ #category : #private }
SpIVRectanglePresenter >> creatingObject [

	^ model deepCopy
		  origin: self origin;
		  plane: self plane;
		  width: self width;
		  height: self height;
		  topMaterial: self topMaterial;
		  yourself
]

{ #category : #accessing }
SpIVRectanglePresenter >> height [

	^ heightInput number
]

{ #category : #accessing }
SpIVRectanglePresenter >> height: anInteger [

	heightInput number: (anInteger ifNil: [ 0 ])
]

{ #category : #initialization }
SpIVRectanglePresenter >> initializePresenters [

	super initializePresenters.
	widthInput := self newNumberInput
		              beInteger;
		              digits: 3;
		              yourself.
	heightInput := self newNumberInput
		               beInteger;
		               digits: 3;
		               yourself
]

{ #category : #actions }
SpIVRectanglePresenter >> submit [

	model label: self label.
	model origin: self origin.
	model plane: self plane.
	model width: self width.
	model height: self height.
	model topMaterial: self topMaterial.
	model form: form.
	owner ifNotNil: [ owner updateObjects ]
]

{ #category : #accessing }
SpIVRectanglePresenter >> width [

	^ widthInput number
]

{ #category : #accessing }
SpIVRectanglePresenter >> width: anInteger [

	widthInput number: (anInteger ifNil: [ 0 ])
]
