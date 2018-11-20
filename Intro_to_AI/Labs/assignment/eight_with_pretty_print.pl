%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                      %
%    Eights Puzzle - Specific Predicates               %
%    Eight.pl                                         %
%						                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	



% State represented by list of tile positions
% [t0, t1, t2, t3, t4, t5, t6, t7, t8]
%
%      --->x
%    | 1 2 3
%    | 8   4
%    | 7 6 5
%    y

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 	The goal state and some starting states                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

goal( [(2,2), (1,1), (2,1), (3,1), (3,2), (3,3), (2,3), (1,3), (1,2)] ) .

%depth 4
start4( [(2,2), (1,1), (3,2), (2,1), (3,1), (3,3), (2,3), (1,3), (1,2)] ) .

%depth 5
start5( [(2,3), (1,2), (1,1), (3,1), (3,2), (3,3), (2,2), (1,3), (2,1)] ) .

%depth 6
start6( [(1,3), (1,2), (1,1), (3,1), (3,2), (3,3), (2,2), (2,3), (2,1)] ) .

%depth 7
start7( [(1,2), (1,3), (1,1), (3,1), (3,2), (3,3), (2,2), (2,3), (2,1)] ) .

%depth 8
start8( [(2,2), (1,3), (1,1), (3,1), (3,2), (3,3), (1,2), (2,3), (2,1)] ) .

%depth 18
start18( [(2,2), (2,1), (1,1), (3,3), (1,2), (2,3), (3,1), (1,3), (3,2)] ) .



% predicate to help you choose one of the starting states whose 
% solution paths are at different depths
% start(depth, State)

start( I , X ) :-
        I == 4 , start4( X ) , !
	;
        I == 5 , start5( X ) , !
	;
        I == 6 , start6( X ) , !
	;
        I == 7 , start7( X ) , !
	;
        I == 8 , start8( X ) , !
	;
        I == 18, start18( X ) .



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  move( State1 , State2 )   generates a successor state   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

move( [E | Tiles] , [T| Tiles1] ):-
 	swap( E , T , Tiles , Tiles1 ) .


swap( E , T , [T | Ts] , [E | Ts] ):-
	mandist( E , T , 1 ) .

swap( E , T , [T1 | Ts] , [T1 | Ts1] ):-
	swap( E , T , Ts , Ts1 ) .



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Manhattan Distance - mandist( TilePos1 , TilePos2, Dist )  %
%   is the distance between two tile positions .	           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mandist( (X,Y) , (X1,Y1) , D ):-
	diff( X , X1 , Dx ) ,
	diff( Y , Y1 , Dy ) ,
	D is Dx + Dy .
	
diff( A , B , D ):-
    D is A - B , D > 0 , !
	;
	D is B - A .


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code for pretty printing the solution path and states  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

showPath( [] ) .
showPath( [P | L] ) :-
	showState( P ),
    nl, write('---'),
    showPath( L ).
	

showState([P0, P1, P2, P3, P4, P5, P6, P7, P8]) :-
	member( Y , [1, 2, 3] ),
	nl,
	member( X , [1, 2, 3] ), 
	member( Tile-(X,Y),
 	        [' '-P0, 1-P1, 2-P2, 3-P3, 4-P4, 5-P5, 6-P6, 7-P7, 8-P8] ) ,
	write(' '), write( Tile ) ,
	fail 
	;
	nl, true .




