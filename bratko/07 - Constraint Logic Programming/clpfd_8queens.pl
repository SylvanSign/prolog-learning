solution(Ys) :-
    Ys = [_,_,_,_,_,_,_,_],
    Ys ins 1..8,
    all_distinct(Ys),
    safe(Ys),
    labeling([], Ys).

safe([]).
safe([Y|Ys]) :-
    no_attack(Y, Ys, 1),
    safe(Ys).

no_attack(_, [], _).
no_attack(Y1, [Y2|Ys], D) :-
    D #\= Y1-Y2,
    D #\= Y2-Y1,
    D1 is D + 1,
    no_attack(Y1, Ys, D1).
