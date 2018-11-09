% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% question 2

% Given the following nonsensical facts about 1
% - way cycling and moped (small motorbike) lanes

bicycleLane(dublin, kilkenny, 120).
bicycleLane(dublin, carlow, 80).
bicycleLane(kilkenny, waterford, 85).
bicycleLane(mallow, carlow, 110).
bicycleLane(cork, mallow, 38).
bicycleLane(waterford, youghal, 110).
bicycleLane(youghal, cork, 30).
bicycleLane(dublin, athlone, 105).
bicycleLane(athlone, limerick, 135).
bicycleLane(limerick, cork, 75).

moped(dublin, galway, 200).
moped(galway, limerick, 110).
moped(limerick, ennis, 30).
moped(limerick, cork, 95).

canGoFromTo(dublin,kilkenny).
canGoFromTo(mallow,dublin).

canGoFromTo(A,B) :- 
	( bicycleLane(A,B,C)
	;
	moped(A,B,C)
	).
	
canGoFromTo(A,B) :- 
	( bicycleLane(A,C,D)
	;
	moped(A,C,D)
	), canGoFromTo(C,B),
	C != A.
	
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
% part 3333333333333333333333333333333333333333333333333333333
canGoFromTo(A,B,D) :- 
	( bicycleLane(A,B,C)
	;
	moped(A,B,C)
	), D is C.
	
canGoFromTo(A,B, Y) :- 
	( bicycleLane(A,C,D)
	;
	moped(A,C,D)
	), canGoFromTo(C,B, Z),
		C != A,
		Y is Z + D.
% part 3333333333333333333333333333333333333333333333333333333

% 4444444444444444444444444444444444444444444444444444444444444

canGoFromTo(A,B,D, R) :- 
	( bicycleLane(A,B,C)
	;
	moped(A,B,C)
	), D is C, R = B.
	
canGoFromTo(A,B,Y, R) :- 
	( bicycleLane(A,C,D)
	;
	moped(A,C,D)
	), canGoFromTo(C,B,Z, R1),
		C != A,
		Y is Z + D, 
		R is [] + R1.

% 4444444444444444444444444444444444444444444444444444444444444
