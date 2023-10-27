"
An IVPointTest is a test class for testing the behavior of IVPoint
"
Class {
	#name : #IVPointTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVPointTest >> newPoint [

	^ IVPoint new
]

{ #category : #test }
IVPointTest >> testAbs [

	| a r |
	a := IVPoint x: 1 y: 2 z: 3.
	r := a abs.
	self assert: r x equals: 1.
	self assert: r y equals: 2.
	self assert: r z equals: 3.
	a := IVPoint x: -1 y: -2 z: -3.
	r := a abs.
	self assert: r x equals: 1.
	self assert: r y equals: 2.
	self assert: r z equals: 3
]

{ #category : #test }
IVPointTest >> testAsIVPoint [

	| p r |
	p := self newPoint.
	r := p asIVPoint.
	self assert: p identicalTo: r
]

{ #category : #test }
IVPointTest >> testIsZero [

	| obj |
	obj := IVPoint x: 0 y: 0 z: 0.
	self assert: obj isZero.
	obj := IVPoint x: 1 y: 0 z: 0.
	self deny: obj isZero.
	obj := IVPoint x: 0 y: 1 z: 0.
	self deny: obj isZero.
	obj := IVPoint x: 0 y: 0 z: 1.
	self deny: obj isZero
]

{ #category : #test }
IVPointTest >> testMax [

	| a b r |
	a := IVPoint x: 10 y: 20 z: 30.
	b := IVPoint x: 15 y: 6 z: 7.
	r := a max: b.
	self assert: r x equals: 15.
	self assert: r y equals: 20.
	self assert: r z equals: 30.
	a := IVPoint x: 10 y: 20 z: 30.
	b := IVPoint x: 5 y: 26 z: 7.
	r := a max: b.
	self assert: r x equals: 10.
	self assert: r y equals: 26.
	self assert: r z equals: 30.
	a := IVPoint x: 10 y: 20 z: 30.
	b := IVPoint x: 5 y: 6 z: 37.
	r := a max: b.
	self assert: r x equals: 10.
	self assert: r y equals: 20.
	self assert: r z equals: 37
]

{ #category : #test }
IVPointTest >> testMin [

	| a b r |
	a := IVPoint x: 10 y: 20 z: 30.
	b := IVPoint x: 5 y: 26 z: 37.
	r := a min: b.
	self assert: r x equals: 5.
	self assert: r y equals: 20.
	self assert: r z equals: 30.
	a := IVPoint x: 10 y: 20 z: 30.
	b := IVPoint x: 15 y: 6 z: 37.
	r := a min: b.
	self assert: r x equals: 10.
	self assert: r y equals: 6.
	self assert: r z equals: 30.
	a := IVPoint x: 10 y: 20 z: 30.
	b := IVPoint x: 15 y: 26 z: 7.
	r := a min: b.
	self assert: r x equals: 10.
	self assert: r y equals: 20.
	self assert: r z equals: 7
]

{ #category : #test }
IVPointTest >> testMinus [

	| a b r |
	a := IVPoint x: 10 y: 20 z: 30.
	b := IVPoint x: 1 y: 2 z: 3.
	r := a - b.
	self assert: r x equals: 9.
	self assert: r y equals: 18.
	self assert: r z equals: 27.
	r := b - a.
	self assert: r x equals: -9.
	self assert: r y equals: -18.
	self assert: r z equals: -27
]

{ #category : #test }
IVPointTest >> testPlus [

	| a b r |
	a := IVPoint x: 10 y: 20 z: 30.
	b := IVPoint x: 1 y: 2 z: 3.
	r := a + b.
	self assert: r x equals: 11.
	self assert: r y equals: 22.
	self assert: r z equals: 33.
	r := b + a.
	self assert: r x equals: 11.
	self assert: r y equals: 22.
	self assert: r z equals: 33
]

{ #category : #test }
IVPointTest >> testPrintOn [

	| p s |
	p := self newPoint.
	s := WriteStream on: String new.
	p printOn: s.
	self assert: s contents equals: '(IVPoint x: nil y: nil z: nil)'.
	p := self newPoint.
	p setX: 1 setY: 2 setZ: 3.
	s := WriteStream on: String new.
	p printOn: s.
	self assert: s contents equals: '(IVPoint x: 1 y: 2 z: 3)'
]

{ #category : #test }
IVPointTest >> testPrintTripletOn [

	| p s |
	p := self newPoint.
	s := WriteStream on: String new.
	p printTripletOn: s.
	self assert: s contents equals: 'nil,nil,nil'.
	p := self newPoint.
	p setX: 1 setY: 2 setZ: 3.
	s := WriteStream on: String new.
	p printTripletOn: s.
	self assert: s contents equals: '1,2,3'
]

{ #category : #test }
IVPointTest >> testSetXSetYSetZ [

	| p |
	p := self newPoint.
	self assert: p x isNil.
	p setX: 123 setY: 456 setZ: 789.
	self assert: p x equals: 123.
	self assert: p y equals: 456.
	self assert: p z equals: 789.
	p setX: 9 setY: 8 setZ: 7.
	self assert: p x equals: 9.
	self assert: p y equals: 8.
	self assert: p z equals: 7
]

{ #category : #test }
IVPointTest >> testX [

	| p |
	p := self newPoint.
	self assert: p x isNil.
	p setX: 123 setY: nil setZ: nil.
	self assert: p x equals: 123.
	p setX: 456 setY: nil setZ: nil.
	self assert: p x equals: 456.
	self assert: p y isNil.
	self assert: p z isNil
]

{ #category : #test }
IVPointTest >> testY [

	| p |
	p := self newPoint.
	self assert: p y isNil.
	p setX: nil setY: 123 setZ: nil.
	self assert: p y equals: 123.
	p setX: nil setY: 456 setZ: nil.
	self assert: p y equals: 456.
	self assert: p x isNil.
	self assert: p z isNil
]

{ #category : #test }
IVPointTest >> testZ [

	| p |
	p := self newPoint.
	self assert: p z isNil.
	p setX: nil setY: nil setZ: 123.
	self assert: p z equals: 123.
	p setX: nil setY: nil setZ: 456.
	self assert: p z equals: 456.
	self assert: p x isNil.
	self assert: p y isNil
]
