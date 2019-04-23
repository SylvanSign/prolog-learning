cube :-
  write('Next item, please:'),
  read(X),
  process(X).

process(stop) :- !.
process(N) :-
  C is N^3,
  write('Cube of '), write(N), write(' is '),
  write(C), nl,
  cube.

bars([]).
bars([N|L]) :-
  stars(N), nl,
  bars(L).

stars(N) :-
  N > 0,
  write(*),
  N1 is N - 1,
  stars(N1).
stars(N) :-
  N =< 0.

showfile(N) :-
  read(Term),
  show(Term, N).

show(end_of_file, _) :- !.
show(Term, N) :-
  write(N), tab(2), write(Term), nl,
  N1 is N + 1,
  showfile(N1).

findterm(Term) :-
  read(X),
  dif(X, end_of_file),
  (X = Term, !,
  writeln(Term);
  findterm(Term)).
