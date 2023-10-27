Class {
	#name : #IVSampleYCylinder,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #objects }
IVSampleYCylinder >> cube [

	^ self newBox
		  label: 'cube';
		  origin: (IVPoint x: 0 y: 0 z: 0);
		  extent: (IVPoint x: 50 y: 30 z: 50);
		  yourself
]

{ #category : #objects }
IVSampleYCylinder >> cylinder [

	^ self newYCylinder
		  label: 'cylinder';
		  center: (IVPoint x: 25 y: 0 z: 25);
		  radius: 25;
		  bottomRadius: 20;
		  height: 30;
		  topMaterial: (Color fromHexString: 'ff0000');
		  sideMaterial: (Color fromHexString: '00ff00');
		  yourself
]

{ #category : #accessing }
IVSampleYCylinder >> objects [

	^ OrderedCollection new
		  add: self cylinder;
		  add: self cube;
		  yourself
]
