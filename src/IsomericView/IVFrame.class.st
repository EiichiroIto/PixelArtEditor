Class {
	#name : #IVFrame,
	#superclass : #IVBox,
	#instVars : [
		'frameWidth'
	],
	#category : #'IsomericView-Core'
}

{ #category : #api }
IVFrame >> frameVertices [

	| vertices |
	vertices := self vertices.
	self onXPlane ifTrue: [
		^ vertices , {
			  (vertices first + (IVPoint x: 0 y: frameWidth z: frameWidth)).
			  (vertices second
			   + (IVPoint x: 0 y: frameWidth z: frameWidth negated)).
			  (vertices fifth
			   + (IVPoint x: 0 y: frameWidth negated z: frameWidth)).
			  (vertices sixth
			   + (IVPoint x: 0 y: frameWidth negated z: frameWidth negated)).
			  (vertices first
			   + (IVPoint x: self extent x y: frameWidth z: frameWidth)).
			  (vertices fifth
			   + (IVPoint x: self extent x y: frameWidth negated z: frameWidth)).
			  (vertices sixth
			   +
			   (IVPoint
				    x: self extent x
				    y: frameWidth negated
				    z: frameWidth negated)) } ].
	self onYPlane ifTrue: [
		^ vertices , {
			  (vertices first + (IVPoint x: frameWidth y: 0 z: frameWidth)).
			  (vertices second
			   + (IVPoint x: frameWidth y: 0 z: frameWidth negated)).
			  (vertices fifth
			   + (IVPoint x: frameWidth negated y: 0 z: frameWidth)).
			  (vertices sixth
			   + (IVPoint x: frameWidth negated y: 0 z: frameWidth negated)).
			  (vertices first
			   + (IVPoint x: frameWidth y: self extent y z: frameWidth)).
			  (vertices fifth
			   + (IVPoint x: frameWidth negated y: self extent y z: frameWidth)).
			  (vertices sixth
			   +
			   (IVPoint
				    x: frameWidth negated
				    y: self extent y
				    z: frameWidth negated)) } ].
	self onZPlane ifTrue: [ ^ vertices ]
]

{ #category : #accessing }
IVFrame >> frameWidth [

	^ frameWidth
]

{ #category : #accessing }
IVFrame >> frameWidth: anObject [

	frameWidth := anObject
]

{ #category : #api }
IVFrame >> renderSelector [

	^ #renderFrame:on:
]
