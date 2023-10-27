Class {
	#name : #IVSampleCube3,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #objects }
IVSampleCube3 >> cube1 [

	^ self newBox
		  label: 'cube #1';
		  origin: (IVPoint x: 0 y: 0 z: 0);
		  extent: (IVPoint x: 100 y: 100 z: 50);
		  yourself
]

{ #category : #objects }
IVSampleCube3 >> cube2 [

	^ self newBox
		  label: 'cube #1';
		  origin: (IVPoint x: 10 y: 0 z: 0);
		  extent: (IVPoint x: 40 y: 80 z: 30);
		  surface: (self newSurface
				   xMaterial: self cubeXForm;
				   yMaterial: self cubeYForm;
				   "zMaterial: Color blue;"
				   zMaterial: self cubeZForm;
				   yourself);
		  yourself
]

{ #category : #forms }
IVSampleCube3 >> cubeXForm [

	^ (Form extent: 40 @ 30 depth: 32)
		  fillColor: Color paleRed;
		  yourself
]

{ #category : #forms }
IVSampleCube3 >> cubeYForm [

	^ (Form extent: 80 @ 30 depth: 32)
		  fillColor: Color paleGreen;
		  yourself
]

{ #category : #forms }
IVSampleCube3 >> cubeZForm [

	^ (Form extent: 40 @ 80 depth: 32)
		  fillColor: Color paleBlue;
		  yourself
]

{ #category : #accessing }
IVSampleCube3 >> objects [

	^ OrderedCollection new
		  add: self cube2;
		  add: self cube1;
		  yourself
]
