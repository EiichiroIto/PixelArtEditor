"
An IVMirrorTest is a test class for testing the behavior of IVMirror
"
Class {
	#name : #IVMirrorTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #private }
IVMirrorTest >> newObj [

	^ IVMirror new
]

{ #category : #test }
IVMirrorTest >> testMirrorStyle [

	| obj style |
	obj := self newObj.
	self assert: obj mirrorStyle isNil.
	style := Color red.
	obj mirrorStyle: style.
	self assert: obj mirrorStyle identicalTo: style
]

{ #category : #test }
IVMirrorTest >> testRenderSelector [

	self assert: self newObj renderSelector isSymbol
]

{ #category : #test }
IVMirrorTest >> testYVertices [

	| obj arr |
	obj := self newObj
		       origin: (IVPoint x: 64 y: 119 z: 4);
		       extent: (IVPoint x: 10 y: 16 z: 50);
		       yourself.
	arr := obj yVertices.
	self assert: arr first x equals: 64.
	self assert: arr first y equals: 119.
	self assert: arr first z equals: 4.
	self assert: arr second x equals: 64.
	self assert: arr second y equals: 135.
	self assert: arr second z equals: 4.
	self assert: arr third x equals: 74.
	self assert: arr third y equals: 135.
	self assert: arr third z equals: 54.
	self assert: arr fourth x equals: 74.
	self assert: arr fourth y equals: 119.
	self assert: arr fourth z equals: 54
]
