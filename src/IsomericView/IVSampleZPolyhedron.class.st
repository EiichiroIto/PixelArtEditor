Class {
	#name : #IVSampleZPolyhedron,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #accessing }
IVSampleZPolyhedron >> objects [

	^ OrderedCollection new
		  add: self polyhedron1;
		  yourself
]

{ #category : #objects }
IVSampleZPolyhedron >> polyhedron1 [

	^ self newZPolyhedron
		  origin: (IVPoint x: 10 y: 10 z: 20);
		  height: 10;
		  polygon: {
				  (IVPoint x: 0 y: 0 z: 0).
				  (IVPoint x: -10 y: 10 z: 0).
				  (IVPoint x: 10 y: 40 z: 0).
				  (IVPoint x: 20 y: 30 z: 0) };
		  visibleVertices: #( 1 2 3 );
		  otherColors: {
				  Color green.
				  Color blue };
		  topMaterial: Color red;
		  yourself
]
