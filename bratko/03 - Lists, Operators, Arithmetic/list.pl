member(X, [X|_]).
member(X, [_|Tail]) :-
    member(X, Tail).

conc([], List, List).
conc([X|L1], L2, [X|L3]) :-
    conc(L1, L2, L3).

add(X, L, [X|L]).

del(X, [X|L], L).
del(X, [Y|Tail1], [Y|Tail2]) :-
    del(X, Tail1, Tail2).

insert(X, List, BiggerList) :-
    del(X, BiggerList, List).

sublist(S, L) :-
    conc(_, L2, L),
    conc(S, _, L2).
