add_at_end(List-[Item|Rest], Item, List-Rest).

reverse(L-Z, R-R) :- % empty list
  L == Z, !.
reverse([X|L]-Z, RL-RZ) :-
  reverse(L-Z, RL-[X|RZ]).

max([X|Rest], Max) :-
  max(Rest, X, Max).

max([], Max, Max).
max([X|Rest], MaxSoFar, Max) :-
  X #> MaxSoFar,
  max(Rest, X, Max).
max([X|Rest], MaxSoFar, Max) :-
  X #=< MaxSoFar,
  max(Rest, MaxSoFar, Max).
