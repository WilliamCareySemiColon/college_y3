% list predicates
% addTo(X, L, Lnew) where addTo(3, [1,3,0], Lnew) gives Lnew = [4,6,3]
% remove All(X, L, Lnew) where remove All(b, [12, b, sat, 32, a, b, 1], Lnew)
 % gives Lnew = [12, sat, 32, a,1]
 
 addTo(A,L) :-
	
  
% freq(X, L, N)where freq(a, [1, a,4, ba, a], N) gives N = 2

% listMax(L, X)where listMax([2,5,4,0], X) gives X = 5

% makePairs(L, L2)where makePairs([1.3, 2, -1, 0.7], L2) gives L2 = [(1.3, 2.6), (2,4), (
% -1,-2), (0.7,1.4)] where the 2nd value of each pair is double the 1st value.

% mergeLists(L1, L2, L) which merges two already sorted lists L1 and L2 into
% another sorted list L. For example mergeLists([3,5,6,10], [2,7], L)
% gives L = [2,3,5,6,7,10].