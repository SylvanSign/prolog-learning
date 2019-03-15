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

ancestor(Ancestor, Successor) :-
    parent(Ancestor, Successor).
ancestor(Ancestor, Successor) :-
    parent(Ancestor, Intermediate),
    ancestor(Intermediate, Successor).
