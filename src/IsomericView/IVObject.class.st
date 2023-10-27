Class {
	#name : #IVObject,
	#superclass : #Object,
	#instVars : [
		'label',
		'origin',
		'form'
	],
	#category : #'IsomericView-Core'
}

{ #category : #converting }
IVObject >> asPresenter [

	^ SpIVObjectPresenter new
]

{ #category : #accessing }
IVObject >> corner [

	self subclassResponsibility
]

{ #category : #accessing }
IVObject >> extent [

	self subclassResponsibility
]

{ #category : #accessing }
IVObject >> extentValue [

	| stream |
	self extent ifNil: [ ^ '' ].
	stream := WriteStream on: String new.
	self extent printTripletOn: stream.
	^ stream contents
]

{ #category : #accessing }
IVObject >> form [

	^ form
]

{ #category : #accessing }
IVObject >> form: anObject [

	form := anObject
]

{ #category : #testing }
IVObject >> hasForm [

	^ form notNil
]

{ #category : #testing }
IVObject >> isImage [

	^ false
]

{ #category : #accessing }
IVObject >> label [

	^ label ifNil: [ '' ]
]

{ #category : #accessing }
IVObject >> label: anObject [

	label := anObject
]

{ #category : #accessing }
IVObject >> origin [

	^ origin
]

{ #category : #accessing }
IVObject >> origin: anObject [

	origin := anObject
]

{ #category : #accessing }
IVObject >> originValue [

	| stream |
	origin ifNil: [ ^ '' ].
	stream := WriteStream on: String new.
	origin printTripletOn: stream.
	^ stream contents
]

{ #category : #printing }
IVObject >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: '('.
	label ifNotNil: [
		aStream
			nextPutAll: '"';
			nextPutAll: label asString;
			nextPutAll: '"' ].
	aStream nextPutAll: ')'
]

{ #category : #api }
IVObject >> renderSelector [

	self subclassResponsibility
]
