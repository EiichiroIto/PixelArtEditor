Class {
	#name : #SpIVObjectPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'originXInput',
		'originYInput',
		'originZInput',
		'labelInput',
		'submitButton',
		'restoreButton',
		'form'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #layout }
SpIVObjectPresenter >> addRemainingOptionsTo: aLayout [

	self subclassResponsibility
]

{ #category : #layout }
SpIVObjectPresenter >> buildOptions: aBuilder [

	aBuilder
		add: 'Name:';
		add: labelInput;
		nextRow;
		add: 'Origin:';
		add: originXInput;
		add: originYInput;
		add: originZInput
]

{ #category : #initialization }
SpIVObjectPresenter >> connectPresenters [

	submitButton action: [ self submit ].
	restoreButton action: [ self restore ]
]

{ #category : #private }
SpIVObjectPresenter >> creatingObject [

	self subclassResponsibility
]

{ #category : #layout }
SpIVObjectPresenter >> defaultLayout [

	| obj |
	obj := SpBoxLayout newTopToBottom
		       add: self gridOptions;
		       yourself.
	self addRemainingOptionsTo: obj.
	obj add: self submitButtons expand: false.
	^ obj
]

{ #category : #accessing }
SpIVObjectPresenter >> form [

	^ form
]

{ #category : #accessing }
SpIVObjectPresenter >> form: anObject [

	form := anObject
]

{ #category : #layout }
SpIVObjectPresenter >> gridOptions [

	^ SpGridLayout new
		  beColumnNotHomogeneous;
		  column: 1 expand: false;
		  column: 2 expand: true;
		  column: 3 expand: true;
		  column: 4 expand: true;
		  build: [ :builder | self buildOptions: builder ]
]

{ #category : #initialization }
SpIVObjectPresenter >> initializePresenters [

	labelInput := self newTextInput.
	originXInput := self newNumberInput
		                beInteger;
		                digits: 3;
		                yourself.
	originYInput := self newNumberInput
		                beInteger;
		                digits: 3;
		                yourself.
	originZInput := self newNumberInput
		                beInteger;
		                digits: 3;
		                yourself.
	submitButton := self newButton
		                label: 'Submit';
		                yourself.
	restoreButton := self newButton
		                 label: 'Restore';
		                 yourself
]

{ #category : #accessing }
SpIVObjectPresenter >> label [

	^ labelInput text asString
]

{ #category : #accessing }
SpIVObjectPresenter >> label: aString [

	labelInput text: aString
]

{ #category : #accessing }
SpIVObjectPresenter >> model [

	^ model
]

{ #category : #accessing }
SpIVObjectPresenter >> model: anIVObject [

	model := anIVObject
]

{ #category : #accessing }
SpIVObjectPresenter >> objectExtent [

	self subclassResponsibility
]

{ #category : #accessing }
SpIVObjectPresenter >> origin [

	^ IVPoint x: originXInput number y: originYInput number z: originZInput number
]

{ #category : #accessing }
SpIVObjectPresenter >> origin: anIVPoint [

	anIVPoint
		ifNil: [
			originXInput number: 0.
			originYInput number: 0.
			originZInput number: 0 ]
		ifNotNil: [
			originXInput number: anIVPoint x.
			originYInput number: anIVPoint y.
			originZInput number: anIVPoint z ]
]

{ #category : #actions }
SpIVObjectPresenter >> restore [

	self subclassResponsibility
]

{ #category : #actions }
SpIVObjectPresenter >> submit [

	self subclassResponsibility
]

{ #category : #layout }
SpIVObjectPresenter >> submitButtons [

	^ SpBoxLayout newLeftToRight
		  spacing: 5;
		  add: submitButton;
		  add: restoreButton;
		  yourself
]
