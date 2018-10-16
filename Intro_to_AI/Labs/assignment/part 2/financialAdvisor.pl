% File created by William Carey
% Date : 13-10-2018
% A financial advisor designed on a few rules to be implemented
% the savings account and the income account are to be taken 
% into account and this will determine what we advide them to
% with their investments

% The rules to be implemented

% 1
% savingsAccount(inadequate) -> investment(savings)

investment(savings) :- savingsAccount(inadequate) , income(_).

% 2
% savingsAccount(adequate) and income(adequate) -> investment(stocks)

investment(stocks) :- savingsAccount(adequate) , income(adequate).

% 3
% savingsAccount(adequate) and income(inadequate) -> investment(combo)

investment(combo) :- savingsAccount(adequate) , income(inadequate).

% 4
% for all x that have an amount saved and there exist dependent y 
% that have savings where the amount x has saved is greater than the 
% amount y has saved, the savings account is adequate 

savingsAccount(adequate) :- amountSaved(X), dependent(Y),
		    minsavings(Y, M), X >= M.

% 5
% for all x that have an amount saved and there exist dependent y 
% that have savings where the amount x has saved is not greater than the 
% amount y has saved, the savings account is inadequate

savingsAccount(inadequate) :- amountSaved(X), dependent(Y),
								minsavings(Y, M), X < M.
								
minsavings(Deps, Min) :- Min is 5000 * Deps.

% 6
% for all x earnings that is steady and the dependents y where x has
% greater earnings is greater than Y, the income is adequate

income(adequate) :- earnings(Amount, steady),
					dependent(D), minincome(D, Min), Amount >= Min.

% 7
% for all x earnings that is steady and the dependents y where x has
% not greater earnings is greater than Y, the income is inadequate

income(inadequate) :- earnings(Amount, steady),
				dependent(D), minincome(D, Min), Amount < Min.
				
minincome(Y, Min) :- Min is 14000 +(4000 * Y).

% 8
% for all x earnings that is not steady the income is inadequate

income(inadequate) :- earnings(_, unsteady).

amountSaved(22000).
earnings(25000, steady).
dependent(3).


% sample function 

go :-  
	openingMessage,nl,
	getAmount,
	getEarnings,
	getDependents,
	write('based off the information you provided'), nl,
	(
		income(A), write('Your income is '), write(A),nl,
		savingsAccount(B), write('Your savings is '), write(B), nl,
		investment(C), write('Therefore, you should invest into a '), write(C), 
		write(' account')
	;
		writeln('I cannot advise you what to do as the information is insufficient')
	),
	 cleanInputs.
		
	
openingMessage :- 
		write('Welcome to the financial advisor programme'),nl, 
		write('I will advise you based on a few questions how you should invest your finance').


getAmount :-
	write('How much was saved under your account: '),
	read(I),
	assert(amountSaved(I)).
	
getEarnings :-
	write('What is your earnings currently per year: '),
	read(I),
	write('Write using either word how to describe your income - steady / unsteady : '),
	read(J),
	assert(earnings(I,J)).
	
getDependents :-
	write('How many dependents do you work with: '),
	read(I),
	assert(dependent(I)).
	
cleanInputs :- 
    retractall(environment(_)),
    retractall(job(_)),
    retractall(feedback(_)).