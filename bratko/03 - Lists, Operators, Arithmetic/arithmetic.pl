gcd(X, X, X).
gcd(X, Y, D) :-
    X<Y,
    Y1 is Y-X,
    gcd(X, Y1, D).
gcd(X, Y, D) :-
    Y<X,
    gcd(Y, X, D).

my_length([], 0).
my_length([_|Tail], N) :-
    length(Tail, N1),
    N is N1+1.

max(X, Y, Y) :-
    X=<Y.
max(X, Y, X) :-
    X>Y.

maxlist([X], X).
maxlist([X|Rest], Max) :-
    maxlist(Rest, RestMax),
    max(X, RestMax, Max).

sumlist([], 0).
sumlist([X|Rest], Sum) :-
    sumlist(Rest, RestSum),
    Sum is RestSum+X.

ordered([_]).
ordered([X, Y|Rest]) :-
    X=<Y,
    ordered([Y|Rest]).

sublist(S, L) :-
    append(_, L2, L),
    append(S, _, L2).

subsum([], 0, []).
subsum([X|RestSet], Sum, [X|RestSubset]) :-
    subsum(RestSet, RestSum, RestSubset),
    Sum is RestSum+X.
subsum([_|RestSet], Sum, Subset) :-
    subsum(RestSet, Sum, Subset).

between_exclusive(N1, N2, X) :-
    X is N1+1,
    X<N2.
between_exclusive(N1, N2, X) :-
    N1<N2,
    NewN1 is N1+1,
    between_exclusive(NewN1, N2, X).

between_inclusive(N1, N2, N1) :-
    N1=<N2.
between_inclusive(N1, N2, X) :-
    N1<N2,
    NewN1 is N1+1,
    between_inclusive(NewN1, N2, X).
