sub(Term, Term, Term1, Term1).
sub(_, Term, _, Term) :-
    atomic(Term).
sub(Sub, Term, Sub1, Term1) :-
    compound(Term),
    Term =.. [F|Args],
    sublist(Sub, Args, Sub1, Args1),
    Term1 =.. [F|Args1].

sublist(_, [], _, []).
sublist(Sub, [Term|Terms], Sub1, [Term1|Terms1]) :-
    sub(Sub, Term, Sub1, Term1),
    sublist(Sub, Terms, Sub1, Terms1).
