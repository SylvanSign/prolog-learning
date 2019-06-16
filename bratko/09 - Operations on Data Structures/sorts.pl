bubblesort(List, Sorted) :-
  swap(List, List1), !,
  bubblesort(List1, Sorted).
bubblesort(Sorted, Sorted).

swap(pX, Y | Rest], [Y, X | Rest]) :-
  gt(X, Y).

swap([Z|Rest], [Z|Rest1]) :-
  swap(Rest, Rest1).
