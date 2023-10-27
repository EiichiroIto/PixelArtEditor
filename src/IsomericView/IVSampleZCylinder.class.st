Class {
	#name : #IVSampleZCylinder,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #objects }
IVSampleZCylinder >> cube [

	^ self newBox
		  label: 'cube';
		  origin: (IVPoint x: 0 y: 0 z: 0);
		  extent: (IVPoint x: 30 y: 30 z: 50);
		  yourself
]

{ #category : #objects }
IVSampleZCylinder >> cylinder [

	^ self newZCylinder
		  label: 'cylinder';
		  center: (IVPoint x: 15 y: 15 z: 50);
		  radius: 25;
		  bottomRadius: 20;
		  height: 50;
		  topMaterial: (Color fromHexString: 'ff0000');
		  sideMaterial: (Color fromHexString: '00ff00');
		  yourself
]

{ #category : #accessing }
IVSampleZCylinder >> objects [

	^ OrderedCollection new
		  add: self cylinder;
		  add: self cube;
		  yourself
]
