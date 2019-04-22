set_difference([], _, []).
set_difference([X|RestX], Bad, Difference) :-
  member(X, Bad),
  set_difference(RestX, Bad, Difference).
set_difference([X|RestX], Bad, [X|Difference]) :-
  \+ member(X, Bad),
  set_difference(RestX, Bad, Difference).


unifiable([], _, []).
unifiable([X|Rest], Term, Unifiable) :-
  not(X = Term), !,
  unifiable(Rest, Term, Unifiable).
unifiable([X|Rest], Term, [X|Unifiable]) :-
  unifiable(Rest, Term, Unifiable).
