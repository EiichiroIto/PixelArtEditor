Class {
	#name : #IVPoint,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : #'IsomericView-Core'
}

{ #category : #'instance creation' }
IVPoint class >> x: anObject y: anObject2 z: anObject3 [

	^ self new
		  setX: anObject setY: anObject2 setZ: anObject3;
		  yourself
]

{ #category : #'instance creation' }
IVPoint class >> zero [

	^ self x: 0 y: 0 z: 0
]

{ #category : #arithmetic }
IVPoint >> + other [

	^ self class x: x + other x y: y + other y z: z + other z
]

{ #category : #arithmetic }
IVPoint >> - other [

	^ self class x: x - other x y: y - other y z: z - other z
]

{ #category : #arithmetic }
IVPoint >> abs [

	^ self class x: x abs y: y abs z: z abs
]

{ #category : #converting }
IVPoint >> asIVPoint [

	^ self
]

{ #category : #testing }
IVPoint >> isZero [

	^ x = 0 and: [ y = 0 and: [ z = 0 ] ]
]

{ #category : #accessing }
IVPoint >> max: other [

	^ self class x: (x max: other x) y: (y max: other y) z: (z max: other z)
]

{ #category : #accessing }
IVPoint >> min: other [

	^ self class x: (x min: other x) y: (y min: other y) z: (z min: other z)
]

{ #category : #printing }
IVPoint >> printOn: aStream [

	aStream
		nextPutAll: '(IVPoint x: ';
		nextPutAll: x asString;
		nextPutAll: ' y: ';
		nextPutAll: y asString;
		nextPutAll: ' z: ';
		nextPutAll: z asString;
		nextPutAll: ')'
]

{ #category : #printing }
IVPoint >> printTripletOn: aStream [

	aStream
		nextPutAll: x asString;
		nextPutAll: ',';
		nextPutAll: y asString;
		nextPutAll: ',';
		nextPutAll: z asString
]

{ #category : #accessing }
IVPoint >> setX: aNumber setY: aNumber2 setZ: aNumber3 [

	x := aNumber.
	y := aNumber2.
	z := aNumber3
]

{ #category : #accessing }
IVPoint >> x [

	^ x
]

{ #category : #accessing }
IVPoint >> y [

	^ y
]

{ #category : #accessing }
IVPoint >> z [

	^ z
]
