Class {
	#name : #IVSampleCircle1,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #objects }
IVSampleCircle1 >> cube [

	^ self newBox
		  label: 'cube';
		  origin: (IVPoint x: 0 y: 0 z: 0);
		  extent: (IVPoint x: 100 y: 100 z: 100);
		  surface: (self newSurface
				   xMaterial: (Color fromHexString: 'ffaaaa');
				   yMaterial: (Color fromHexString: 'aaffaa');
				   zMaterial: (Color fromHexString: 'aaaaff');
				   yourself);
		  yourself
]

{ #category : #accessing }
IVSampleCircle1 >> objects [

	^ OrderedCollection new
		  add: self cube;
		  add: self zCircle;
		  add: self xCircle;
		  add: self yCircle;
		  yourself
]

{ #category : #objects }
IVSampleCircle1 >> xCircle [

	^ self newXCircle
		  label: 'x-circle';
		  center: (IVPoint x: 0 y: 50 z: 50);
		  radius: 50;
		  topMaterial: (Color fromHexString: '88dd88');
		  yourself
]

{ #category : #objects }
IVSampleCircle1 >> yCircle [

	^ self newYCircle
		  label: 'y-circle';
		  center: (IVPoint x: 50 y: 0 z: 50);
		  radius: 50;
		  topMaterial: (Color fromHexString: '8888dd');
		  yourself
]

{ #category : #objects }
IVSampleCircle1 >> zCircle [

	^ self newZCircle
		  label: 'z-circle';
		  center: (IVPoint x: 50 y: 50 z: 100);
		  radius: 50;
		  topMaterial: (Color fromHexString: 'dd8888');
		  yourself
]
