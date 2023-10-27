Class {
	#name : #SpScrollableMorphPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'morphPane',
		'scrollablePane'
	],
	#category : #'PixelArtEditor-Spec2'
}

{ #category : #adding }
SpScrollableMorphPresenter >> addMorphPane [

	scrollablePane removeAll.
	scrollablePane add: morphPane withConstraints: [ :c | c height: 200 ]
]

{ #category : #layout }
SpScrollableMorphPresenter >> defaultLayout [

	^ SpScrollableLayout with: (SpPresenter new layout: scrollablePane)
]

{ #category : #initialization }
SpScrollableMorphPresenter >> initializePresenters [

	scrollablePane := SpBoxLayout newTopToBottom.

	morphPane := self newMorph
		             morph: Morph new;
		             yourself.

	self addMorphPane
]
