ground_term(Term) :-
    atomic(Term), !.
ground_term(Term) :-
    compound(Term),
    Term =.. [_|Args],
    maplist(ground_term, Args).
