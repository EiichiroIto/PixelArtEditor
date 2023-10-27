Class {
	#name : #IVStatus,
	#superclass : #Object,
	#instVars : [
		'lastImportedFile',
		'lastProjectFile'
	],
	#category : #'IsomericView-Spec2'
}

{ #category : #accessing }
IVStatus >> lastImportedFile [

	^ lastImportedFile
]

{ #category : #accessing }
IVStatus >> lastImportedFile: anObject [

	lastImportedFile := anObject
]

{ #category : #accessing }
IVStatus >> lastProjectFile [

	^ lastProjectFile
]

{ #category : #accessing }
IVStatus >> lastProjectFile: anObject [

	lastProjectFile := anObject
]
