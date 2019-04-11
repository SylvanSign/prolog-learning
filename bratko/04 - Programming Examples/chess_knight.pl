jump_change(2, 1).
jump_change(2, -1).
jump_change(-2, 1).
jump_change(-2, -1).

jump(X/Y, Jx/Jy) :-
    (
        jump_change(Xdiff, Ydiff) ;
        jump_change(Ydiff, Xdiff)
    ),
    Jx is X + Xdiff,
    between(1, 8, Jx),
    Jy is Y + Ydiff,
    between(1, 8, Jy).

knightpath([X/Y]) :-
    between(1, 8, X),
    between(1, 8, Y).
knightpath([X1/Y1, X2/Y2|Rest]) :-
    jump(X1/Y1, X2/Y2),
    knightpath([X2/Y2|Rest]).

specific_path(P) :-
    RestMoves = [_, _, _/8],
    member(5/4, RestMoves),
    append([2/1, _], RestMoves, P),
    knightpath(P).
