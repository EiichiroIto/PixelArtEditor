Class {
	#name : #SpPixelArtEditor,
	#superclass : #SpPresenter,
	#instVars : [
		'editorPane',
		'menu',
		'editor',
		'status',
		'colorItem',
		'editorToolbar',
		'palettePane',
		'viewerPane',
		'statusBar',
		'colorInput',
		'notifyBlock',
		'copyForm',
		'whiteButton',
		'blackButton',
		'eraseButton'
	],
	#category : #'PixelArtEditor-Spec2'
}

{ #category : #constants }
SpPixelArtEditor class >> colorHeight [

	^ 40
]

{ #category : #accessing }
SpPixelArtEditor class >> descriptionText [

	^ 'A tool to draw pixelart image.'
]

{ #category : #accessing }
SpPixelArtEditor class >> icon [

	^ self iconNamed: #glamorousEdit
]

{ #category : #'world menu' }
SpPixelArtEditor class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: 'Pixelart Editor')
		action: [ self new open ];
		order: 10;
		parent: #Tools;
		help: self descriptionText;
		icon: self icon
]

{ #category : #constants }
SpPixelArtEditor >> appName [

	^ 'Pixel Art Editor'
]

{ #category : #forms }
SpPixelArtEditor >> appicons [
^ (Form
	extent: (64@48)
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33686018 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 16842753 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 16842753 4294967295 4278190080 4278190080 4294967295 0 0 0 0 4294967295 4294967295 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4278190080 4294967295 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4278190080 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4294967295 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 0 0 0 0 4294967295 4278190080 0 0 4278190080 4294967295 4294967295 4294967295 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 0 0 4294967295 4278190080 0 0 0 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4278190080 4294967295 33686018 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4289374890 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 4294967295 4278190080 0 0 0 0 0 0 0 0 0 0 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4278190080 4294967295 33686018 0 0 0 0 0 0 4294967295 4278190080 4294967295 4278190080 4289374890 4289374890 4289374890 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 4294967295 4278190080 0 0 0 0 0 0 0 0 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4278190080 4289374890 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 0 0 4294967295 4278190080 0 0 0 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4294967295 0 4294967295 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4289374890 4289374890 4289374890 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4289374890 4289374890 4278190080 4294967295 0 0 0 0 0 0 4294967295 4278190080 0 0 4278190080 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4278190080 4289374890 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4294967295 0 0 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 16842753 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 0 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 33686018 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 0 0 4294967295 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 117769477 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 4294967295 4294967295 0 0 4294967295 0 0 0 4294967295 4294967295 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 4294967295 4294967295 4278190080 4294967295 4278190080 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 4294967295 4294967295 4278190080 4294967295 4294967295 0 0 4294967295 4278190080 4278190080 4294967295 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 4294967295 4278190080 4278190080 4294967295 4278190080 4294967295 4278190080 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4294967295 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 4278190080 4294967295 0 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4294967295 4278190080 4278190080 4294967295 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4278190080 4278190080 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 4294967295 4294967295 4278190080 4294967295 4278190080 4294967295 4278190080 4278190080 4294967295 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 0 0 0 0 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4278190080 4278190080 4294967295 4278190080 4294967295 4278190080 4294967295 4278190080 4294967295 0 4294967295 4278190080 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 4278190080 4294967295 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4294967295 4278190080 4294967295 0 4294967295 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4278190080 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4278190080 4294967295 0 0 0 0 4294967295 4294967295 4278190080 4294967295 4294967295 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 4294967295 4294967295 0 0 0 0 0 0 4294967295 4278190080 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 4278190080 4294967295 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4278190080 4294967295 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4278190080 4278190080 4294967295 4294967295 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 4294967295 4294967295 0 117769477 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 4294967295 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 4294967295 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 4278190080 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 4294967295 4294967295 0 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 4294967295 4278190080 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 4294967295 4294967295 4294967295 4278190080 4294967295 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4278190080 4294967295 0 0 0 4294967295 4278190080 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4278190080 4294967295 0 0 0 4294967295 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 4294967295 0 0 0 0 0 0 0 0 0 4294967295 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 4278190080 4294967295 0 0 0 4294967295 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4294967295 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: (0@0))
]

{ #category : #private }
SpPixelArtEditor >> changeColorFromText: aString [

	| color |
	color := nil.
	aString = 'erase'
		ifTrue: [ color := Color transparent ]
		ifFalse: [
			[ color := Color fromHexString: aString ]
				on: Error
				do: [ ^ self ] ].
	colorItem morph
		color: color;
		changed
]

{ #category : #private }
SpPixelArtEditor >> clearMessage [

	statusBar pushMessage: ''
]

{ #category : #private }
SpPixelArtEditor >> colorAt: aPoint [

	| color |
	color := editor colorAt: aPoint.
	^ color
]

{ #category : #private }
SpPixelArtEditor >> colorAt: aPoint put: aColor [

	editor colorAt: aPoint put: aColor.
	status isDragging ifFalse: [ self updateForm ]
]

{ #category : #'event handling' }
SpPixelArtEditor >> colorClick: anEvent morph: aMorph [

	| ret |
	ret := self uiManager chooseColor: self currentColor.
	ret ifNil: [ ^ self ].
	self currentColor: ret
]

{ #category : #accessing }
SpPixelArtEditor >> colorItem [

	^ colorItem
]

{ #category : #accessing }
SpPixelArtEditor >> colorMorph [

	^ colorItem morph
]

{ #category : #initialization }
SpPixelArtEditor >> connectPresenters [

	colorInput whenTextChangedDo: [
		self changeColorFromText: colorInput text ].
	self editorMorph
		on: #mouseDown send: #editorMouseDown:morph: to: self;
		on: #mouseMove send: #editorMouseMove:morph: to: self;
		on: #mouseUp send: #editorMouseUp:morph: to: self.
	self paletteMorph on: #click send: #paletteClick:morph: to: self.
	self colorMorph on: #click send: #colorClick:morph: to: self.
	whiteButton action: [ self currentColor: Color white ].
	blackButton action: [ self currentColor: Color black ].
	eraseButton action: [ self currentColor: Color transparent ]
]

{ #category : #private }
SpPixelArtEditor >> copyRectangle: aRectangle [

	aRectangle ifNil: [ ^ self ].
	aRectangle extent = (0 @ 0) ifFalse: [
		copyForm := editor form contentsOfArea:
			            (aRectangle extendBy: (0 @ 0 corner: 1 @ 1)) ]
]

{ #category : #private }
SpPixelArtEditor >> currentColor [

	^ colorItem morph color
]

{ #category : #private }
SpPixelArtEditor >> currentColor: aColor [

	aColor ifNil: [ ^ self ].

	colorInput text: (aColor = Color transparent
			 ifTrue: [ 'erase' ]
			 ifFalse: [ aColor asHexString ]).
	colorItem morph color: aColor
]

{ #category : #constants }
SpPixelArtEditor >> defaultBackgroundColor [

	^ Color veryLightGray
]

{ #category : #constants }
SpPixelArtEditor >> defaultColor [

	^ Color white
]

{ #category : #constants }
SpPixelArtEditor >> defaultEditorScale [

	^ 8
]

{ #category : #constants }
SpPixelArtEditor >> defaultExtent [

	^ 48 @ 64
]

{ #category : #constants }
SpPixelArtEditor >> defaultFormProtocol [

	^ 'forms'
]

{ #category : #constants }
SpPixelArtEditor >> defaultGridColor [

	^ Color lightGray
]

{ #category : #layout }
SpPixelArtEditor >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: menu
		  withConstraints: [ :c | c height: self class toolbarHeight ];
		  add: editorToolbar expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: editorPane;
				   add: (SpBoxLayout newVertical
						    add: viewerPane;
						    add: (SpBoxLayout newHorizontal
								     add: colorItem withConstraints: [ :c | c width: 100 ];
								     add: whiteButton;
								     add: blackButton;
								     add: eraseButton;
								     yourself)
						    withConstraints: [ :c | c height: self class colorHeight ];
						    add: colorInput withConstraints: [ :c | c height: 40 ];
						    add: palettePane
						    withConstraints: [ :c | c height: self paletteExtent y ];
						    yourself)
				   withConstraints: [ :c | c width: 250 ];
				   yourself);
		  add: statusBar expand: false;
		  yourself
]

{ #category : #constants }
SpPixelArtEditor >> defaultPaletteFile [

	^ FileSystem workingDirectory / 'palette.png'
]

{ #category : #constants }
SpPixelArtEditor >> defaultViewerScale [

	^ 1
]

{ #category : #constants }
SpPixelArtEditor >> drawButtonLabel [

	^ 'Draw' localized
]

{ #category : #private }
SpPixelArtEditor >> drawOval: aRectangle [

	aRectangle ifNil: [ ^ self ].
	self pushUndo.
	editor drawOval: aRectangle color: self currentColor.
	self updateForm.
	self showUsedColors
]

{ #category : #private }
SpPixelArtEditor >> drawRectangle: aRectangle [

	aRectangle ifNil: [ ^ self ].
	self pushUndo.
	editor drawRectangle: aRectangle color: self currentColor.
	self updateForm.
	self showUsedColors
]

{ #category : #accessing }
SpPixelArtEditor >> editor [

	^ editor
]

{ #category : #accessing }
SpPixelArtEditor >> editorMorph [

	^ editorPane morph
]

{ #category : #'event handling' }
SpPixelArtEditor >> editorMouseDown: anEvent morph: aMorph [

	| pos |
	pos := self editorMorph screenToFormPoint: anEvent cursorPoint.
	(editor containsPoint: pos) ifFalse: [ ^ self toggleEditorBackground ].
	status lastPoint: pos.
	self showPoint: pos.
	status isDrawing ifTrue: [
		status startDragging.
		self pushUndo.
		^ self colorAt: pos put: self currentColor ].
	status isErasing ifTrue: [
		status startDragging.
		self pushUndo.
		^ self colorAt: pos put: Color transparent ].
	status isPicking ifTrue: [ ^ self currentColor: (self colorAt: pos) ].
	status isPaintingHorizontally ifTrue: [
		status startDragging.
		status baseColor: (self colorAt: pos).
		self pushUndo.
		^ self paintAt: pos direction: 1 @ 0 ].
	status isPaintingVertically ifTrue: [
		status startDragging.
		status baseColor: (self colorAt: pos).
		self pushUndo.
		^ self paintAt: pos direction: 0 @ 1 ].
	(status isDrawingRectangle or: [
		 status isDrawingOval or: [ status isCopying ] ]) ifTrue: [
		status startDragging.
		self editorMorph
			beRectangleSelection;
			startSelecting: pos.
		^ self ].
	status isDrawingLine ifTrue: [
		status startDragging.
		self editorMorph
			beLineSelection;
			startSelecting: pos.
		^ self ].
	status isReplacing ifTrue: [ ^ self replaceColorAt: pos ].
	self error
]

{ #category : #'event handling' }
SpPixelArtEditor >> editorMouseMove: anEvent morph: aMorph [

	| pos |
	pos := self editorMorph screenToFormPoint: anEvent cursorPoint.
	self showPoint: pos.
	status isDrawing ifTrue: [
		status isDragging ifTrue: [
			self colorAt: pos put: self currentColor ].
		^ self ].
	status isErasing ifTrue: [
		status isDragging ifTrue: [
			self colorAt: pos put: Color transparent ].
		^ self ].
	(status isPicking or: [ status isReplacing ]) ifTrue: [ ^ self ].
	(status isPaintingHorizontally or: [ status isPaintingVertically ])
		ifTrue: [
			status isDragging ifTrue: [ self paintAt: pos direction: 1 @ 0 ].
			^ self ].
	(status isDrawingRectangle or: [
		 status isDrawingOval or: [
			 status isCopying or: [ status isDrawingLine ] ] ]) ifTrue: [
		status isDragging ifTrue: [ self editorMorph endSelecting: pos ].
		^ self ].
	self error
]

{ #category : #'event handling' }
SpPixelArtEditor >> editorMouseUp: anEvent morph: aMorph [

	| pos |
	pos := self editorMorph screenToFormPoint: anEvent cursorPoint.
	status isDragging ifTrue: [
		status endDragging.
		self updateForm ].
	status isDrawing ifTrue: [ ^ self ].
	status isErasing ifTrue: [ ^ self ].
	status isPicking ifTrue: [ ^ self ].
	status isReplacing ifTrue: [ ^ self ].
	(status isPaintingHorizontally or: [ status isPaintingVertically ])
		ifTrue: [
			self updateForm.
			^ self showUsedColors ].
	status isDrawingRectangle ifTrue: [
		self editorMorph endSelecting: pos.
		self drawRectangle: self editorMorph selection.
		self editorMorph clearSelection.
		^ self ].
	status isDrawingOval ifTrue: [
		self editorMorph endSelecting: pos.
		self drawOval: self editorMorph selection.
		self editorMorph clearSelection.
		^ self ].
	status isCopying ifTrue: [
		self editorMorph endSelecting: pos.
		self copyRectangle: self editorMorph selection.
		self editorMorph clearSelection.
		^ self ].
	status isDrawingLine ifTrue: [
		self editorMorph endSelecting: pos.
		self lineTo: pos.
		self editorMorph clearSelection.
		^ self ].
	self error
]

{ #category : #accessing }
SpPixelArtEditor >> editorPane [

	^ editorPane
]

{ #category : #accessing }
SpPixelArtEditor >> editorToolbar [

	^ editorToolbar
]

{ #category : #actions }
SpPixelArtEditor >> exportFile [

	| ret form |
	form := editor form.
	form ifNil: [ ^ self ].
	ret := self uiManager
		       chooseForSaveFileReference: 'Export file ...'
		       extensions: { 'png'. 'gif' }
		       path: (status lastImportedFile ifNil: [
				        FileSystem workingDirectory / 'Unnamed.png' ]).
	ret ifNil: [ ^ self ].
	ret extension = 'gif'
		ifTrue: [ GIFReadWriter putForm: form onFileNamed: ret ]
		ifFalse: [
			ret extension = 'png' ifFalse: [ ret := ret withExtension: 'png' ].
			PNGReadWriter putForm: form onFileNamed: ret ].
	status lastImportedFile: ret asFileReference
]

{ #category : #actions }
SpPixelArtEditor >> exportMethod [

	| dialog class form methodName |
	form := editor form.
	form ifNil: [ ^ self ].
	dialog := SpFilteringListPresenter new.
	dialog items: Smalltalk globals allClasses asArray.
	dialog applyFilter: (status lastExportedClass ifNil: [ '' ]).
	dialog openModal.
	class := dialog selectedItem.
	class ifNil: [ ^ self ].
	methodName := self uiManager
		              request: 'Method name?' localized
		              initialAnswer:
		              (status lastProjectFile
			               ifNotNil: [ :f | f base ]
			               ifNil: [ 'Unnamed' ]).
	(methodName isNil or: [ methodName isEmpty ]) ifTrue: [ ^ self ].
	status lastExportedClass: class name.
	class compile: methodName , String cr , '^ ' , form storeString.
	class >> methodName asSymbol protocol: self defaultFormProtocol
]

{ #category : #initialization }
SpPixelArtEditor >> fileMenu [

	| m |
	m := self newMenu.
	m addGroup: [ :grp |
		grp
			addItem: [ :item |
				item
					name: 'New Project' localized;
					action: [ self newProject ] ];
			addItem: [ :item |
				item
					name: 'Open Project ...' localized;
					action: [ self openProject ] ] ];
	 addGroup: [ :grp |
		grp
			addItem: [ :item |
				item
					name: 'Save and Return' localized;
					action: [ self saveAndReturn ];
					enabled: [ notifyBlock notNil ] ];
			addItem: [ :item |
				item
					name: 'Save Project' localized;
					action: [ self saveProjectNoDialog ] ];
			addItem: [ :item |
				item
					name: 'Save Project As' localized;
					action: [ self saveProject ] ] ].
	m addGroup: [ :grp |
		grp
			addItem: [ :item |
				item
					name: 'Import file ...' localized;
					action: [ self importFile ] ];
			addItem: [ :item |
				item
					name: 'Import expression ...' localized;
					action: [ self importExpression ] ];
			addItem: [ :item |
				item
					name: 'Export as file' localized;
					action: [ self exportFile ] ];
			addItem: [ :item |
				item
					name: 'Export as method' localized;
					action: [ self exportMethod ] ] ].
	m addGroup: [ :grp |
		grp addItem: [ :item |
			item
				name: 'Close' localized;
				action: [ self window close ] ] ].
	^ m
]

{ #category : #actions }
SpPixelArtEditor >> flipHorizontally [

	editor flipHorizontally.
	self updateForm
]

{ #category : #actions }
SpPixelArtEditor >> flipVertically [

	editor flipVertically.
	self updateForm
]

{ #category : #initialization }
SpPixelArtEditor >> helpMenu [

	^ self newMenu
		  addItem: [ :item | 
			  item
				  name: ('About ' , self appName) localized;
				  action: [ owner window showAbout ] ];
		  addItem: [ :item | 
			  item
				  name: 'Inspect';
				  action: [ self inspect ] ];
		  yourself
]

{ #category : #actions }
SpPixelArtEditor >> hideGrid [

	self editorMorph showGrid: false.
	self updateForm
]

{ #category : #api }
SpPixelArtEditor >> iconAt: aPoint [

	^ self appicons contentsOfArea:
		  (Rectangle
			   origin: aPoint * self iconExtent
			   extent: self iconExtent)
]

{ #category : #constants }
SpPixelArtEditor >> iconExtent [

	^ 16 @ 16
]

{ #category : #actions }
SpPixelArtEditor >> importExpression [

	| ret value |
	ret := self uiManager
		       request: 'Enter expression evaluated to Form' localized
		       initialAnswer: 'nil'.
	(ret isNil or: [ ret isEmpty ]) ifTrue: [ ^ self ].
	value := Object evaluate: ret.
	value ifNil: [ ^ self ].
	value isForm ifFalse: [ ^ self inform: 'It is not form.' localized ].
	self pasteForm: value
]

{ #category : #actions }
SpPixelArtEditor >> importFile [

	| ret form |
	ret := self uiManager chooseFullFileNameMatching:
		       { '*.gif'. '*.png' }.
	ret ifNil: [ ^ self ].
	form := nil.
	(ret endsWith: '.gif') ifTrue: [
		form := GIFReadWriter formFromFileNamed: ret ].
	(ret endsWith: '.png') ifTrue: [
		form := PNGReadWriter formFromFileNamed: ret ].
	form ifNil: [ ^ self ].
	status lastImportedFile: ret asFileReference.
	self pasteForm: form
]

{ #category : #initialization }
SpPixelArtEditor >> initialize [

	status := self newStatus.
	editor := self newEditor.
	super initialize
]

{ #category : #initialization }
SpPixelArtEditor >> initializePresenters [

	menu := self newMenuBar.
	editorToolbar := self newToolbar.
	editorPane := self newMorph
		              morph: self newEditorMorph;
		              yourself.
	viewerPane := self newMorph
		              morph: self newViewerMorph;
		              yourself.
	colorItem := self newMorph
		             morph: self newColorMorph;
		             yourself.
	colorInput := self newTextInput
		              text: colorItem morph color asHexString;
		              maxLength: 6;
		              yourself.
	palettePane := self newMorph
		               morph: self newPaletteMorph;
		               yourself.
	statusBar := self newStatusBar.
	whiteButton := self newButton
		               color: Color white;
		               yourself.
	blackButton := self newButton
		               color: Color black;
		               yourself.
	eraseButton := self newButton
		               label: 'Erase';
		               yourself.
	self setupMenu.
	self setupToolbar.
	self updateForm.
	self loadDefaultPalette
]

{ #category : #initialization }
SpPixelArtEditor >> initializeWindow: aWindow [

	aWindow
		initialExtent: 1024 @ 764;
		title: self appName
]

{ #category : #actions }
SpPixelArtEditor >> inputFormHeight [

	| ret oldValue newValue |
	oldValue := editor height.
	ret := self uiManager
		       request: 'Input form height' localized
		       initialAnswer: oldValue asString.
	(ret isNil or: [ ret isEmpty ]) ifTrue: [ ^ self ].
	newValue := 0.
	[ newValue := ret asInteger ]
		on: Error
		do: [ ^ self inform: 'Invalid value' ].
	(newValue isNil or: [ newValue <= 0 or: [ newValue = oldValue ] ])
		ifTrue: [ ^ self ].
	editor newHeight: newValue.
	self updateForm.
	self showFormInfo
]

{ #category : #actions }
SpPixelArtEditor >> inputFormWidth [

	| ret oldValue newValue |
	oldValue := editor width.
	ret := self uiManager
		       request: 'Input form width' localized
		       initialAnswer: oldValue asString.
	(ret isNil or: [ ret isEmpty ]) ifTrue: [ ^ self ].
	newValue := 0.
	[ newValue := ret asInteger ]
		on: Error
		do: [ ^ self inform: 'Invalid value' ].
	(newValue isNil or: [ newValue <= 0 or: [ newValue = oldValue ] ])
		ifTrue: [ ^ self ].
	editor newWidth: newValue.
	self updateForm.
	self showFormInfo
]

{ #category : #actions }
SpPixelArtEditor >> lineTo: aPoint [

	self pushUndo.
	editor line: status lastPoint to: aPoint color: self currentColor.
	self updateForm
]

{ #category : #private }
SpPixelArtEditor >> loadDefaultPalette [

	| file form |
	file := self defaultPaletteFile.
	file exists ifFalse: [ ^ self ].
	form := PNGReadWriter formFromFileNamed: file.
	self paletteMorph form: form
]

{ #category : #accessing }
SpPixelArtEditor >> menu [

	^ menu
]

{ #category : #'instance creation' }
SpPixelArtEditor >> newColorMorph [

	^ Morph new
		  color: self defaultColor;
		  yourself
]

{ #category : #'instance creation' }
SpPixelArtEditor >> newEditor [

	^ PixelArtEditor new
		  form: self newForm;
		  yourself
]

{ #category : #'instance creation' }
SpPixelArtEditor >> newEditorMorph [

	^ PAEditorMorph new
		  scale: self defaultEditorScale;
		  gridColor: self defaultGridColor;
		  color: self defaultBackgroundColor;
		  yourself
]

{ #category : #'instance creation' }
SpPixelArtEditor >> newForm [

	^ Form extent: self defaultExtent depth: 32
]

{ #category : #'instance creation' }
SpPixelArtEditor >> newPaletteForm [

	^ (Form extent: self paletteExtent depth: 32)
		  fillColor: Color white;
		  yourself
]

{ #category : #'instance creation' }
SpPixelArtEditor >> newPaletteMorph [

	^ PAPaletteMorph new
		  color: Color veryLightGray;
		  form: self newPaletteForm;
		  penSize: self palettePenSize;
		  yourself
]

{ #category : #actions }
SpPixelArtEditor >> newProject [

	editor := self newEditor.
	editor form: self newForm.
	self reset
]

{ #category : #'instance creation' }
SpPixelArtEditor >> newStatus [

	^ PAStatus new
]

{ #category : #'instance creation' }
SpPixelArtEditor >> newViewerMorph [

	^ PAViewerMorph new
		  scale: self defaultViewerScale;
		  color: self defaultBackgroundColor;
		  yourself
]

{ #category : #actions }
SpPixelArtEditor >> openProject [

	| ret dict |
	ret := self uiManager chooseFullFileNameMatching:
		       { ('*.' , self projectExtension) }.
	ret ifNil: [ ^ self ].
	dict := STON fromString: ret asFileReference readStream contents.
	dict isDictionary ifFalse: [ ^ self error: 'invalid project file' ].
	editor := self newEditor.
	editor form: (dict at: #form).
	status := self newStatus.
	self resetToolbarButton.
	self paletteMorph form: (dict at: #palette).
	self currentColor: (dict at: #currentColor).
	self updateForm.
	status lastProjectFile: ret asFileReference.
	self showUsedColors
]

{ #category : #private }
SpPixelArtEditor >> paintAt: aPoint direction: aPoint2 [

	status baseColor ifNil: [ ^ self ].
	editor
		paint: self currentColor
		baseColor: status baseColor
		at: aPoint
		direction: aPoint2
		threshold: self paintThreshold
]

{ #category : #constants }
SpPixelArtEditor >> paintThreshold [

	^ 0.05
]

{ #category : #'event handling' }
SpPixelArtEditor >> paletteClick: anEvent morph: aMorph [

	| pos |
	pos := anEvent cursorPoint - aMorph topLeft.
	status isPicking
		ifTrue: [ self paletteColorAt: pos put: self currentColor ]
		ifFalse: [ self currentColor: (self paletteColorAt: pos) ]
]

{ #category : #private }
SpPixelArtEditor >> paletteColorAt: aPoint [

	^ palettePane morph colorAt: aPoint
]

{ #category : #private }
SpPixelArtEditor >> paletteColorAt: aPoint put: aColor [

	palettePane morph colorAt: aPoint put: aColor
]

{ #category : #constants }
SpPixelArtEditor >> paletteExtent [

	^ 300 @ 200
]

{ #category : #accessing }
SpPixelArtEditor >> paletteMorph [

	^ palettePane morph
]

{ #category : #accessing }
SpPixelArtEditor >> palettePane [

	^ palettePane
]

{ #category : #constants }
SpPixelArtEditor >> palettePenSize [

	^ 20 @ 20
]

{ #category : #actions }
SpPixelArtEditor >> paste [

	self pasteForm: copyForm
]

{ #category : #private }
SpPixelArtEditor >> pasteForm: aForm [

	| canvas |
	aForm ifNil: [ ^ self ].
	self pushUndo.
	canvas := FormCanvas on: editor form.
	canvas translucentImage: aForm at: status lastPoint.
	self updateForm.
	self showFormInfo
]

{ #category : #constants }
SpPixelArtEditor >> projectExtension [

	^ 'pxe'
]

{ #category : #private }
SpPixelArtEditor >> pushUndo [

	status undoForm: editor form deepCopy
]

{ #category : #private }
SpPixelArtEditor >> reduceColors [

	| num1 num2 |
	self pushUndo.
	num1 := editor numColors.
	editor reduceColors.
	num2 := editor numColors.
	self updateForm.
	statusBar pushMessage: ('Colors {1} to {2}' format: {
				 num1.
				 num2 })
]

{ #category : #actions }
SpPixelArtEditor >> replaceColorAt: aPoint [

	| color |
	color := self colorAt: aPoint.
	(color isNil or: [ color isTransparent ]) ifTrue: [ ^ self ].
	self pushUndo.
	editor replaceColor: color withColor: self currentColor.
	self updateForm
]

{ #category : #private }
SpPixelArtEditor >> reset [

	status := self newStatus.
	self resetToolbarButton.
	self currentColor: self defaultColor.
	self updateForm.
	self clearMessage.
	status
		lastImportedFile: nil;
		lastProjectFile: nil
]

{ #category : #actions }
SpPixelArtEditor >> resetPalette [

	self paletteMorph form: self newPaletteForm
]

{ #category : #private }
SpPixelArtEditor >> resetToolbarButton [

	| button |
	button := editorToolbar itemNamed: self drawButtonLabel.
	button beSelected
]

{ #category : #actions }
SpPixelArtEditor >> rotateLeft [

	self pushUndo.
	editor
		rotateLeft;
		trimVertically;
		trimHorizontally.
	self updateForm.
	statusBar pushMessage: ('extent {1}' format: { editor extent })
]

{ #category : #actions }
SpPixelArtEditor >> rotateRight [

	self pushUndo.
	editor
		rotateRight;
		trimVertically;
		trimHorizontally.
	self updateForm.
	statusBar pushMessage: ('extent {1}' format: { editor extent })
]

{ #category : #actions }
SpPixelArtEditor >> saveAndReturn [

	notifyBlock cull: editor form.
	self window close
]

{ #category : #actions }
SpPixelArtEditor >> savePaletteAsDefault [

	(self confirm: 'Save palette as default?' localized) ifFalse: [
		^ self ].
	PNGReadWriter
		putForm: self paletteMorph form
		onFileNamed: self defaultPaletteFile
]

{ #category : #actions }
SpPixelArtEditor >> saveProject [

	| ret form |
	form := editor form.
	form ifNil: [ ^ self ].
	ret := self uiManager
		       chooseForSaveFileReference: 'Save project ...'
		       extensions: { self projectExtension }
		       path: (status lastProjectFile ifNil: [
				        FileSystem workingDirectory
				        / ('Unnamed.' , self projectExtension) ]).
	ret ifNil: [ ^ self ].
	self saveProjectAs: ret asFileReference
]

{ #category : #private }
SpPixelArtEditor >> saveProjectAs: aFileReference [

	| dict text |
	dict := Dictionary new.
	dict at: #form put: editor form.
	dict at: #palette put: self paletteMorph form.
	dict at: #currentColor put: self currentColor.
	text := STON toString: dict.
	aFileReference exists ifTrue: [ aFileReference delete ].
	aFileReference writeStreamDo: [ :stream | stream nextPutAll: text ].
	status lastProjectFile: aFileReference
]

{ #category : #actions }
SpPixelArtEditor >> saveProjectNoDialog [

	status lastProjectFile ifNil: [ ^ self saveProject ].
	self saveProjectAs: status lastProjectFile
]

{ #category : #private }
SpPixelArtEditor >> setEditorGridColor [

	self editorMorph gridColor:
		(self editorMorph color = self defaultGridColor
			 ifTrue: [ Color white ]
			 ifFalse: [ self defaultGridColor ])
]

{ #category : #actions }
SpPixelArtEditor >> setLargeSize [

	self editorMorph scale: 1.5 * self defaultEditorScale.
	self viewerMorph scale: 2 * self defaultViewerScale.
	self updateForm
]

{ #category : #actions }
SpPixelArtEditor >> setNormalSize [

	self editorMorph scale: self defaultEditorScale.
	self viewerMorph scale: self defaultViewerScale.
	self updateForm
]

{ #category : #actions }
SpPixelArtEditor >> setSmallSize [

	self editorMorph scale: self defaultEditorScale // 2.
	self viewerMorph scale: self defaultViewerScale.
	self updateForm
]

{ #category : #initialization }
SpPixelArtEditor >> setupMenu [

	menu
		addItem: [ :item |
			item
				name: 'File' localized;
				subMenu: self fileMenu ];
		addItem: [ :item |
			item
				name: 'View' localized;
				subMenu: self viewMenu ];
		addItem: [ :item |
			item
				name: 'Tools' localized;
				subMenu: self toolsMenu ];
		addItem: [ :item |
			item
				name: 'Help' localized;
				subMenu: self helpMenu ]
]

{ #category : #initialization }
SpPixelArtEditor >> setupToolbar [

	| draw erase pick vPaint hPaint rect copy oval replace line |
	draw := self newToolbarToggleButton
		        label: self drawButtonLabel;
		        help: 'Draw';
		        icon: (self iconAt: 2 @ 0);
		        action: [ status beDrawing ];
		        yourself.
	rect := self newToolbarToggleButton
		        label: 'Rect';
		        help: 'Draw rectangle';
		        icon: (self iconAt: 0 @ 1);
		        action: [ status beDrawingRectangle ];
		        yourself.
	erase := self newToolbarToggleButton
		         label: 'Erase';
		         help: 'Erase';
		         icon: (self iconAt: 3 @ 0);
		         action: [ status beErasing ];
		         yourself.
	pick := self newToolbarToggleButton
		        label: 'Pick';
		        help: 'Pick color up';
		        icon: (self iconAt: 1 @ 0);
		        action: [ status bePicking ];
		        yourself.
	hPaint := self newToolbarToggleButton
		          label: 'H.Paint';
		          help: 'Horizontal paint';
		          icon: (self iconAt: 1 @ 1);
		          action: [ status bePaintingHorizontally ];
		          yourself.
	vPaint := self newToolbarToggleButton
		          label: 'V.Paint';
		          help: 'Vertical paint';
		          icon: (self iconAt: 2 @ 1);
		          action: [ status bePaintingVertically ];
		          yourself.
	copy := self newToolbarToggleButton
		        label: 'Copy';
		        help: 'Copy';
		        icon: (self iconAt: 3 @ 1);
		        action: [ status beCopying ];
		        yourself.
	oval := self newToolbarToggleButton
		        label: 'Oval';
		        help: 'Draw oval';
		        icon: (self iconAt: 1 @ 2);
		        action: [ status beDrawingOval ];
		        yourself.
	replace := self newToolbarToggleButton
		           label: 'Replace';
		           help: 'Replace color';
		           icon: (self iconAt: 2 @ 2);
		           action: [ status beReplacing ];
		           yourself.
	line := self newToolbarToggleButton
		        label: 'Line';
		        help: 'Draw line';
		        icon: (self iconAt: 3 @ 2);
		        action: [ status beDrawingLine ];
		        yourself.
	draw associatedToggleButtons: {
			erase.
			pick.
			vPaint.
			hPaint.
			rect.
			copy.
			oval.
			replace.
			line }.
	editorToolbar
		addItem: (self newToolbarButton
				 label: 'Undo';
				 help: 'Undo';
				 icon: (self iconAt: 0 @ 0);
				 action: [ self swapUndo ];
				 yourself);
		addItem: pick;
		addItem: draw;
		addItem: erase;
		addItem: rect;
		addItem: oval;
		addItem: line;
		addItem: hPaint;
		addItem: vPaint;
		addItem: replace;
		addItem: copy;
		addItem: (self newToolbarButton
				 label: 'Paste';
				 help: 'Paste';
				 icon: (self iconAt: 0 @ 2);
				 action: [ self paste ];
				 yourself)
]

{ #category : #private }
SpPixelArtEditor >> showFormInfo [

	statusBar pushMessage: ('extent {1}, used colors {2}' format: {
				 editor extent.
				 editor numColors })
]

{ #category : #actions }
SpPixelArtEditor >> showGrid [

	self editorMorph showGrid: true.
	self updateForm
]

{ #category : #private }
SpPixelArtEditor >> showPoint: aPoint [

	statusBar pushMessage: ('point={1}' format: { aPoint })
]

{ #category : #private }
SpPixelArtEditor >> showUsedColors [

	statusBar pushMessage:
		('used colors {1}' format: { editor numColors })
]

{ #category : #accessing }
SpPixelArtEditor >> status [

	^ status
]

{ #category : #accessing }
SpPixelArtEditor >> statusBar [

	^ statusBar
]

{ #category : #private }
SpPixelArtEditor >> swapUndo [

	| tmp |
	status undoForm ifNil: [ ^ self ].
	tmp := editor form.
	editor form: status undoForm.
	status undoForm: tmp.
	self updateForm
]

{ #category : #actions }
SpPixelArtEditor >> toggleEditorBackground [

	self editorMorph color = Color gray
		ifTrue: [
			self editorMorph color: Color lightGray.
			self viewerMorph color: Color lightGray ]
		ifFalse: [
			self editorMorph color = Color lightGray
				ifTrue: [
					self editorMorph color: Color veryLightGray.
					self viewerMorph color: Color veryLightGray ]
				ifFalse: [
					self editorMorph color = Color veryLightGray
						ifTrue: [
							self editorMorph color: Color white.
							self viewerMorph color: Color white ]
						ifFalse: [
							self editorMorph color = Color white
								ifTrue: [
									self editorMorph color: Color gray.
									self viewerMorph color: Color gray ]
								ifFalse: [ self error ] ] ] ].
	self setEditorGridColor.
	self updateForm
]

{ #category : #initialization }
SpPixelArtEditor >> toolsMenu [

	^ self newMenu
		  addGroup: [ :grp |
			  grp
				  addItem: [ :item |
					  item
						  name: 'Set width' localized;
						  action: [ self inputFormWidth ] ];
				  addItem: [ :item |
					  item
						  name: 'Set height' localized;
						  action: [ self inputFormHeight ] ] ];
		  addGroup: [ :grp |
			  grp
				  addItem: [ :item |
					  item
						  name: 'Flip Horizontally' localized;
						  action: [ self flipHorizontally ] ];
				  addItem: [ :item |
					  item
						  name: 'Flip Vertically' localized;
						  action: [ self flipVertically ] ];
				  addItem: [ :item |
					  item
						  name: 'Rotate Left' localized;
						  action: [ self rotateLeft ] ];
				  addItem: [ :item |
					  item
						  name: 'Rotate Right' localized;
						  action: [ self rotateRight ] ] ];
		  addGroup: [ :grp |
			  grp
				  addItem: [ :item |
					  item
						  name: 'Reduce Colors' localized;
						  action: [ self reduceColors ] ];
				  addItem: [ :item |
					  item
						  name: 'Trim form' localized;
						  action: [ self trimForm ] ] ];
		  addGroup: [ :grp |
			  grp
				  addItem: [ :item |
					  item
						  name: 'Reset palette' localized;
						  action: [ self resetPalette ] ];
				  addItem: [ :item |
					  item
						  name: 'Save palette as default' localized;
						  action: [ self savePaletteAsDefault ] ] ];
		  yourself
]

{ #category : #actions }
SpPixelArtEditor >> trimForm [

	| extent1 extent2 |
	self pushUndo.
	extent1 := editor extent.
	editor
		trimVertically;
		trimHorizontally.
	self updateForm.
	extent2 := editor extent.
	statusBar pushMessage: ('extent {1} to {2}' format: {
				 extent1.
				 extent2 })
]

{ #category : #private }
SpPixelArtEditor >> updateForm [

	self editorMorph form: editor form.
	self viewerMorph form: editor form
]

{ #category : #api }
SpPixelArtEditor >> useForm: aForm notifying: aBlock [

	notifyBlock := aBlock.
	editor := self newEditor.
	editor form: aForm deepCopy.
	self reset
]

{ #category : #initialization }
SpPixelArtEditor >> viewMenu [

	^ self newMenu
		  addGroup: [ :grp |
			  grp
				  addItem: [ :item |
					  item
						  name: 'Toggle background color' localized;
						  action: [ self toggleEditorBackground ] ];
				  addItem: [ :item |
					  item
						  name: 'Show grid' localized;
						  action: [ self showGrid ] ];
				  addItem: [ :item |
					  item
						  name: 'Hide grid' localized;
						  action: [ self hideGrid ] ] ];
		  addGroup: [ :grp |
			  grp
				  addItem: [ :item |
					  item
						  name: 'Small size' localized;
						  action: [ self setSmallSize ] ];
				  addItem: [ :item |
					  item
						  name: 'Normal size' localized;
						  action: [ self setNormalSize ] ];
				  addItem: [ :item |
					  item
						  name: 'Large size' localized;
						  action: [ self setLargeSize ] ] ];
		  addGroup: [ :grp |
			  grp
				  addItem: [ :item |
					  item
						  name: 'Show form info' localized;
						  action: [ self showFormInfo ] ] ];
		  yourself
]

{ #category : #accessing }
SpPixelArtEditor >> viewerMorph [

	^ viewerPane morph
]

{ #category : #accessing }
SpPixelArtEditor >> viewerPane [

	^ viewerPane
]
