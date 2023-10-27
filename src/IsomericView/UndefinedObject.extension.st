Extension { #name : #UndefinedObject }

{ #category : #'*IsomericView' }
UndefinedObject >> render: aRenderer polygon: aCollection on: aCanvas [

	self
]

{ #category : #'*IsomericView' }
UndefinedObject >> renderXCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer drawXCircle: aPoint diameter: anInteger on: aCanvas
]

{ #category : #'*IsomericView' }
UndefinedObject >> renderYCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer drawYCircle: aPoint diameter: anInteger on: aCanvas
]

{ #category : #'*IsomericView' }
UndefinedObject >> renderZCircle: aRenderer diameter: anInteger at: aPoint on: aCanvas [

	aRenderer drawZCircle: aPoint diameter: anInteger on: aCanvas
]
