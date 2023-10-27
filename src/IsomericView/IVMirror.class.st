Class {
	#name : #IVMirror,
	#superclass : #IVBox,
	#instVars : [
		'mirrorStyle'
	],
	#category : #'IsomericView-Core'
}

{ #category : #accessing }
IVMirror >> mirrorStyle [

	^ mirrorStyle
]

{ #category : #accessing }
IVMirror >> mirrorStyle: anObject [

	mirrorStyle := anObject
]

{ #category : #api }
IVMirror >> renderSelector [

	^ #renderMirror:on:
]

{ #category : #api }
IVMirror >> yVertices [

	| vertices |
	vertices := self vertices.
	^ {
		  vertices first.
		  vertices fourth.
		  vertices seventh.
		  vertices sixth }
]
