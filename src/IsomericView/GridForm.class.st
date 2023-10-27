Class {
	#name : #GridForm,
	#superclass : #Form,
	#instVars : [
		'margin',
		'grid',
		'gridColor'
	],
	#category : #'IsomericView-View'
}

{ #category : #accessing }
GridForm >> grid [

	^ grid
]

{ #category : #accessing }
GridForm >> grid: anObject [

	grid := anObject
]

{ #category : #accessing }
GridForm >> gridColor [

	^ gridColor
]

{ #category : #accessing }
GridForm >> gridColor: anObject [

	gridColor := anObject
]

{ #category : #accessing }
GridForm >> margin [

	^ margin
]

{ #category : #accessing }
GridForm >> margin: anObject [

	margin := anObject
]

{ #category : #api }
GridForm >> setup [

	| p cell canvas extent |
	p := margin.
	cell := self extent - (margin * 2) // grid.
	extent := cell * grid.
	canvas := FormCanvas on: self.
	0 to: grid x do: [ :each |
		canvas
			line: p + (cell x * each @ 0)
			to: p + (cell x * each @ extent y)
			width: 1
			color: gridColor ].
	0 to: grid y do: [ :each |
		canvas
			line: p + (0 @ (cell y * each))
			to: p + (extent x @ (cell y * each))
			width: 1
			color: gridColor ]
]
