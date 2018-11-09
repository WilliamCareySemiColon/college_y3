% question one - footballers that are eligible

% Any person is eligible for the local football team
% if they are aged between 18 and 32 inclusive and 
% their fitness level is excellent. 

% Someone whose fitness level is good and who drives a car
% and who drink alcohol either not at all or moderately
% is also eligible. 

% Finally someone is eligible if their father is important, 
% no matter what their fitness level. 

% Age restrictions apply to all candidates
% Use predicates like person(name, age, gender
% , fitness_level), eligible(Name),drives(name, carType)
% , isImportant(name), drinks(name, level). 

% --------------------------------------------------------------
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
	
drinksAlcohol(D,A) :- age(Z), drinks(D,Y)
	( Z > 18,  Y < 5, A = reasonable
	;
	A = unreasonable
	).
% -------------------------------------------------------