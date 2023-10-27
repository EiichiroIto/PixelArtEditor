Class {
	#name : #IVScene,
	#superclass : #Object,
	#category : #'IsomericView-Examples'
}

{ #category : #examples }
IVScene class >> example1 [

	| obj |
	obj := IVExample new
		       changeOutlineRenderer;
		       changeNormalProjector;
		       extent: 240 @ 240;
		       objects: self new objects yourself.
	obj show
]

{ #category : #examples }
IVScene class >> example2 [

	| obj |
	obj := IVExample new
		       changeOutlineRenderer;
		       changePixelartProjector;
		       extent: 240 @ 240;
		       objects: self new objects yourself.
	obj show
]

{ #category : #examples }
IVScene class >> example3 [

	| obj |
	obj := IVExample new
		       changeSurfaceRenderer;
		       changeNormalProjector;
		       extent: 240 @ 240;
		       objects: self new objects yourself.
	obj show
]

{ #category : #examples }
IVScene class >> example4 [

	| obj |
	obj := IVExample new
		       changeSurfaceRenderer;
		       changePixelartProjector;
		       extent: 240 @ 240;
		       objects: self new objects yourself.
	obj show
]

{ #category : #examples }
IVScene class >> example5 [

	| obj |
	obj := IVExample new
		       changeOutlineRenderer;
		       changeParallelProjector;
		       extent: 240 @ 240;
		       objects: self new objects yourself.
	obj show
]

{ #category : #'instance creation' }
IVScene >> dummySurface [

	^ IVSurface new
		  xMaterial: Color red;
		  yMaterial: Color green;
		  zMaterial: Color blue;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newBox [

	^ IVBox new
]

{ #category : #'instance creation' }
IVScene >> newFrame [

	^ IVFrame new
]

{ #category : #'instance creation' }
IVScene >> newImage [

	^ IVImage new
]

{ #category : #'instance creation' }
IVScene >> newMirror [

	^ IVMirror new
]

{ #category : #'instance creation' }
IVScene >> newSurface [

	^ IVSurface new
]

{ #category : #'instance creation' }
IVScene >> newWoodenFloor [

	^ IVWoodenFloor new
]

{ #category : #'instance creation' }
IVScene >> newXCircle [

	^ IVCircle new
		  plane: #x;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newXCylinder [

	^ IVCylinder new
		  plane: #x;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newXPolyhedron [

	^ IVPolyhedron new
		  plane: #x;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newXRectangle [

	^ IVRectangle new
		  plane: #x;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newYCircle [

	^ IVCircle new
		  plane: #y;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newYCylinder [

	^ IVCylinder new
		  plane: #y;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newYRectangle [

	^ IVRectangle new
		  plane: #y;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newZCircle [

	^ IVCircle new
		  plane: #z;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newZCylinder [

	^ IVCylinder new
		  plane: #z;
		  yourself
]

{ #category : #'instance creation' }
IVScene >> newZPolyhedron [

	^ IVPolyhedron new
		  plane: #z;
		  yourself
]

{ #category : #accessing }
IVScene >> objects [

	self subclassResponsibility
]
