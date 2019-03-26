:- op(400, xfx, was).
:- op(300, xfx, of).
:- op(200, fx, the).

jake was the glue of the group.

t(0 + 1, 1 + 0).
t(X + 0 + 1, X + 1 + 0).
t(X + 1 + 1, Z) :-
    t(X + 1, X1),
    t(X1 + 1, Z).


:- op(600, xfx, in).
:- op(600, fx, concatenating).
:- op(600, fx, deleting).
:- op(500, xfx, gives).
:- op(400, xfx, from).
:- op(300, xfx, and).

X in [X|_].
X in [_|Tail] :-
    X in Tail.

concatenating [] and List gives List.
concatenating [X|L1] and L2 gives [X|L3] :-
    concatenating L1 and L2 gives L3.

deleting X from [X|L] gives L.
deleting X from [Y|Tail1] gives [Y|Tail2] :-
    deleting X from Tail1 gives Tail2.
