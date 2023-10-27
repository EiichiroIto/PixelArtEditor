Class {
	#name : #IVSampleXPolyhedron,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #accessing }
IVSampleXPolyhedron >> objects [

	^ OrderedCollection new
		  add: self polyhedron1;
		  yourself
]

{ #category : #objects }
IVSampleXPolyhedron >> polyhedron1 [

	^ self newXPolyhedron
		  origin: (IVPoint x: 100 y: 0 z: 20);
		  height: 5;
		  polygon: {
				  (IVPoint x: 0 y: 0 z: 0).
				  (IVPoint x: 0 y: 0 z: 15).
				  (IVPoint x: 10 y: 22 z: 15).
				  (IVPoint x: 10 y: 22 z: 0) };
		  visibleVertices: #( 1 2 3 );
		  otherColors: {
				  Color green.
				  Color blue };
		  topMaterial: Color red;
		  yourself
]
