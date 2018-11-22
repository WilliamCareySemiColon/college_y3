%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%The rules to do with the fwgc algorithm%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
opp(e,w).
opp(w,e).

unsafe(F,X,X,_) :- opp(F,X).
unsafe(F,_,X,X) :- opp(F,X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%moving rules - move(State1, State2).%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% move the wolf
move(state(X,X,G,C), state(Y,Y,G,C)) :- 
    opp(X,Y), 
    not(unsafe(Y,Y,G,C)).

% move the goat
move(state(X,W,X,C), state(Y,W,Y,C)) :- 
    opp(X,Y), 
    not(unsafe(Y,W,Y,C)).

% move the cabbage
move(state(X,W,G,X), state(Y,W,G,Y)) :- opp(X,Y), not(unsafe(Y,W,G,Y)).

% move self only
move(state(X,W,G,C), state(Y,W,G,C)) :- opp(X,Y), not(unsafe(Y,W,G,C)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%End of the rule set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pretty printing code for FWGC solution path and states.
% showPath(Path)
showPath([]) :- nl.

showPath([S|Path]) :- 
    nl,showState(S),
    showPath(Path).


showState(S) :-
    showWest(S), write('|~~~~~~~|'), showEast(S),nl,
    write('    |~~~~~~~|').

showWest(state(F,W,G,C)) :-
    (F == w, write('F'), !; write(' ')),
    (W == w, write('W'), !; write(' ')),
    (G == w, write('G'), !; write(' ')),
    (C == w, write('C'), !; write(' ')).

showEast(state(F,W,G,C)) :-
    (F == e, write('F'), !; true),
    (W == e, write('W'), !; true),
    (G == e, write('G'), !; true),
    (C == e, write('C'), !; true).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%End of the printing part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

% hardcoding the goal state into the programme
goal(state(e,e,e,e)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Solving the state of the alogithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

id_solve(State, Depth, Sol) :- ids_dfs(State, [], Depth, Sol),
		write("Goal is at depth: "),write(Depth),nl,!.
		
id_solve(State, Depth, Sol) :- Depth1 is Depth + 1, id_solve(State,Depth1,Sol).

ids_dfs(X,P,_,[X|P]) :- goal(X).

ids_dfs(X,P,D,Sol) :- D > 0, move(X,Y), not(member(Y,P)), D1 is D - 1, ids_dfs(Y,[X|P],D1,Sol).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test ways to run the programme
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

go:- id_solve(state(w,w,w,w),6,A), reverse(A,A1),showPath(A1).
	