Class {
	#name : #SpIVCylinderPresenter,
	#superclass : #SpIVPlanePresenter,
	#instVars : [
		'heightInput',
		'radiusInput',
		'bottomRadiusInput',
		'sideMaterialPane'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #accessing }
SpIVCylinderPresenter >> bottomRadius [

	^ bottomRadiusInput number
]

{ #category : #accessing }
SpIVCylinderPresenter >> bottomRadius: anInteger [

	bottomRadiusInput number: (anInteger ifNil: [ 0 ])
]

{ #category : #layout }
SpIVCylinderPresenter >> buildMaterialOptions: aBuilder [

	super buildMaterialOptions: aBuilder.
	aBuilder
		nextRow;
		add: 'side:';
		add: sideMaterialPane
]

{ #category : #layout }
SpIVCylinderPresenter >> buildOptions: aBuilder [

	super buildOptions: aBuilder.
	aBuilder
		nextRow;
		add: 'Height:';
		add: heightInput;
		nextRow;
		add: 'Radius:';
		add: radiusInput;
		add: bottomRadiusInput
]

{ #category : #private }
SpIVCylinderPresenter >> creatingObject [

	^ model deepCopy
		  origin: self origin;
		  plane: self plane;
		  height: self height;
		  setRadius: self radius;
		  bottomRadius: self bottomRadius;
		  topMaterial: self topMaterial;
		  sideMaterial: self sideMaterial;
		  yourself
]

{ #category : #accessing }
SpIVCylinderPresenter >> height [

	^ heightInput number
]

{ #category : #accessing }
SpIVCylinderPresenter >> height: anInteger [

	heightInput number: (anInteger ifNil: [ 0 ])
]

{ #category : #initialization }
SpIVCylinderPresenter >> initializePresenters [

	super initializePresenters.
	heightInput := self newNumberInput
		               beInteger;
		               digits: 3;
		               yourself.
	radiusInput := self newNumberInput
		               beInteger;
		               digits: 3;
		               yourself.
	bottomRadiusInput := self newNumberInput
		                     beInteger;
		                     digits: 3;
		                     yourself.
	sideMaterialPane := SpIVMaterialPresenter new
		                    color: Color red;
		                    yourself
]

{ #category : #accessing }
SpIVCylinderPresenter >> radius [

	^ radiusInput number
]

{ #category : #accessing }
SpIVCylinderPresenter >> radius: anInteger [

	radiusInput number: (anInteger ifNil: [ 0 ])
]

{ #category : #accessing }
SpIVCylinderPresenter >> sideMaterial [

	^ sideMaterialPane colorOrForm
]

{ #category : #accessing }
SpIVCylinderPresenter >> sideMaterial: aColorOrForm [

	aColorOrForm isColor ifTrue: [ ^ sideMaterialPane color: aColorOrForm ].
	aColorOrForm isForm ifTrue: [ ^ sideMaterialPane form: aColorOrForm ].
	sideMaterialPane color: Color transparent
]

{ #category : #actions }
SpIVCylinderPresenter >> submit [

	model label: self label.
	model plane: self plane.
	model height: self height.
	model setRadius: self radius.
	model bottomRadius: self bottomRadius.
	model origin: self origin.
	model topMaterial: self topMaterial.
	model sideMaterial: self sideMaterial.
	model form: form.
	owner ifNotNil: [ owner updateObjects ]
]
