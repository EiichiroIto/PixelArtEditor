Class {
	#name : #SpIVPolyhedronPresenter,
	#superclass : #SpIVPlanePresenter,
	#instVars : [
		'heightInput',
		'polygonTable',
		'indexInput',
		'addIVPointButton',
		'deleteIVPointButton',
		'addColorButton',
		'deleteColorButton',
		'colorTable',
		'upIVPointButton',
		'downIVPointButton',
		'upColorButton',
		'downColorButton'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #actions }
SpIVPolyhedronPresenter >> addColor [

	| ret objects |
	ret := self uiManager chooseColor.
	ret ifNil: [ ^ self ].
	objects := colorTable items asOrderedCollection.
	colorTable selectionMode isEmpty
		ifTrue: [ objects add: ret ]
		ifFalse: [ objects add: ret after: polygonTable selectedItem ].
	colorTable items: objects
]

{ #category : #actions }
SpIVPolyhedronPresenter >> addIVPoint [

	| ret newObj objects |
	ret := self uiManager
		       request: 'Enter three integers separated by commas' localized
		       initialAnswer: '0,0,0'.
	ret ifNil: [ ^ self ].
	ret := ((ret splitOn: ',') collect: #asInteger) collect: [ :each |
		       each ifNil: [ 0 ] ].
	ret size = 3 ifFalse: [ ^ self inform: 'Invalid inputs' localized ].
	newObj := IVPoint perform: #x:y:z: withArguments: ret asArray.
	objects := polygonTable items asOrderedCollection.
	polygonTable selectionMode isEmpty
		ifTrue: [ objects add: newObj ]
		ifFalse: [ objects add: newObj after: polygonTable selectedItem ].
	polygonTable items: objects
]

{ #category : #layout }
SpIVPolyhedronPresenter >> addRemainingOptionsTo: aLayout [

	aLayout
		add: (SpBoxLayout newLeftToRight
				 add: addIVPointButton;
				 add: upIVPointButton;
				 add: downIVPointButton;
				 add: deleteIVPointButton;
				 yourself)
		expand: false;
		add: polygonTable withConstraints: [ :c | c height: 80 ];
		add: self materialOptions withConstraints: [ :c | c height: 60 ];
		add: indexInput expand: false;
		add: (SpBoxLayout newLeftToRight
				 add: addColorButton;
				 add: upColorButton;
				 add: downColorButton;
				 add: deleteColorButton;
				 yourself)
		expand: false;
		add: colorTable withConstraints: [ :c | c height: 80 ]
]

{ #category : #layout }
SpIVPolyhedronPresenter >> buildOptions: aBuilder [

	super buildOptions: aBuilder.
	aBuilder
		nextRow;
		add: 'Height:';
		add: heightInput
]

{ #category : #initialization }
SpIVPolyhedronPresenter >> buildTableMenu [

	^ self newMenu
		  addItem: [ :anItem |
			  anItem
				  name: 'inspect';
				  action: [ polygonTable selectedItem inspect ] ];
		  yourself
]

{ #category : #initialization }
SpIVPolyhedronPresenter >> connectPresenters [

	super connectPresenters.
	addIVPointButton action: [ self addIVPoint ].
	deleteIVPointButton action: [ self deleteIVPoint ].
	upIVPointButton action: [ self moveUpIVPoint ].
	downIVPointButton action: [ self moveDownIVPoint ].
	addColorButton action: [ self addColor ].
	deleteColorButton action: [ self deleteColor ].
	upColorButton action: [ self moveUpColor ].
	downColorButton action: [ self moveDownColor ]
]

{ #category : #private }
SpIVPolyhedronPresenter >> creatingObject [

	^ model deepCopy
		  origin: self origin;
		  plane: self plane;
		  height: self height;
		  topMaterial: self topMaterial;
		  polygon: self polygon;
		  visibleVertices: self visibleVertices;
		  otherColors: self otherColors;
		  yourself
]

{ #category : #actions }
SpIVPolyhedronPresenter >> deleteColor [

	self deleteTable: colorTable
]

{ #category : #actions }
SpIVPolyhedronPresenter >> deleteIVPoint [

	self deleteTable: polygonTable
]

{ #category : #private }
SpIVPolyhedronPresenter >> deleteTable: aTablePresenter [

	| objects |
	aTablePresenter selectionMode isEmpty ifTrue: [ ^ self ].
	objects := aTablePresenter items asOrderedCollection.
	objects remove: aTablePresenter selectedItem.
	aTablePresenter items: objects
]

{ #category : #accessing }
SpIVPolyhedronPresenter >> height [

	^ heightInput number
]

{ #category : #accessing }
SpIVPolyhedronPresenter >> height: anInteger [

	heightInput number: (anInteger ifNil: [ 0 ])
]

{ #category : #initialization }
SpIVPolyhedronPresenter >> initializePresenters [

	super initializePresenters.
	heightInput := self newNumberInput
		               beInteger;
		               digits: 3;
		               yourself.
	polygonTable := self newTable.
	addIVPointButton := self newButton
		                    label: 'Add' localized;
		                    yourself.
	deleteIVPointButton := self newButton
		                       label: 'Delete' localized;
		                       yourself.
	upIVPointButton := self newButton
		                   label: 'Up' localized;
		                   yourself.
	downIVPointButton := self newButton
		                     label: 'Down' localized;
		                     yourself.
	indexInput := self newTextInput.
	colorTable := self newTable.
	addColorButton := self newButton
		                  label: 'Add' localized;
		                  yourself.
	deleteColorButton := self newButton
		                     label: 'Delete' localized;
		                     yourself.
	upColorButton := self newButton
		                 label: 'Up' localized;
		                 yourself.
	downColorButton := self newButton
		                   label: 'Down' localized;
		                   yourself.
	self setupTable
]

{ #category : #actions }
SpIVPolyhedronPresenter >> moveDownColor [

	self moveDownTable: colorTable
]

{ #category : #actions }
SpIVPolyhedronPresenter >> moveDownIVPoint [

	self moveDownTable: polygonTable
]

{ #category : #private }
SpIVPolyhedronPresenter >> moveDownTable: aTablePresenter [

	| obj list index |
	aTablePresenter selectionMode isEmpty ifTrue: [ ^ self ].
	obj := aTablePresenter selectedItem.
	list := aTablePresenter items.
	index := list indexOf: obj.
	index > (list size - 1) ifTrue: [ ^ self ].
	list swap: index with: index + 1.
	aTablePresenter items: list.
	aTablePresenter selectItem: obj
]

{ #category : #actions }
SpIVPolyhedronPresenter >> moveUpColor [

	self moveUpTable: colorTable
]

{ #category : #actions }
SpIVPolyhedronPresenter >> moveUpIVPoint [

	self moveUpTable: polygonTable
]

{ #category : #private }
SpIVPolyhedronPresenter >> moveUpTable: aTablePresenter [

	| obj list index |
	aTablePresenter selectionMode isEmpty ifTrue: [ ^ self ].
	obj := aTablePresenter selectedItem.
	list := aTablePresenter items.
	index := list indexOf: obj.
	index < 2 ifTrue: [ ^ self ].
	list swap: index with: index - 1.
	aTablePresenter items: list.
	aTablePresenter selectItem: obj
]

{ #category : #accessing }
SpIVPolyhedronPresenter >> otherColors [

	^ colorTable items
]

{ #category : #accessing }
SpIVPolyhedronPresenter >> otherColors: aCollection [

	colorTable items: (aCollection ifNil: [ #(  ) ])
]

{ #category : #accessing }
SpIVPolyhedronPresenter >> polygon [

	^ polygonTable items
]

{ #category : #accessing }
SpIVPolyhedronPresenter >> polygon: aCollection [

	polygonTable items: (aCollection ifNil: [ #(  ) ])
]

{ #category : #initialization }
SpIVPolyhedronPresenter >> setupTable [

	polygonTable
		contextMenu: self buildTableMenu;
		addColumn: (SpStringTableColumn title: 'x' evaluated: #x);
		addColumn: (SpStringTableColumn title: 'y' evaluated: #y);
		addColumn: (SpStringTableColumn title: 'z' evaluated: #z).
	colorTable
		addColumn: (SpImageTableColumn
				 title: 'color'
				 evaluated: [ :obj |
					 (Form extent: 20 @ 10 depth: 32) fillColor: obj ]);
		addColumn: (SpStringTableColumn title: 'red' evaluated: #red);
		addColumn: (SpStringTableColumn title: 'green' evaluated: #green);
		addColumn: (SpStringTableColumn title: 'blue' evaluated: #blue)
]

{ #category : #actions }
SpIVPolyhedronPresenter >> submit [

	model label: self label.
	model plane: self plane.
	model height: self height.
	model origin: self origin.
	model topMaterial: self topMaterial.
	model polygon: self polygon.
	model visibleVertices: self visibleVertices.
	model otherColors: self otherColors.
	model form: form.
	owner ifNotNil: [ owner updateObjects ]
]

{ #category : #accessing }
SpIVPolyhedronPresenter >> visibleVertices [

	^ ((indexInput text splitOn: ',') collect: #asInteger) reject: #isNil
]

{ #category : #accessing }
SpIVPolyhedronPresenter >> visibleVertices: aCollection [

	indexInput text:
		(((aCollection ifNil: [ #(  ) ]) collect: #asString) joinUsing: ',')
]
