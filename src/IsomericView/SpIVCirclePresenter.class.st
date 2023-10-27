Class {
	#name : #SpIVCirclePresenter,
	#superclass : #SpIVPlanePresenter,
	#instVars : [
		'radiusInput'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #layout }
SpIVCirclePresenter >> buildOptions: aBuilder [

	super buildOptions: aBuilder.
	aBuilder
		nextRow;
		add: 'Radius:';
		add: radiusInput span: 3 @ 1
]

{ #category : #private }
SpIVCirclePresenter >> creatingObject [

	^ model deepCopy
		  origin: self origin;
		  plane: self plane;
		  setRadius: self radius;
		  topMaterial: self topMaterial;
		  yourself
]

{ #category : #initialization }
SpIVCirclePresenter >> initializePresenters [

	super initializePresenters.
	radiusInput := self newNumberInput
		               beInteger;
		               digits: 3;
		               yourself
]

{ #category : #accessing }
SpIVCirclePresenter >> radius [

	^ radiusInput number
]

{ #category : #accessing }
SpIVCirclePresenter >> radius: anInteger [

	^ radiusInput number: (anInteger ifNil: [ 0 ])
]

{ #category : #actions }
SpIVCirclePresenter >> submit [

	model label: self label.
	model origin: self origin.
	model plane: self plane.
	model setRadius: self radius.
	model topMaterial: self topMaterial.
	model form: form.
	owner ifNotNil: [ owner updateObjects ]
]
