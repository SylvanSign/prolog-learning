cube :-
    write('Next item, please:'),
    read(X),
    process(X).

process(stop) :- !.
process(N) :-
    C is N^3,
    write('Cube of '),
    write(N),
    write(' is '),
    write(C),
    nl,
    cube.

bars([]).
bars([N|L]) :-
    stars(N),
    nl,
    bars(L).

stars(N) :-
    N>0,
    write(*),
    N1 is N-1,
    stars(N1).
stars(N) :-
    N=<0.

showfile(N) :-
    read(Term),
    show(Term, N).

show(end_of_file, _) :- !.
show(Term, N) :-
    write(N),
    tab(2),
    write(Term),
    nl,
    N1 is N+1,
    showfile(N1).

findterm(Term) :-
    read(X),
    dif(X, end_of_file),
    (   X=Term, !,
        writeln(Term)
    ;   findterm(Term)
    ).

squeeze :-
    get0(C),
    process_char(C).

process_char(46) :- !,
    put(46).
process_char(32) :- !,
    get(C),
    (   dif(C, 44)
    ->  put(32)
    ;   true
    ),
    process_char(C).
process_char(C) :-
    put(C),
    squeeze.

taxi(X) :-
    name(X, XList),
    name(taxi, TList),
    append(TList, _, XList).  % is word 'taxi' prefix of X?

% Atom starts with Character
starts(Atom, Character) :-
    char_code(Character, Code),
    name(Atom, [Code|_]).

plural(Atom, PluralAtom) :-
    char_code(s, SCode),
    name(Atom, AtomCodes),
    append(AtomCodes, [SCode], PluralAtomCodes),
    name(PluralAtom, PluralAtomCodes).
