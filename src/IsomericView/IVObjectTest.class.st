"
An IVObjectTest is a test class for testing the behavior of IVObject
"
Class {
	#name : #IVObjectTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVObjectTest >> newObj [

	^ IVObject new
]

{ #category : #test }
IVObjectTest >> testForm [

	| obj form |
	obj := self newObj.
	self assert: obj form isNil.
	form := Form extent: 1 @ 1 depth: 32.
	obj form: form.
	self assert: obj form identicalTo: form
]

{ #category : #test }
IVObjectTest >> testLabel [

	| obj |
	obj := self newObj.
	self assert: obj label isEmpty.
	obj label: 'abc'.
	self assert: obj label equals: 'abc'.
	obj label: 'def'.
	self assert: obj label equals: 'def'
]

{ #category : #test }
IVObjectTest >> testOrigin [

	| obj p |
	obj := self newObj.
	self assert: obj origin isNil.
	p := IVPoint x: 1 y: 2 z: 3.
	obj origin: p.
	self assert: obj origin identicalTo: p
]

{ #category : #test }
IVObjectTest >> testPrintOn [

	| obj s |
	obj := self newObj.
	s := WriteStream on: String new.
	obj printOn: s.
	self assert: s contents equals: 'IVObject()'.
	obj := self newObj.
	obj label: 'abc'.
	s := WriteStream on: String new.
	obj printOn: s.
	self assert: s contents equals: 'IVObject("abc")'
]
