Class {
	#name : #IVSampleXCylinder,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #objects }
IVSampleXCylinder >> cube [

	^ self newBox
		  label: 'cube';
		  origin: (IVPoint x: 0 y: 0 z: 0);
		  extent: (IVPoint x: 30 y: 50 z: 50);
		  yourself
]

{ #category : #objects }
IVSampleXCylinder >> cylinder [

	^ self newXCylinder
		  label: 'cylinder';
		  center: (IVPoint x: 0 y: 25 z: 25);
		  radius: 25;
		  bottomRadius: 20;
		  height: 30;
		  topMaterial: (Color fromHexString: 'ff0000');
		  sideMaterial: (Color fromHexString: '00ff00');
		  yourself
]

{ #category : #accessing }
IVSampleXCylinder >> objects [

	^ OrderedCollection new
		  add: self cylinder;
		  add: self cube;
		  yourself
]
