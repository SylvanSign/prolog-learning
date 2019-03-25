parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

male(tom).
male(bob).
male(jim).

female(pam).
female(liz).
female(ann).
female(pat).

mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

grandparent(GrandParent, Grandchild) :-
    parent(GrandParent, Parent),
    parent(Parent, Grandchild).

sister(Sister, Sibling) :-
    parent(Parent, Sister),
    parent(Parent, Sibling),
    female(Sister),
    dif(Sister, Sibling).

anc1(X, Y) :-
    parent(X, Y).
anc1(X, Y) :-
    parent(X, Z),
    anc1(Z, Y).

anc2(X, Y) :-
    parent(X, Z),
    anc2(Z, Y).
anc2(X, Y) :-
    parent(X, Y).

anc3(X, Y) :-
    parent(X, Y).
anc3(X, Y) :-
    anc3(Z, Y),
    parent(X, Z).

anc4(X, Y) :-
    anc4(Z, Y),
    parent(X, Z).
anc4(X, Y) :-
    parent(X, Y).
