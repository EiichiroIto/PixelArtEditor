Class {
	#name : #IVSampleCube2,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #objects }
IVSampleCube2 >> cube1 [

	^ self newBox
		  label: 'cube #1';
		  origin: (IVPoint x: 0 y: 0 z: 0);
		  extent: (IVPoint x: 50 y: 100 z: 10);
		  yourself
]

{ #category : #objects }
IVSampleCube2 >> cube2 [

	^ self newBox
		  label: 'cube #1';
		  origin: (IVPoint x: 20 y: 50 z: 0);
		  extent: (IVPoint x: 20 y: 30 z: 10);
		  surface: self dummySurface;
		  yourself
]

{ #category : #accessing }
IVSampleCube2 >> objects [

	^ OrderedCollection new
		  add: self cube1;
		  add: self cube2;
		  yourself
]
