"
An IVStatusTest is a test class for testing the behavior of IVStatus
"
Class {
	#name : #IVStatusTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #'instance creation' }
IVStatusTest >> newObj [

	^ IVStatus new
]

{ #category : #test }
IVStatusTest >> testLastImportedFile [

	| obj file |
	obj := self newObj.
	self assert: obj lastImportedFile isNil.
	file := 'abc' asFileReference.
	obj lastImportedFile: file.
	self assert: obj lastImportedFile identicalTo: file
]

{ #category : #test }
IVStatusTest >> testLastProjectFile [

	| obj file |
	obj := self newObj.
	self assert: obj lastProjectFile isNil.
	file := 'abc' asFileReference.
	obj lastProjectFile: file.
	self assert: obj lastProjectFile identicalTo: file
]
