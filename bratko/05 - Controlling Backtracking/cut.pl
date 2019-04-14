p(1).
p(2) :- !.
p(3).

class(Number, postiive) :-
  Number > 0, !.
class(0, zero) :- !.
class(_, negative).

split([], [], []).
split([N|Numbers], [N|Positives], Negatives) :-
  N >= 0,
  split(Numbers, Positives, Negatives).
split([N|Numbers], Positives, [N|Negatives]) :-
  N < 0,
  split(Numbers, Positives, Negatives).

split_with_cut([], [], []).
split_with_cut([N|Numbers], [N|Positives], Negatives) :-
  N >= 0, !,
  split_with_cut(Numbers, Positives, Negatives).
split_with_cut([N|Numbers], Positives, [N|Negatives]) :-
  split_with_cut(Numbers, Positives, Negatives).
