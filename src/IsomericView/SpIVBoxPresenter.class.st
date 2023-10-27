Class {
	#name : #SpIVBoxPresenter,
	#superclass : #SpIVObjectPresenter,
	#instVars : [
		'extentXInput',
		'extentYInput',
		'extentZInput',
		'surfacePane'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #layout }
SpIVBoxPresenter >> addRemainingOptionsTo: aLayout [

	aLayout add: surfacePane
]

{ #category : #layout }
SpIVBoxPresenter >> buildOptions: aBuilder [

	super buildOptions: aBuilder.
	aBuilder
		nextRow;
		add: 'Extent:';
		add: extentXInput;
		add: extentYInput;
		add: extentZInput
]

{ #category : #initialization }
SpIVBoxPresenter >> connectPresenters [

	super connectPresenters.
	extentXInput whenTextChangedDo: [ self updateSurface: nil ].
	extentYInput whenTextChangedDo: [ self updateSurface: nil ].
	extentZInput whenTextChangedDo: [ self updateSurface: nil ]
]

{ #category : #private }
SpIVBoxPresenter >> creatingObject [

	^ model deepCopy
		  origin: self origin;
		  extent: self objectExtent;
		  surface: self surface;
		  yourself
]

{ #category : #initialization }
SpIVBoxPresenter >> initializePresenters [

	super initializePresenters.
	extentXInput := self newNumberInput
		                beInteger;
		                digits: 3;
		                yourself.
	extentYInput := self newNumberInput
		                beInteger;
		                digits: 3;
		                yourself.
	extentZInput := self newNumberInput
		                beInteger;
		                digits: 3;
		                yourself
]

{ #category : #accessing }
SpIVBoxPresenter >> objectExtent [

	^ IVPoint x: extentXInput number y: extentYInput number z: extentZInput number
]

{ #category : #accessing }
SpIVBoxPresenter >> objectExtent: anIVPoint [

	anIVPoint
		ifNil: [
			extentXInput number: 0.
			extentYInput number: 0.
			extentZInput number: 0 ]
		ifNotNil: [
			extentXInput number: anIVPoint x.
			extentYInput number: anIVPoint y.
			extentZInput number: anIVPoint z ]
]

{ #category : #actions }
SpIVBoxPresenter >> restore [

	self label: model label.
	self origin: model origin.
	self objectExtent: model extent.
	self form: model form.
	self surface: model surface.
	form := model form
]

{ #category : #actions }
SpIVBoxPresenter >> submit [

	model label: self label.
	model origin: self origin.
	model extent: self objectExtent.
	model surface: self surface.
	model form: form.
	owner ifNotNil: [ owner updateObjects ]
]

{ #category : #accessing }
SpIVBoxPresenter >> surface [

	^ surfacePane asSurface
]

{ #category : #accessing }
SpIVBoxPresenter >> surface: aSurface [

	surfacePane := aSurface asPresenter
]

{ #category : #api }
SpIVBoxPresenter >> updateSurface: aRenderer [

	| arr renderer |
	surfacePane ifNil: [ ^ nil ].
	renderer := aRenderer
		            ifNotNil: [ aRenderer ]
		            ifNil: [
		            owner ifNil: [ ^ self ] ifNotNil: [ owner renderer ] ].
	arr := renderer formExtentFor: self objectExtent.
	surfacePane formExtent: arr
]
