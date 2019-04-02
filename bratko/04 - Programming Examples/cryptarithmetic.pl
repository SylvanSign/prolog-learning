%   D O N A L D
% + G E R A L D
% -------------
%   R O B E R T
donald([D, O, N, A, L, G, E, R, B, T]) :-
    assign([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [D, O, N, A, L, G, E, R, B, T]),
    100000*D + 10000*O + 1000*N + 100*A + 10*L + D +
    100000*G + 10000*E + 1000*R + 100*A + 10*L + D =:=
    100000*R + 10000*O + 1000*B + 100*E + 10*R + T.

assign(_, []).
assign(Digs, [D|Vars]) :-
    del(D, Digs, Digs1),
    assign(Digs1, Vars).

% Handle generic cryptarithmetic puzzles
puzzle(Letters, List1, List2, List3) :-
    assign([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], Letters),
    list_number(List1, Num1),
    list_number(List2, Num2),
    list_number(List3, Num3),
    Num1 + Num2 =:= Num3.

list_number(List, Num) :-
    reverse(List, Rev),
    list_number_(Rev, Num).
list_number_([], 0).
list_number_([D|Rest], Num) :-
    list_number_(Rest, NumRest),
    Num is D + 10 * NumRest.

del(X, [X|L], L).
del(X, [Y|Tail1], [Y|Tail2]) :-
    del(X, Tail1, Tail2).
