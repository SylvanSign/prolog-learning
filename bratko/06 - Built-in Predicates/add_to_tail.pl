add_to_tail(Item,  [Item|Hole]) :-
  var(Hole).
add_to_tail(Item, [X|Rest]) :-
  nonvar(X),
  add_to_tail(Item, Rest).

member_tail_list(_, List) :-
  var(List), !, fail.
member_tail_list(Item, [Item|_]).
member_tail_list(Item, [_|Rest]) :-
  member_tail_list(Item, Rest).
