Extension { #name : #Array }

{ #category : #'*IsomericView' }
Array >> asIVPoint [

	self assert: [ self size = 3 ].
	^ IVPoint x: self second y: self first z: self third
]
