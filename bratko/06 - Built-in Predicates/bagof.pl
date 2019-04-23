subset([], []).
subset([X|RestSet], [X|RestSub]) :-
    subset(RestSet, RestSub).
subset([_|RestSet], Subset) :-
    subset(RestSet, Subset).

powerset(Set, Subsets) :-
  bagof(Subset, subset(Set, Subset), Subsets).

my_copy_term(Term, Copy) :-
  bagof(X, X = Term, [Copy]).
