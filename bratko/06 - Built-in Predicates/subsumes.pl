:- begin_tests(subsumes).

test(book1) :-
    subsumes(_, c), !.

test(book2) :-
    subsumes(g(_), g(t(_))), !.

test(book3) :-
    subsumes(f(X, X), f(a, b)), !.

:- end_tests(subsumes).

subsumes(Term1, Term2) :-
    var(Term1),
    nonvar(Term2).
subsumes(Term1, Term2) :-
    Term1 =.. [F|Args1],
    Term2 =.. [F|Args2],
    maplist(subsumes, Args1, Args2).
