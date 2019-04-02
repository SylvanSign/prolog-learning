solution(Queens) :-
    permutation([1, 2, 3, 4, 5, 6, 7, 8], Queens),
    safe(Queens).

time_solutions(_) :-
    statistics(runtime, _),
    solution(_),
    fail.

time_solutions(T) :-
    statistics(runtime, [_, T]).

permutation([], []).
permutation(List, [Head|Tail]) :-
    del(Head, List, List1),
    permutation(List1, Tail).

del(Item, [Item|List], List).
del(Item, [First|List], [First|List1]) :-
    del(Item, List, List1).

safe([]).
safe([Queen|Others]) :-
    safe(Others),
    noattack(Queen, Others, 1).

noattack(_, [], _).
noattack(Y, [Y1|Ylist], Xdist) :-
    Y1-Y=\=Xdist, % Not upward diagonal attack
    Y-Y1=\=Xdist, % Not downward diagonal attack
    Dist1 is Xdist+1,
    noattack(Y, Ylist, Dist1).
