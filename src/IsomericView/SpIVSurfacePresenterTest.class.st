"
A SpIVSurfacePresenterTest is a test class for testing the behavior of SpIVSurfacePresenter
"
Class {
	#name : #SpIVSurfacePresenterTest,
	#superclass : #TestCase,
	#category : #'IsomericView-Tests'
}

{ #category : #'instance creation' }
SpIVSurfacePresenterTest >> newPresenter [

	^ SpIVSurfacePresenter new
]

{ #category : #test }
SpIVSurfacePresenterTest >> testAsSurface [

	| form arr a pr b |
	form := Form extent: 10 @ 20 depth: 32.
	arr := #( 1 2 3 ).
	a := IVSurface new
		     xMaterial: Color white;
		     yMaterial: Color black;
		     zMaterial: form.
	pr := a asPresenter.
	b := pr asSurface.
	self assert: b xMaterial equals: Color white.
	self assert: b yMaterial equals: Color black.
	self assert: b zMaterial identicalTo: form
]

{ #category : #test }
SpIVSurfacePresenterTest >> testXMaterial [

	| pr form |
	pr := self newPresenter.
	pr xMaterial: Color red.
	self assert: pr xMaterial equals: Color red.
	pr xMaterial: Color blue.
	self assert: pr xMaterial equals: Color blue.
	form := Form extent: 10 @ 20 depth: 32.
	pr xMaterial: form.
	self assert: pr xMaterial identicalTo: form
]

{ #category : #test }
SpIVSurfacePresenterTest >> testYMaterial [

	| pr form |
	pr := self newPresenter.
	pr yMaterial: Color red.
	self assert: pr yMaterial equals: Color red.
	pr yMaterial: Color blue.
	self assert: pr yMaterial equals: Color blue.
	form := Form extent: 10 @ 20 depth: 32.
	pr yMaterial: form.
	self assert: pr yMaterial identicalTo: form
]

{ #category : #test }
SpIVSurfacePresenterTest >> testZMaterial [

	| pr form |
	pr := self newPresenter.
	pr zMaterial: Color red.
	self assert: pr zMaterial equals: Color red.
	pr zMaterial: Color blue.
	self assert: pr zMaterial equals: Color blue.
	form := Form extent: 10 @ 20 depth: 32.
	pr zMaterial: form.
	self assert: pr zMaterial identicalTo: form
]
