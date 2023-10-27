Class {
	#name : #SpIVMaterialPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'colorSelector',
		'colorInput',
		'formCheckBox',
		'formButton',
		'form',
		'formEditButton',
		'formExtent',
		'extentLabel'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #private }
SpIVMaterialPresenter >> changeColorFromText: aString [

	| color |
	color := nil.
	aString = 'erase'
		ifTrue: [ color := Color transparent ]
		ifFalse: [
			[ color := Color fromHexString: aString ]
				on: Error
				do: [ ^ self ] ].
	self colorMorph color: color
]

{ #category : #accessing }
SpIVMaterialPresenter >> color [

	^ self colorMorph color
]

{ #category : #accessing }
SpIVMaterialPresenter >> color: aColor [

	self colorMorph color: aColor.
	colorInput text: (aColor = Color transparent
			 ifTrue: [ 'erase' ]
			 ifFalse: [ aColor asHexString ]).
	formCheckBox state: false
]

{ #category : #'event handling' }
SpIVMaterialPresenter >> colorClick: anEvent morph: aMorph [

	| ret |
	ret := self uiManager chooseColor: self color.
	ret ifNil: [ ^ self ].
	self color: ret
]

{ #category : #accessing }
SpIVMaterialPresenter >> colorMorph [

	^ colorSelector morph
]

{ #category : #accessing }
SpIVMaterialPresenter >> colorOrForm [

	^ formCheckBox state
		  ifTrue: [ form ]
		  ifFalse: [ self color ]
]

{ #category : #initialization }
SpIVMaterialPresenter >> connectPresenters [

	formButton action: [ self formButtonClicked ].
	formEditButton action: [ self formEditButtonClicked ].
	colorInput whenTextChangedDo: [
		self changeColorFromText: colorInput text ].
	self colorMorph on: #click send: #colorClick:morph: to: self
]

{ #category : #layout }
SpIVMaterialPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  spacing: 5;
		  add: colorSelector withConstraints: [ :c | c width: 40 ];
		  add: colorInput;
		  add: extentLabel expand: false;
		  add: formCheckBox withConstraints: [ :c | c width: 20 ];
		  add: formButton withConstraints: [ :c | c width: 40 ];
		  add: formEditButton withConstraints: [ :c | c width: 40 ];
		  yourself
]

{ #category : #accessing }
SpIVMaterialPresenter >> form [

	^ form
]

{ #category : #accessing }
SpIVMaterialPresenter >> form: anObject [

	form := anObject.
	formCheckBox state: true
]

{ #category : #actions }
SpIVMaterialPresenter >> formButtonClicked [

	| ret value |
	ret := self uiManager
		       request: 'Enter expression evaluated to Form' localized
		       initialAnswer: 'nil'.
	(ret isNil or: [ ret isEmpty ]) ifTrue: [ ^ self ].
	value := Object evaluate: ret.
	value ifNil: [
		formCheckBox state: false.
		^ form := nil ].
	value isForm ifFalse: [ ^ self inform: 'It is not form.' localized ].
	formCheckBox state: true.
	form := value
]

{ #category : #actions }
SpIVMaterialPresenter >> formEditButtonClicked [

	form ifNil: [ form := Form extent: formExtent depth: 32 ].
	SpPixelArtEditor new
		useForm: form notifying: [ :f | self form: f ];
		open
]

{ #category : #accessing }
SpIVMaterialPresenter >> formExtent [

	^ formExtent
]

{ #category : #accessing }
SpIVMaterialPresenter >> formExtent: anObject [

	formExtent := anObject.
	extentLabel label: anObject asString
]

{ #category : #initialization }
SpIVMaterialPresenter >> initializePresenters [

	colorSelector := self newMorph
		                 morph: self newColorSelectorMorph;
		                 yourself.
	colorInput := self newTextInput
		              maxLength: 6;
		              yourself.
	extentLabel := self newLabel.
	formCheckBox := self newCheckBox.
	formButton := self newButton
		              label: 'New';
		              yourself.
	formEditButton := self newButton
		                  label: 'Edit';
		                  yourself
]

{ #category : #'instance creation' }
SpIVMaterialPresenter >> newColorSelectorMorph [

	^ Morph new
		  extent: 50 @ 20;
		  yourself
]

{ #category : #'instance creation' }
SpIVMaterialPresenter >> newFormSelectorMorph [

	^ Morph new
		  extent: 50 @ 20;
		  yourself
]
