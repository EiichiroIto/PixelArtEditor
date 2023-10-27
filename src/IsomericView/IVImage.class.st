Class {
	#name : #IVImage,
	#superclass : #IVObject,
	#category : #'IsomericView-Core'
}

{ #category : #accessing }
IVImage >> extent [

	form ifNil: [ ^ IVPoint x: 0 y: 0 z: 0 ].
	^ IVPoint x: form width y: form height z: 0
]

{ #category : #testing }
IVImage >> hasSurface [

	^ false
]

{ #category : #testing }
IVImage >> isImage [

	^ true
]

{ #category : #api }
IVImage >> renderSelector [

	^ #renderImage:on:
]
