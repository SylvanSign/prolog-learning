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

permutation([], []).
permutation([X|L], P) :-
    permutation(L, L1),
    insert(X, L1, P).


evenlength([]).
evenlength([_, _|Rest]) :-
    evenlength(Rest).

oddlength([_]).
oddlength([_, _|Rest]) :-
    oddlength(Rest).

reverse([], []).
reverse([X|Rest], Rev) :-
    reverse(Rest, RestRev),
    conc(RestRev, [X], Rev).

palindrome(L1) :-
    reverse(L1, L1).

shift([X|Rest], L2) :-
    conc(Rest, [X], L2).

means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(9, nine).
means(10, ten).

translate([], []).
translate([Num|RestNum], [Word|RestWord]) :-
    means(Num, Word),
    translate(RestNum, RestWord).

subset([], []).
subset([X|RestSet], [X|RestSub]) :-
    subset(RestSet, RestSub).
subset([_|RestSet], Subset) :-
    subset(RestSet, Subset).

dividelist([], [], []).
dividelist([X], [X], []).
dividelist([X, Y|Rest], [X|Rest1], [Y|Rest2]) :-
    dividelist(Rest, Rest1, Rest2).

equal_length([], []).
equal_length([_|Rest1], [_|Rest2]) :-
    equal_length(Rest1, Rest2).

flatten([], []).
flatten([X|Rest], Flat) :-
    flatten(X, FlatX),
    flatten(Rest, RestFlat),
    append(FlatX, RestFlat, Flat).
flatten([X|Rest], [X|RestFlat]) :-
    X\=[],
    X\=[_|_],
    flatten(Rest, RestFlat).
