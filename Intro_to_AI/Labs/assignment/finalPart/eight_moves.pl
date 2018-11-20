%  Code for generating successor states for 8-puzzle
% move(CurrentSate, NewState)

% 8-puzzle state represented by a list of 9 co-ordinates as shown below

move( [E | Tiles] , [T| Tiles1] ):-
 	swap( E , T , Tiles , Tiles1 ) .

swap( E , T , [T | Ts] , [E | Ts] ):-
	mandist( E , T , 1 ) .

swap( E , T , [T1 | Ts] , [T1 | Ts1] ):-
	swap( E , T , Ts , Ts1 ).

    
mandist( (X,Y) , (X1,Y1) , D ):-
	diff( X , X1 , Dx ) ,
	diff( Y , Y1 , Dy ) ,
	D is Dx + Dy .
	
diff( A , B , D ):-
    D is A - B , D > 0 , !
	;
	D is B - A .

    
% Some sample staring states with varying number of steps away from 
% the goal state
% State = [t0, t1, t2, t3, t4, t5, t6, t7, t8]

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

% goal(sate) - write yourself