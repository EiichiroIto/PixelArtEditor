Class {
	#name : #IVWoodenFloor,
	#superclass : #IVBox,
	#instVars : [
		'timberWidth',
		'timberColor',
		'timberSpace'
	],
	#category : #'IsomericView-Core'
}

{ #category : #api }
IVWoodenFloor >> renderSelector [

	^ #renderWoodenFloor:on:
]

{ #category : #accessing }
IVWoodenFloor >> timberColor [

	^ timberColor
]

{ #category : #accessing }
IVWoodenFloor >> timberColor: aColor [

	timberColor := aColor
]

{ #category : #accessing }
IVWoodenFloor >> timberSpace [

	^ timberSpace
]

{ #category : #accessing }
IVWoodenFloor >> timberSpace: anInteger [

	timberSpace := anInteger
]

{ #category : #accessing }
IVWoodenFloor >> timberWidth [

	^ timberWidth
]

{ #category : #accessing }
IVWoodenFloor >> timberWidth: anInteger [

	timberWidth := anInteger
]
