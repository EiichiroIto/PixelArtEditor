Class {
	#name : #IVSampleFrame,
	#superclass : #IVScene,
	#category : #'IsomericView-Examples'
}

{ #category : #objects }
IVSampleFrame >> frame1 [

	^ self newFrame
		  label: 'frame #1';
		  origin: (IVPoint x: 6 y: 133 z: 6);
		  extent: (IVPoint x: 30 y: 2 z: 50);
		  frameWidth: 2;
		  surface: (self newSurface
				   yMaterial: (Color fromHexString: '43343f');
				   xMaterial: (Color fromHexString: '43343f');
				   zMaterial: (Color fromHexString: '43343f');
				   yourself);
		  yourself
]

{ #category : #accessing }
IVSampleFrame >> objects [

	^ OrderedCollection new
		  add: self frame1;
		  yourself
]
