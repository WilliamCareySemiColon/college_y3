% lab test for prolog 07-12-18

% lab test done by william Carey C16315253

% --------------------------------------------------------------
% question one
% sample objects
age(Jack,24).
fitnessLevel(Jack, excellent).

father(Dillon,Dim).
isImportant(Dillon).

% rules for the programme
footballer(N,A) :- 
	(
		fitnessLevel(N,excellent), age(N,Z), Z > 17, Z < 33
		;
		fitnessLevel(N,good), driveACar(N,true), drinksAlcohol(N,reasonable)
		;
		isImportant(B),father(B,N)
	), A = eligible.
	
footballer(N,A) :- fitnessLevel(N,bad),
	(
		age(Z), Z < 18, Z > 32
		;
		driveACar(N,false), drinksAlcohol(N,unreasonable)
	), A = ineligible.
	
fitnessLevel(_,A) :- bleep(D),
	(
		D > 8, A = excellent
		;
		D > 4, A = good
		;
		A = bad
	).
	
drinksAlcohol(D,A) :- age(Z), drinks(D,Y),
	( Z > 18,  Y < 5, A = reasonable
	;
	A = unreasonable
	).
% -------------------------------------------------------

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
	
% question 3

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

% question 4
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