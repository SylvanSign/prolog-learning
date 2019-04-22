:- begin_tests(simplify).

test(simple_atom) :-
  simplify(a, a), !.

test(simple_num) :-
  simplify(1, 1), !.

test(num_sum) :-
  simplify(1+1, 2), !.

test(simple_multi_num_sum) :-
  simplify(1+1+1, 3), !.

test(multi_num_sum) :-
  simplify(1+2+3+4, 10), !.

test('a+b') :-
  simplify(a+b, a+b), !.

% Tests from book
test(book1) :-
  simplify(1+1+a, a+2), !.

test(book2) :-
  simplify(1+a+4+2+b+c, a+b+c+7), !.

test(book3) :-
  simplify(3+x+x, 2*x+3), !.

:- end_tests(simplify).

:- op(500, xfy, user:(+)).

simplify(Exp, Simple) :-
  split(Exp, Atoms, Nums),
  sumlist(Nums, NumSum),
  % sort ascending, preserving duplicates
  sort(0, @=<, Atoms, SortedAtoms),
  combine_atoms(SortedAtoms, CombinedAtoms),
  append(CombinedAtoms, [NumSum], Syms),
  unparse(Syms, Simple).

split(X+Y, [X|Atoms], Nums) :-
  atom(X),
  split(Y, Atoms, Nums).
split(X+Y, Atoms, [X|Nums]) :-
  number(X),
  split(Y, Atoms, Nums).
split(X, [X], []) :-
  atom(X).
split(X, [], [X]) :-
  number(X).

combine_atoms([], []).
combine_atoms([A], [A]).
combine_atoms([A,A|Rest], Combined) :-
  combine_atoms([2*A|Rest], Combined).
combine_atoms([C*A,A|Rest], Combined) :-
  NewC is C + 1,
  combine_atoms([NewC*A|Rest], Combined).
combine_atoms([A,B|Rest], [A|RestCombined]) :-
  atom(A),
  atom(B),
  dif(A, B),
  combine_atoms([B|Rest], RestCombined).
combine_atoms([C*A,B|Rest], [C*A|RestCombined]) :-
  atom(A),
  atom(B),
  dif(A, B),
  combine_atoms([B|Rest], RestCombined).

unparse([X], X).
unparse([X|Xs], X) :-
  unparse(Xs, 0).
unparse([X|Xs], X+Y) :-
  unparse(Xs, Y),
  Y \= 0.
