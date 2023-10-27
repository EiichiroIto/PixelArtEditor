Class {
	#name : #IVPlane,
	#superclass : #IVObject,
	#instVars : [
		'plane',
		'topMaterial'
	],
	#category : #'IsomericView-Core'
}

{ #category : #'ston-core' }
IVPlane class >> stonAllInstVarNames [

	^ self allInstVarNames \ #( surface )
]

{ #category : #testing }
IVPlane >> hasSurface [

	^ true
]

{ #category : #testing }
IVPlane >> isSurfaceDefined [

	^ topMaterial notNil
]

{ #category : #testing }
IVPlane >> onXPlane [

	^ plane = #x
]

{ #category : #testing }
IVPlane >> onYPlane [

	^ plane = #y
]

{ #category : #testing }
IVPlane >> onZPlane [

	^ plane = #z
]

{ #category : #accessing }
IVPlane >> plane [

	^ plane
]

{ #category : #accessing }
IVPlane >> plane: anObject [

	plane := anObject
]

{ #category : #api }
IVPlane >> topMaterial [

	^ topMaterial
]

{ #category : #api }
IVPlane >> topMaterial: aColor [

	topMaterial := aColor
]
