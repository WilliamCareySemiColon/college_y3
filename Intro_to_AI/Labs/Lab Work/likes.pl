% Author: William
% Date: 25/09/18

man(jim).
man(mary).

mortal(X) :- man(X).
likes(X,A) :- man(X),dog(A).

dog(rex).
dog(lassie).

hates(X,A) :- cat(X), dog(A).

cat(tom).
cat(bill).