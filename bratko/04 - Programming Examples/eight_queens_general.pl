solution(N, S) :-
    gen(1, N, Dxy),
    Nu1 is 1-N,
    Nu2 is N-1,
    gen(Nu1, Nu2, Du),
    Nv2 is N+N,
    gen(2, Nv2, Dv),
    sol(S, Dxy, Dxy, Du, Dv).

time_solutions(N, _) :-
    statistics(runtime, _),
    solution(N, _),
    fail.

time_solutions(_, T) :-
    statistics(runtime, [_, T]).

gen(N, N, [N]).
gen(N1, N2, [N1|List]) :-
    N1<N2,
    M is N1+1,
    gen(M, N2, List).

sol([], [], _, _, _).
sol([Y|Ylist], [X|Dx1], Dy, Du, Dv) :-
    del(Y, Dy, Dy1),
    U is X-Y,
    del(U, Du, Du1),
    V is X+Y,
    del(V, Dv, Dv1),
    sol(Ylist, Dx1, Dy1, Du1, Dv1).

del(Item, [Item|List], List).
del(Item, [First|List], [First|List1]) :-
    del(Item, List, List1).
