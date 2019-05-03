maketable :-
    L=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    member(X, L),
    member(Y, L),
    Z is X*Y,
    assert(product(X, Y, Z)),
    fail.

removetable :-
    retract(product(_, _, _)),
    fail.

removetable_where_product_0 :-
    retract(product(_, _, 0)),
    fail.

my_copy_term(Term, Copy) :-
    asserta(term_to_copy(Term)),
    retract(term_to_copy(Copy)).
