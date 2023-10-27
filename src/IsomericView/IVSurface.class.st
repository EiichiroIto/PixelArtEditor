Class {
	#name : #IVSurface,
	#superclass : #Object,
	#instVars : [
		'xMaterial',
		'yMaterial',
		'zMaterial'
	],
	#category : #'IsomericView-Core'
}

{ #category : #converting }
IVSurface >> asPresenter [

	^ SpIVSurfacePresenter new
		  xMaterial: xMaterial;
		  yMaterial: yMaterial;
		  zMaterial: zMaterial;
		  yourself
]

{ #category : #copying }
IVSurface >> deepCopy [

	^ self class new
		  xMaterial: xMaterial;
		  yMaterial: yMaterial;
		  zMaterial: zMaterial;
		  yourself
]

{ #category : #testing }
IVSurface >> isDefined [

	^ xMaterial notNil and: [ yMaterial notNil and: [ zMaterial notNil ] ]
]

{ #category : #testing }
IVSurface >> isDefinedPlane: aSymbol [

	^ (aSymbol = #x and: [ xMaterial notNil ]) or: [
		  (aSymbol = #y and: [ yMaterial notNil ]) or: [
			  aSymbol = #z and: [ zMaterial notNil ] ] ]
]

{ #category : #testing }
IVSurface >> isFormSurface [

	^ false
]

{ #category : #testing }
IVSurface >> isMaterialSurface [

	^ false
]

{ #category : #api }
IVSurface >> materialForPlane: aSymbol [

	aSymbol = #x ifTrue: [ ^ xMaterial ].
	aSymbol = #y ifTrue: [ ^ yMaterial ].
	aSymbol = #z ifTrue: [ ^ zMaterial ].
	^ nil
]

{ #category : #accessing }
IVSurface >> xMaterial [

	^ xMaterial
]

{ #category : #accessing }
IVSurface >> xMaterial: anObject [

	xMaterial := anObject
]

{ #category : #accessing }
IVSurface >> yMaterial [

	^ yMaterial
]

{ #category : #accessing }
IVSurface >> yMaterial: anObject [

	yMaterial := anObject
]

{ #category : #accessing }
IVSurface >> zMaterial [

	^ zMaterial
]

{ #category : #accessing }
IVSurface >> zMaterial: anObject [

	zMaterial := anObject
]
