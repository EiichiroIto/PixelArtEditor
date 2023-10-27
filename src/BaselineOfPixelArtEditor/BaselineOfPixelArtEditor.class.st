Class {
	#name : #BaselineOfPixelArtEditor,
	#superclass : #BaselineOf,
	#category : #BaselineOfPixelArtEditor
}

{ #category : #baselines }
BaselineOfPixelArtEditor >> baseline: spec [

	spec for: #common do: [
		spec
			package: 'PixelArtEditor';
			package: 'IsometricView'
			with: [ spec requires: #( 'PixelArtEditor' ) ] ]
]

{ #category : #accessing }
BaselineOfPixelArtEditor >> projectClass [

	^ MetacelloCypressBaselineProject
]
